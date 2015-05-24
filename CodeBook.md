Getting and Cleaning Data CodeBook
========================================

### Description
Additional details about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

### Script Structure
The script has a structure like this:
 ```run_analysis.R
    ├── required libraries
    │ 
    ├── preparation of reading files
	│ 
    ├── Target 1: Merging
    │   ├── mergeFiles(function)
    │   └── getColnames(function)
	│ 
    ├──	Target 2: Extract
    │   └── getIndexes (function)
    │ 
    ├── Target 3: Description
	│  
    ├──	Target 4: Labels
    │   └── getLabeled (function)
    │   
    └── Target 5: creaton of Avg set
    
```

# Details
* paths:
1. `relative_path`:  the user has to set this
2. `dir_path`: the name of initial Directory `UCI HAR Dataset` 
3. `data_path`: the `dir_path` with prefix the `relative_path`
4. `test_path`: 
5. `train_path`:

* files:
1. `testFiles`: all .txt files from test directory
2. `trainFiles`: all .txt files from train directory
3. `featuresFile`: the filename of `features.txt`
4. `activitiesFile`: the filename of `activity_labels.txt`

* variables:
1. `features`: data set of features with column names `feature_id` & `feature_name`
2. `activities`: data set of activities labels with column names `activity_id` & `activity_name`
3. `DF_Name`: variable in function `mergeFiles` which holds the filename without the extention
4. `dataSet`: the data set in function `mergeFiles` from file
5. `temp_dataset`: the temporary data set in function `mergeFiles`
6. `trainDataSet`: the merged data set of `train` files (subject_train.txt, X_train.txt, y_train.txt)
7. `testDataSet`: the merged data set of `test` files (subject_test.txt, X_test.txt, y_test.txt)
8. `finalData`: the merged data set of `trainDataSet` & `testDataSet`
9. `indexes`: a logical map which holds which columns we need from `finalData` set
10. `finalData`: subset from `finalData` with columns of `indexes`
11. `finalData`: joined with `activities` data set by `activity_id`
12. `labeledData`: data set from source `finalData` with replaced column names
13. `avgSet`: a new data set with the average of each variable for each activity and each subject

* Custom functions:
1. `mergeFiles(aFiles,aPath)`: function which has 2 arguments. The `aFiles` argument is the list of files
	and the `aPath` is the path of these files. This function read every file and combine it's context with the previous one,
	so it returns a full merged data set.
2. `getColnames(aFilename)`: function which decides which is the suitable column names for the imported file. This is usefull
	in `mergeFiles` function
3. `getIndexes(aFinalData)`: function which has an argument as input and returns the logical map of the keywords appearances.
4. `getLabeled(aColnames)`: function which has an argument. This is the column names of a data set. This returns the replaced
	column names. 