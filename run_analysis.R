## Merge training and test sets to create single data set
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

runAnalysis <- cbind(subject, y_data, x_data)
colnames(runAnalysis) <- c("Subject", "Activity", features[,2])

## Extract measurements on mean and standard deviation
colWithMean <- grep("mean()", colnames(runAnalysis), fixed=TRUE)
colWithStd <- grep("std()", colnames(runAnalysis), fixed=TRUE)
runAnalysis <- runAnalysis[, c(1, 2, colWithMean, colWithStd)]

## Descriptive activity names to name the activities
for (i in seq(runAnalysis[, 2]))
{
	runAnalysis[i, 2] <- activity_labels[runAnalysis[i, 2], 2]
}

## Independent tidy data set with the average of each variable for each activity and each subject
tidyData <- aggregate(runAnalysis[, -c(1, 2)], list(runAnalysis$Activity, runAnalysis$Subject), FUN = "mean")
colnames(tidyData)[1:2] <- c("Activity", "Subject")

write.table(tidyData, file = "tidyData.txt", row.name = FALSE)