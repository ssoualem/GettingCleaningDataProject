# This script generates a tidy data file from the UCI HAR Dataset
# Script output : average of the mean and standard deviation variables grouped by subject and activity

library(dplyr)

dataDir <- "UCI HAR Dataset"
outputFile <- "uci_gar_tidy_data.txt"

########################################################################################
# Step 1 : merge training and test data sets
########################################################################################
print("Generating tidy dataset")

# Load test data
testData <- read.table(paste0(dataDir, "/test/X_test.txt"))
testActivity <- read.table(paste0(dataDir, "/test/y_test.txt"))
testSubject <- read.table(paste0(dataDir, "/test/subject_test.txt"))

# Load training data
trainData <- read.table(paste0(dataDir, "/train/X_train.txt"))
trainActivity <- read.table(paste0(dataDir, "/train/y_train.txt"))
trainSubject <- read.table(paste0(dataDir, "/train/subject_train.txt"))

# Add activity and subject variables to the dataset
testData <- cbind(testData, testSubject, testActivity)
trainData <- cbind(trainData, trainSubject, trainActivity)

# Merge training and test data sets
fullData <- rbind(trainData, testData)

# Get features names (i.e. variable names) and change variables names for the dataset
features <- read.table(paste0(dataDir, "/features.txt"))
names(fullData) <- c(as.character(features$V2), "subjectId", "activityId")

########################################################################################
# Step 2 : extract mean and standard deviations measurements
########################################################################################

# Find variables with "std" or "mean" in their names
meanStdVar <- c(grep("std", names(fullData)), grep("mean", names(fullData)))
colIndex <- unique(c(meanStdVar, which(names(fullData) == "activityId"), which(names(fullData) == "subjectId")))

# Get only variables with "std" or "mean" in their names + the activityId and subjectId variables
meanStdData <- fullData[ , colIndex]

########################################################################################
# Step 3 : add descriptive labels for the activities in the data set
########################################################################################

activityLabels <- read.table(paste0(dataDir, "/activity_labels.txt"))
names(activityLabels) <- c("activityId", "activityLabel")

meanStdData <- merge(meanStdData, activityLabels, by.x = "activityId", by.y = "activityId")

# Remove activityId column
meanStdData$activityId <- NULL

########################################################################################
# Step 4 : label the data with descriptive variable names
########################################################################################
# Variables names have been added before using the labels in the "features.txt" file
# The variables names will be cleaned up before generating the tidy data file
# Clean up variable names
tidyNames <- names(meanStdData)
tidyNames <- gsub("-mean", "Mean", tidyNames)
tidyNames <- gsub("-std", "Std", tidyNames)
tidyNames <- gsub("[-()]", "", tidyNames)
names(meanStdData) <- tidyNames

########################################################################################
# Step 5 : create dataset where each variable is averaged by subject and activity
########################################################################################
gb <- group_by(meanStdData, activityLabel, subjectId)

# Get the mean of all variables grouped by activity and subject
avgData <- summarize_each(gb, funs(mean))

########################################################################################
# Step 6 : generate the tidy data file
########################################################################################
write.table(avgData, outputFile,  row.name = FALSE)

print(paste("File", outputFile, "generated"))