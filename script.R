# Reading training set;
datasettrain <- read.csv(".//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//train//X_train.txt", sep = "", header = FALSE)

# Reading test set;
datasettest <- read.csv(".//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//test//X_test.txt", sep = "", header = FALSE)

# Reading training labels;
labelstrain <- read.csv(".//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//train//y_train.txt", sep = "", header = FALSE)

# Reading test labels;
labelstest <- read.csv(".//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//test//y_test.txt", sep = "", header = FALSE)

# Concatenating set and labels
# training
datasettraincomplete <- cbind(labelstrain,datasettrain)
# Test
datasettestcomplete <- cbind(labelstest,datasettest)

# 1.Merges the training and the test sets to create one data set.
# Concatenating training and test sets
dataset <- rbind(datasettraincomplete,datasettestcomplete)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
# Mean and standard deviation for each column;
# Mean
datasetmean<-sapply(dataset[,-1], mean)
# Standard deviation;
datasetsd<-sapply(dataset[,-1], sd)

# 3. Uses descriptive activity names to name the activities in the data set.
# Replace 1 to WALKING
dataset$V1<- gsub(1,"WALKING",dataset$V1)
# Replace 2 to WALKING_UPSTAIRS
dataset$V1<- gsub(2,"WALKING_UPSTAIRS",dataset$V1)
# Replace 3 to WALKING_DOWNSTAIRS
dataset$V1<- gsub(3,"WALKING_DOWNSTAIRS",dataset$V1)
# Replace 4 to SITTING
dataset$V1<- gsub(4,"SITTING",dataset$V1)
# Replace 5 to STANDING
dataset$V1<- gsub(5,"STANDING",dataset$V1)
# Replace 6 to LAYING
dataset$V1<- gsub(6,"LAYING",dataset$V1)

# 4. Appropriately labels the data set with descriptive variable names.
# Reading labels(features);
datasetlabels<- read.csv(".//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//features.txt",sep = "",header = FALSE)
# vector of labels
labelsvec <- as.character(datasetlabels$V2)
# "activity" label;
lab1 <- "activity"
# Combining "activity" with labels;
labelsvec2 <- c(lab1,labelsvec)
# Changing column names of dataset with descriptive variable names;
colnames(dataset) <- labelsvec2

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Filtering each dataset by activity
dataset1 <- dataset[dataset$activity =="WALKING",]
dataset2 <- dataset[dataset$activity =="WALKING_UPSTAIRS",]
dataset3 <- dataset[dataset$activity =="WALKING_DOWNSTAIRS",]
dataset4 <- dataset[dataset$activity =="SITTING",]
dataset5 <- dataset[dataset$activity =="STANDING",]
dataset6 <- dataset[dataset$activity =="LAYING",]
# Getting the average
vec1mean <- sapply(dataset1, mean)
vec2mean <- sapply(dataset2, mean)
vec3mean <- sapply(dataset3, mean)
vec4mean <- sapply(dataset4, mean)
vec5mean <- sapply(dataset5, mean)
vec6mean <- sapply(dataset6, mean)
# Combining all resuts
datasetresult <- rbind(vec1mean,vec2mean,vec3mean,vec4mean,vec5mean,vec6mean)
# Tidy data as dataframe
tidydata <- as.data.frame(datasetresult)
