Getting and Cleaning Data
========================================

## Targets
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Installation
* Donwload the project.
* Download the raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip it(name:"UCI HAR Dataset"). You have to delete the zip file after this step.
  The directory structure should look like this or you have to set relative_path variable in script run_analysis.R
 
 ```
    ├── UCI HAR Dataset
    │   ├── README.txt
    │   ├── activity_labels.txt
    │   ├── features.txt
    │   ├── features_info.txt
    │   ├── test/
    │   └── train/
    └── GitHub
    	└── getdata_014_courseProject
    		├── README.md
    		├── CodeBook.md
    		└── run_analysis.R
    
```

**Dependencies**
The script `run_analysis.R` depends on the libraries `dplyr`,`plyr` and `tools`. You have to install them.
    
**Running the Script** 
* According the shape above, the right relative_path is the predefined in script run_analysis.R, otherwise you have to change it accordingly.        
* Source the script `run_analysis.R`.

**Products**
1. Final Data set without labels: `finalData`
2. Labeled Data set: `labeledData`
3. Avg Data set: `avgSet` and the relative file `avgSet.txt`

 
**Codebook**
Information about the datasets is provided in `CodeBook.md`.     

**Code** 
The code contains commments explaining the course targets. 

