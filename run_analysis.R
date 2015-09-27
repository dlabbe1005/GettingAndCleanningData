## Programming Assigment
## load dplyr package
library( dplyr )

## Set the working directory
setwd( "C:/Users/labbe-pc/Desktop/Cousera/Getting and Cleaning Data/Programming Assingment/UCI HAR Dataset" )

## 1. Merges the training and the test sets to create one data set.

	## Load the column names
	features <- read.table( "features.txt" )
	var_names <- c( as.vector(features[,2]), "subject", "activity" )

	## Load test data sets
	test_data <- read.table( file = "./test/X_test.txt" )
	test_subj <- read.table( file = "./test/subject_test.txt")
	test_actv <- read.table( file = "./test/Y_test.txt")
	
	## Add columns subject and activity to train data set
	test_data <- cbind( test_data, test_subj )
	test_data <- cbind( test_data, test_actv )
	
	## Load train data sets
	train_data <- read.table( file = "./train/X_train.txt" )
	train_subj <- read.table( file = "./train/subject_train.txt")
	train_actv <- read.table( file = "./train/Y_train.txt")
	
	## Add columns subject and activity to train data set
	train_data <- cbind( train_data, train_subj )
	train_data <- cbind( train_data, train_actv )
	
	## Bind both data sets
	data <- rbind( test_data, train_data )

	## Define the column names
	colnames(data) <- var_names

	## Remove data sets to free memory
	rm( test_data, test_subj, test_actv, train_data, train_subj, train_actv )

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

	## Subset only variable names containing MEAN and STD, case insensitive
	mean_cols <- data[, grep( "MEAN", toupper( names(data) ) )]
	std_cols <- data[, grep( "STD", toupper( names(data) ) )]

	## Merge both data frames (STD and mean)
	new_data <- cbind( mean_cols, std_cols, subject = data$subject, activity = data$activity )
	
	## Remove data sets to free memory
	rm( data, mean_cols, std_cols )
	
## 3. Uses descriptive activity names to name the activities in the data set

	## Read the activity names into a data frames
	activ_names <- read.table( "activity_labels.txt", col.names = c( "activity", "activity_labels" ) )
	
	## Resolve the activity "id" to show at the same dataframe the activity name
	merged_data <- merge( new_data, activ_names, by.x = "activity", by.y = "activity", all = TRUE )
	
## 4. Appropriately labels the data set with descriptive variable names. 

	## Replace the invalid characters from the variable name for an underscore, so the variable names are ready to be used in R
	colnames(merged_data) <- gsub("[,.()-]","_", colnames(merged_data) )
	
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

	## Sumarise the mean by subject and activity to all variables in the merged data source
	final_data <- merged_data %>% group_by( subject, activity_labels ) %>% summarise_each( funs(mean) )
	
## Creates the txt file with the tidy data set
write.table( final_data, file = "tidy_ds.txt", append = FALSE, quote = FALSE, sep = " ", na = "NA", dec = ".", row.names = FALSE, col.names = FALSE )
