# read in datasets
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# combine test and train datasets with activity labels and subject number
x_trainCombined <- cbind(x_train, subject_train, y_train)
x_testCombined <- cbind(x_test, subject_test, y_test)

# combine test and train datasets
x_total <- rbind(x_trainCombined, x_testCombined)

# organize col names of main dataset
colNames <- rbind(features, c(nrow(features) + 1, "subject"), c(nrow(features) + 2, "activity")) 
names(x_total) <- colNames[,2]

# extract only mean() and std() related information together with activity label and subject number data
tidyDataset <- x_total[, grep("std\\(|mean\\(|subject|activity", names(x_total))]

# make activity descriptive
tidyDataset$activity <- activityLabels[tidyDataset$activity, 2]

# make col names descriptive
names(tidyDataset) <- gsub("^f", "frequency", names(tidyDataset))
names(tidyDataset) <- gsub("^t", "time", names(tidyDataset))
names(tidyDataset) <- gsub("Acc", "Acceleration", names(tidyDataset))
names(tidyDataset) <- gsub("Gyro", "Gyroscope", names(tidyDataset))
names(tidyDataset) <- gsub("Mag", "Magnitude", names(tidyDataset))

# summarise the mean of each variable by each activity and subject
library(dplyr)
summarisedTidyDataset <- tidyDataset %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# generate text file
write.table(summarisedTidyDataset, file = "step5.txt", row.names = FALSE)
