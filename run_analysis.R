##download and unzip the file
##fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
##download.file(fileurl, "./galaxydata.zip", "curl")
##unzip("./galaxydata.zip")
## read the data from txt files and make data frames for train and test
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("ID", "activity"))
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("ID", "feature"))
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("Subject"))
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("Activity"))
test_table <- cbind(subject_test, test_labels, test_set)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("Subject"))
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c("Activity"))
train_table <- cbind(subject_train, train_labels, train_set)
##merge the data frames and tidy it up
merged <- merge(train_table, test_table, all = TRUE)
merged <- select(merged, contains(".mean.."), contains(".std.."), contains("Activity"), contains("Subject"))
merged <- merge(merged, activity_labels, by.x = "Activity", by.y = "ID")
merged <- rename(merged, Activity_ID = Activity, Activity_Description = activity)
merged$Activity_ID <- NULL
##summarized table
final <- merged %>% group_by(Activity_Description, Subject) %>% summarise_each(funs(mean))
print(final)
##write.table(final, file = "run_analysis.txt", row.names = FALSE)
