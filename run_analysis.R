# This script is for getting and cleaning data using UCI HAR Dataset
# The result of this script should create cleaned tidy dataset by merging all
# By following the steps, will create a merged dataset first, then cleaned tidy data

# Merges the training and the test sets to create one data set.
temp1 <- read.table("train/X_train.txt")
temp2 <- read.table("test/X_test.txt")
X <- rbind(temp1, temp2) 

temp1 <- read.table("train/subject_train.txt")
temp2 <- read.table("test/subject_test.txt")
Subj <- rbind(temp1, temp2)

temp1 <- read.table("train/y_train.txt")
temp2 <- read.table("test/y_test.txt")
Y <- rbind(temp1, temp2)

# Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
indices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2]) # create a index variable of features
X <- X[, indices]
names(X) <- features[indices, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))  

# Uses descriptive activity names to name the activities in the data set

activity_lab <- read.table("activity_labels.txt")
activity_lab[, 2] = gsub("_", "", tolower(as.character(activity_lab[, 2])))
Y[,1] = activity_lab[Y[,1], 2]
names(Y) <- "activity"

# Appropriately labels the data set with descriptive activity names.

names(Subj) <- "subject"
cleaned <- cbind(Subj, Y, X)
write.table(cleaned, "mergedData.txt")

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(Subj)[,1]
numSubjects = length(unique(Subj)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (i in 1:numSubjects) {
        for (j in 1:numActivities) {
                result[row, 1] = uniqueSubjects[i]
                result[row, 2] = activities[j, 2]
                temp <- cleaned[cleaned$subject==i & cleaned$activity==activities[j, 2], ]
                result[row, 3:numCols] <- colMeans(temp[, 3:numCols])
                row = row + 1
        }
}
write.table(result, "tidy.txt")
