# Reading training set;
datasettrain <- read.csv(".//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//train//X_train.txt", sep = "", header = FALSE)

# Reading test set;
datasettest <- read.csv(".//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//test//X_test.txt", sep = "", header = FALSE)

# Reading training labels;
labelstrain <- read.csv(".//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//train//y_train.txt", sep = "", header = FALSE)

# Reading test labels;
labelstest <- read.csv(".//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//test//y_test.txt", sep = "", header = FALSE)

# Reading training labels;
subjecttrain <- read.csv(".//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//train//subject_train.txt", sep = "", header = FALSE)

# Reading test labels;
subjecttest <- read.csv(".//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//test//subject_test.txt", sep = "", header = FALSE)

# Concatenating subject, labels and set
# training
datasettraincomplete <- cbind(subjecttrain,labelstrain,datasettrain)
# Test
datasettestcomplete <- cbind(subjecttest,labelstest,datasettest)


# Merges the training and the test sets to create one data set.
# Concatenating training and test sets
dataset <- rbind(datasettraincomplete,datasettestcomplete)


# Uses descriptive activity names to name the activities in the data set.
# Replace 1 to WALKING
dataset[,2]<- gsub(1,"WALKING",dataset[,2])
# Replace 2 to WALKING_UPSTAIRS
dataset[,2]<- gsub(2,"WALKING_UPSTAIRS",dataset[,2])
# Replace 3 to WALKING_DOWNSTAIRS
dataset[,2]<- gsub(3,"WALKING_DOWNSTAIRS",dataset[,2])
# Replace 4 to SITTING
dataset[,2]<- gsub(4,"SITTING",dataset[,2])
# Replace 5 to STANDING
dataset[,2]<- gsub(5,"STANDING",dataset[,2])
# Replace 6 to LAYING
dataset[,2]<- gsub(6,"LAYING",dataset[,2])

# Appropriately labels the data set with descriptive variable names.
# Reading labels(features);
datasetlabels<- read.csv(".//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//features.txt",sep = "",header = FALSE)
# Vector of labels
labelsvec <- as.character(datasetlabels$V2)
# Combining "subject", "activity" with labels;
labelsvec2 <- c("subject","activity",labelsvec)

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Filtering each dataset by activity
# Load dplyr packege
library(dplyr)
# Changing names of 1º and 2º columns
colnames(dataset)[1] <- "subject"
colnames(dataset)[2] <- "activity"
# Group by subject and activity  
byactsub <- dataset %>% group_by(subject,activity)
# getting the mean
datasetbyactsub <- byactsub %>% summarise_all(mean)

# datasets with descriptive variable names
colnames(dataset) <- labelsvec2
# datasetbyactsub with descriptive variable names
colnames(datasetbyactsub) <- labelsvec2

# Extracts only the measurements on the mean and standard deviation for each measurement.
selcol <- grep("subject|activity|.mean\\(\\)*|.std\\(\\)*", labelsvec2)
tidydataset <- datasetbyactsub[,selcol]

# Saving files
# tidydata
write.table(tidydataset, file = ".\\tidydatasets\\tidydatamean.txt", row.name=FALSE)
write.csv(tidydataset,".\\tidydatasets\\tidydatamean.csv", row.names = FALSE)

