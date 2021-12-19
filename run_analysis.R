# Getting the data:

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip")
unzip(zipfile = "./data/Dataset.zip", exdir = "./data")

# Creating R script called run_analysis.R that does the following: 

# (1) Merges the training and the test sets to create one data set.

# 1.1.1 Reading training tables:

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# 1.1.2 Reading testing tables:

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# 1.1.3 Reading feature vector
features <- read.table("./data/UCI HAR Dataset/features.txt")

# 1.1.4 Reading activity labels
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

#1.2 Assigning column names:

colnames(x_train) <- features[,2]
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2]
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c("activityId", "activityType")

# 1.3 Merging all data in one set:

merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
allData <- rbind(merge_train, merge_test)

#dim(allData)
#[1] 10299   563

# (2) Extracts only the measurements on the mean and standard deviation for each measurement.

# 2.1 Reading column names:

columns <- colnames(allData)

# 2.2 Creating a vector for defining ID, mean and standard deviation:

mean_and_std <- (grepl("activityId", columns) |
                   grepl("subjectId", columns) |
                   grepl("mean..", columns) |
                   grepl("std..", columns)
)

# 2.3 Making the subset for allData:

setForMeanAndStd <- allData[ , mean_and_std == TRUE]

# (3) Uses descriptive activity names to name the activities in the data set

setWithActivityNames <- merge(setForMeanAndStd, activityLabels, by='activityId', all.x = TRUE)

# (4) Appropriately labels the data set with descriptive variable names. 

# Already did that in 1.3, 2.2 and 2.3!

# (5) From the data set in step 4, creates a second, independent tidy data set

# 5.1 Making a second tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

tidySet2 <- setWithActivityNames %>% group_by(subjectId, activityId) %>% summarise_each(funs(mean))

# 5.2 Writing second tidy data set in txt file

write.table(tidySet2, "tidyDataSet.txt", row.names = FALSE)

