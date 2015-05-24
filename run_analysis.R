## Requirements
require(dplyr)
require(plyr)
require(tools)
relative_path <- "././"



##  set Data Path
dir_path <- "UCI HAR Dataset"
data_path <- file.path(relative_path,dir_path)
test_path <- file.path(data_path,"test")
train_path <- file.path(data_path,"train")

##  set the Files names that we need from Test directory with pattern to get only .txt
testFiles <- list.files(test_path,pattern = ".txt$")
##  set the Files names that we need from Train directory
trainFiles <- list.files(train_path, pattern= ".txt$")

##  set the File name that we need for Features
featuresFile <- file.path(data_path,"features.txt")
##  create features data frame
features <- read.table(featuresFile,col.names=c("feature_id","feature_name"))

##  set the File name that we need for Activities
activitiesFile <- file.path(data_path,"activity_labels.txt")
##  create activities data frame
activities <- read.table(activitiesFile,col.names=c("activity_id","activity_name"))



##########            Merging       ############
##  function which read files from a list
##  and return merged data frame with all Variables as column names
mergeFiles <- function(aFiles,aPath){
  for( i in aFiles){
    ##get the filename without extention
    DF_Name <- file_path_sans_ext(i)
    ##check if data frame exists
    ##if not then we set this as the first data frame
    ## naming accordingly the the column names of each data frame using getColnames function
    if(!exists("dataSet")){
      dataSet <- read.table(file.path(aPath,i))
      colnames(dataSet) <- getColnames(i)
      
    }
    else{
      temp_dataset <- read.table(file.path(aPath,i))
      colnames(temp_dataset) <- getColnames(i)
      ##combine all data frames in one
      dataSet<-cbind(dataSet, temp_dataset)
      rm(temp_dataset)
    }
  }
  rm(DF_Name)
  dataSet 
}

##  get the apropriate Column name for each filena which imported
getColnames <- function(aFilename) {
  #return features names as columns
  if(grepl(pattern="^X_",aFilename)){
    features[["feature_name"]]
  }
  ##return activity columns
  else if(grepl(pattern="^y_",aFilename)){
    c("activity_id")
  }
  ##return activities columns
  else if(grepl(pattern="^subject_",aFilename)){
    c("subject_id")
  }
}

##  1  merge training & the test sets
##  to create one data set.

##  1.A Merging the training set
trainDataSet <- mergeFiles(trainFiles,train_path)

##  1.B Merging the test set
testDataSet <- mergeFiles(testFiles,test_path)

##  1.C final merging between 2 datasets
finalData <- rbind(trainDataSet,testDataSet);
################################################


##########            Extract       ############
##  2 Extracts only the measurements on the 
##  mean and standard deviation for 
##  each measurement.

## assign in indexes variable the mapping of the columns that we want with function getIndexes
indexes <- getIndexes(finalData)

##return the logical incicators 
getIndexes <- function(aFinalData){
  pattern <- "activity_id|subject_id|mean\\(\\)|std\\(\\)"
  grepl(pattern = pattern,colnames(aFinalData))
}

finalData <- finalData[indexes]
################################################


##########          Description     ############
##  3 Uses descriptive activity names to name 
##  the activities in the data set

## use join to bind the 2 datasets by "activity_id
finalData <- join(finalData,activities,by="activity_id")
################################################


##########          Labels          ############
##  4 Appropriately labels the data set with 
##  descriptive variable names

## function which returnes the appropriate column names for the column names of data frame that we have inserted
getLabeled <- function(aColnames){
  for(i in 1: length(aColnames)){    
    aColnames[i] <- gsub("^t","time",aColnames[i])
    aColnames[i] <- gsub("^f","freq",aColnames[i])
    aColnames[i] <- gsub("std\\(\\)","Std",aColnames[i],ignore.case=TRUE)
    aColnames[i] <- gsub("mean\\(\\)","Mean",aColnames[i],ignore.case=TRUE)
    aColnames[i] <- gsub("BodyBody","Body",aColnames[i],ignore.case=TRUE)
  }
  aColnames
}
##  create a 2nd data frame labeledData
labeledData <- finalData
##  replace the column names
colnames(labeledData) <- getLabeled(colnames(labeledData))
################################################

##########          Avg             ############
##  5 Creation of data set with the average of 
##  each variable for each activity
##  and each subject

##  formula -> . means all columns of grouping by variables 
##  after ~ in data set: finalData
##  mean function
avgSet <- aggregate(. ~ subject_id + activity_id + activity_name,finalData,mean)
write.table(avgSet, file = "avgSet.txt",row.name=FALSE)
################################################

 
