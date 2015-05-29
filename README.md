#Human Activity Recognition Using Smartphone’s Data Set

This script takes the data from the experiments carried out with a group of 30 volunteers who performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist and outputs tidy and summarized data frame.

1. First part of the scripts reads all of the data in from the *txt* files using read.table():
	* The data is organized by properly labeling columns with supporting *txt* files.

2. I created two data frames for each experiment type:
	* **Train** and **Test**

3. Two of the tables were merged into one master table excluding all variables but the ones measuring **mean** and **standard deviation**.

4. The provided key for the activities was used to replace the integer values indicating the type of activity with the descriptive activity names.

5. The summary table is the output with the average of each variable for each activity and subject.

