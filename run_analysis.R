# 1. Merges the training and the test sets to create one data set.
# We Merge data in three sets: first we combine the test and train data
# The second set is the Resultant set containing merged results.
# The third is the merged subject set. 

train <- read.table("HAR/train/X_train.txt")
test <- read.table("HAR/test/X_test.txt")
data <- rbind(train, test)

trainResult <- read.table("HAR/train/y_train.txt")
testResult <- read.table("HAR/test/y_test.txt")
Result <- rbind(trainResult, testResult)

trainSub <- read.table("HAR/train/subject_train.txt")
testSub <- read.table("HAR/test/subject_test.txt")
Sub <- rbind(trainSub, testSub)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("HAR/features.txt")
requiredFeatures <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
data <- data[, requiredFeatures]
names(data) <- features[requiredFeatures, 2]
names(data) <- gsub("\\(|\\)", "", names(data))

# 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("HAR/activity_labels.txt")
activities[, 2] = gsub("_", "", as.character(activities[, 2]))
Result[,1] = activities[Result[,1], 2]
names(Result) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(Sub) <- "subject"
tidyData <- cbind(data, Result, Sub)
write.table(tidyData, "HARTidyData.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uSub = unique(Sub)[,1]
nSub = length(unique(Sub)[,1])
nActivities = length(activities[,1])
nCols = dim(tidyData)[2]
secondResult = tidyData[1:(nSub*nActivities), ]

row = 1
for (x in 1:nSub) {
	for (y in 1:nActivities) {
		secondResult[row, 1] = uSub[x]
		secondResult[row, 2] = activities[y, 2]
		temp <- tidyData[tidyData$subject==x & tidyData$activity==activities[y, 2], ]
		secondResult[row, 3:nCols] <- colMeans(temp[ , 3:nCols])
		row = row+1
	}
}
write.table(secondResult, "HARtidyDataAverages.txt")

