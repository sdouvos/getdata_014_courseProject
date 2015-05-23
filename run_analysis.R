##Data Set Path
relative_path <- "../"
dir_path <- "UCI HAR Dataset"
data_path <- file.path(relative_path,dir_path)
test_path <- file.path(data_path,"test")
train_path <- file.path(data_path,"train")

##set the Files names that we need from Test directory
testFiles <- list.files(test_path,pattern = ".txt$")
#testFiles <- list.files(test_path,pattern = ".txt$",full.names = TRUE)
##set the Files names that we need from Train directory
trainFiles <- list.files(train_path, pattern= ".txt$")
#trainFiles <- list.files(train_path, pattern= ".txt$",full.names = TRUE)
##set the File name that we need for Features
featuresFile <- file.path(data_path,"feature.txt")

##Reading these Files
#dataTestFiles <- lapply(testFiles, read.table)

##Reading and assign Test Files in DataFrames as
# Test_DF_
for( i in testFiles){
 print(i) 
 assign(paste0("DF_",i),read.table(file.path(test_path,i)))
}
##Reading these Files
for( i in testFiles){
  print(i) 
  assign(paste0("DF_",i),read.table(file.path(test_path,i)))
}


