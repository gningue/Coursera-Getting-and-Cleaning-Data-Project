setwd(dir = "Bureau/Coursera/UCI HAR Dataset/")
library(plyr)
##########################################################################
# Question 1 : Merges the training and the test sets to create one data set
###########################################################################
X_train <- read.table(file = "train/X_train.txt")
y_train <- read.table(file = "train/X_train.txt")
subject_train <- read.table(file = "train/subject_train.txt")
X_test <- read.table(file = "test/X_test.txt")
y_test <- read.table(file = "test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
# Merging X_test and X_train for creating the X_MERGED_DATAS
X_MERGED_DATA <- rbind(X_train, X_test)
# Merging y_test and y_train for creating the y_MERGED_DATAS
y_MERGED_DATA <- rbind(y_train, y_test)
# Merging subject_train and subject_test for creating subject_merged_data
subject_MERGED_DATA <- rbind(subject_train, subject_test)
###########################################################################
#  Question 2 :Extracts only the measurements on the mean and standard
# deviation for each mesurement.
###########################################################################
features <- read.table("features.txt")
# create the filtered datas with mean and std in names
features_ms <- grep("-(mean|std)\\(\\)", features[ ,2])
# Retrieving data from X_MERGED_DATAS and setting corrects names to columns
X_MERGED_DATA <- X_MERGED_DATA[ ,features_ms]
names(X_MERGED_DATA) <- features[features_ms, 2]
##########################################################################
# Question 3 : Use descriptive activity names to name the activities in the data set
##########################################################################
activity_lables <- read.table("activity_labels.txt")
# Setting Activity names in Y_MERGED_DATA
y_MERGED_DATA[ ,1] <- activity_lables[y_MERGED_DATA[ , 1], 2]
# correct column name
names(y_MERGED_DATA) <- "activity"
##############################################################################
# Question 4 : Appropriately label the data set with descriptive
#  variable names
###############################################################################

# Assigning subject_MERGED_DATA column name
names(subject_MERGED_DATA) <- "subject"

# Get all the datas in one data_frame
df_all <- cbind(X_MERGED_DATA, y_MERGED_DATA, subject_MERGED_DATA)

################################################################################
# Question 5 :Create a second, independent tidy data set with the average of 
# each variable for each activity and each subject
###############################################################################

df_all_averages <- ddply(df_all, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(df_all_averages, "df_all_averages.txt", row.name=FALSE)

