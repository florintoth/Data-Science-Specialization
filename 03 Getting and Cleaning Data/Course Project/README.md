This script processes data from the Human Activity Recognition Using Smartphones Dataset to extract the average means and standard deviations of each variable for a given subject and activity, returning a tidy data frame containing these values.

The data is downloaded from this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

More information about the data is here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

After dwonoading the zip file I unzipped it in the existing "data" folder from my R default path.

The script is found in the "run_analysis.R".

The tidy data is written in the "tidy_data.txt" that can be read back into R.