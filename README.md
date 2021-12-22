# Getting and cleaning data in R

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The goal is creating one R script called run_analysis.R that does the following. 

### 1) Merges the training and the test sets to create one data set.
1.1.1 Reading training tables

1.1.2 Reading testing tables

1.1.3 Reading feature vector

1.1.4 Reading activity labels

1.2 Assigning column names

1.3 Merging all data in one set

### 2) Extracts only the measurements on the mean and standard deviation for each measurement.
2.1 Reading column names

2.2 Creating a vector for defining ID, mean and standard deviation

2.3 Making the subset for allData

### 3) Uses descriptive activity names to name the activities in the data set
### 4) Appropriately labels the data set with descriptive variable names.
Already did that in 1.3, 2.2 and 2.3!

### 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
5.1 Making a second tidy data set with the average of each variable for each activity and each subject.

5.2 Writing second tidy data set in txt file
