# Description

The script `run_analysis.R`follow the five questions described in the course project's.

* The First Step merged all the datas with the same number of column
* The second Step extracts only the measurements on the mean and standard deviation for each mesurement. 
* In The Third Step we use descriptive activity names to name the activities in the data set
* In the 4th step we Appropriately label the data set with descriptive variable names
* Finally we Create a second, independent tidy data set with the average of each variable for each activity and each subject called df_all_averages.txt

# Variables

* `X_train`, `y_train`, `X_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `X_MERGED_DATA`, `y_MERGED_DATA` and `subject_MERGED_DATA` merge the initial data in one data frame.
* `features` contains the correct names for the `X_MERGED_DATA` dataset, which are applied to the column names stored in `features_ms`, a numeric vector used to extract the desired data. the same approach is taken with activity names (`activity_lables`)
* `df_all` combines `X_MERGED_DATA`, `y_MERGED_DATA` and `subject_MERGED_DATA` in a single dataset.
* Finally, `df_all_averages` contains the relevant averages and stored in a txt file using the function ddply()` from the plyr package.
