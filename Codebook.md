# The original data was transformed by

1. Merging the training and the test sets to create one data set.

2. Extracting only the measurements on the mean and standard deviation for each measurement.

3. Using descriptive activity names to name the activities in the data set.

4. Appropriately labeling the data set with descriptive activity names.

5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

# About the R script

File with R code "run_analysis.R" performs the 5 steps from the assigned task on Coursera

# About the variables

- `X_train`, `y_train`, `X_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
- They are then merged into `merge_train` and `merge_test`, and then into `allData`
- `features` contains the correct names for the `x_train` and the `x_test` data sets, which were applied to the column names.
