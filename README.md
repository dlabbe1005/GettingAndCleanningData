# Tidy Human Activity Recognition Using Smartphones Dataset

# Raw Data
## Reference
Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

## Original files
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

# Tidy Process - Instruction list used to tidy the data
1. Step 1 - Merge the data sets creating one data set with training data, test data and subjects. The variables of the data set were named acordingly to the features data set.
2. Step 2 - Extract only the measurements on the mean and standard deviation for each measurement. Subset only variable names containing MEAN and STD, case insensitive.
3. Step 3 - Name the activities based on descriptive activity names data set.
4. Step 4 - Appropriately labels the data set with descriptive variable names. Replace the invalid characters from the variable name for an underscore, so the variable names are ready to be used in R.
5. Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Sumarise the mean by subject and activity to all variables in the merged data set.

# System Information
R 64 bits 3.2.2
Windows 7 Home Premium 64 bits