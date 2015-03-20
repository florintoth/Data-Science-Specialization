The data used was retrieved form this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data is related to and experiment about human activity recognition Using smartphones.
More information here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The run_analysis.R script performs the following steps to clean the data:

1 - Merges the training and the test sets to create one data set.
"X_train.txt", "y_train.txt" and "subject_train.txt" were loaded in the following data frames:
"trainX", "trainy" and "tranSubject"

"X_test.txt", "y_test.txt" and "subject_test.txt" were loaded in the following data frames:
"testX", "testy", "testSubject"

The training and test data frames above were then joined (using rbind function) into
"joinX", "joiny"" and "joinSubject" data frames.

2 - Extracts only the measurements on the mean and standard deviation for each measurement.

Using the "features.txt" data imported into "features" data frame, the means and standard deviation measures were extracted into "X_mean_std" data frame employing grepl.

3 - Uses descriptive activity names to name the activities in the data set

Activity leves were imported into "activity" data frame and transformed into factor for using plyr.
Used mapvalues to replace matched items in "activity" and added as a variable in "X_mean_std"

4 - Appropriately labels the data set with descriptive variable names.

Added the "joinSubject" data to the "X_mean_std" variables.

5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Using "melt" and "dcast"" functions from "reshape2" library, the "Xtidy"" data frame is created with
the average of each variable for each activity and each subject.
Finaly "Xtidy" data frame is written to "tidy_data.txt" with write.table and row.name=FALSE