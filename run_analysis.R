#Data Science - Getting and Cleaning Data
#You should create one R script called run_analysis.R that does the following.

# 1 - Merges the training and the test sets to create one data set.
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
# 3 - Uses descriptive activity names to name the activities in the data set
# 4 - Appropriately labels the data set with descriptive variable names.
# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Dataset from : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# The data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Extracted to "./UCI HAS Dataset/"

setwd("./UCI HAR Dataset/")

# Reading the labels:
# Labels
activitylables <- read.table("activity_labels.txt", header = FALSE)
features <- read.table("features.txt", header = FALSE)[,2]

# Reading the Dataset
idtest <- read.table("./test/subject_test.txt",header = FALSE)
xtest <- read.table("./test/X_test.txt", header = FALSE)
ytest <- read.table("./test/y_test.txt", header = FALSE)
idtrain <- read.table("./train/subject_train.txt",header = FALSE)
xtrain <- read.table("./train/X_train.txt", header = FALSE)
ytrain <- read.table("./train/y_train.txt", header = FALSE)

# 4 - Appropriately labels the data set with descriptive variable names
#Adjusting variable names
names(xtest) = features
names(xtrain) = features
names(activitylables) = c("idactivity","typeactivity")
names(ytest) = "idactivity"
names(ytrain) = "idactivity"
names(idtest) = "idsubject"
names(idtrain) = "idsubject"

# 2 - Extracts only the measurements on the mean and standard deviation 
# Drop variables other than Std and Mean
xtest <- xtest[,grepl("[mM]ean|[sS]td",colnames(xtest))]
xtrain <- xtrain[,grepl("[mM]ean|[sS]td",colnames(xtrain))]

# 1 - Merges the training and the test
# Merging datasets
test_data <- cbind(idtest,ytest,xtest)
train_data <- cbind(idtrain,ytrain,xtrain)
final_data <- rbind(test_data,train_data)

# 5 - Calculate the average of each variable for each activity and each subject.
library(plyr)
tidy_data <- ddply(final_data, .(idactivity, idsubject), colMeans)

# 3 - Using descriptive name for the activities
tidy_data <- merge(activitylables, tidy_data, by.x = "idactivity", by.y = "idactivity")
tidy_data <- tidy_data[,2:89]
# Write
setwd("../")
write.table(tidy_data,"tidy.txt", row.name=FALSE)

# Cleanning environment
rm(ytest)
rm(xtest)
rm(ytrain)
rm(xtrain)
rm(test_data)
rm(train_data)
rm(idtest)
rm(idtrain)
rm(activitylables)
rm(features)
rm(final_data)
