# Code Book
This code book describes the data used in this project, to see the original description of the dataset, go to https://github.com/alegge/Getting-Cleaning-Data.

## General Information
30 volunteers performed 6 different activities while wearing a smartphone that captured data about their movements. 

## Explanation of files used:
```features.txt```: Name of 561 features
```activity_labels.txt```: Name and ID for each activity performed. 
```X_train.txt```: 7352 observations of features for 21 volunteers. 
```Y_train.txt```: 7352 integers stored in a vector, demoting the ID of activity related. 
```subject_train.txt```: 7352 integers stored in a vector, denoting the ID of the voluneteer related to the observation. 
```X_test.txt```: 2947 observations of features for 9 volunteers. 
```Y_test.txt```: 2947 integers stored in a vector, demoting the ID of activity related. 
```subject_test.txt```: 2947 integers stored in a vector, denoting the ID of the voluneteer related to the observation. 

## Transformation details:
The data was transformed in 5 steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
