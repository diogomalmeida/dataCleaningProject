# Information about the update of available codebooks with the data. This code book indicate all the variables and summaries calculated, along with units, and any other relevant information.

Training and test sets have been concatenated;

Descriptive activity names (by the original codebook) have been used to name the activities in data sets;

Appropriately labels (by the original codebook) have been aplied to descriptive variable names in the data set;  

An independent tidy data set with the average of each variable for each activity and each subject has been created. Falowing these steps:

1. Filtering each dataset by activity and subject with dplyr package
2. Getting the average with dplyr package

Measurements on the mean and standard deviation have been extracted in the dataset and saved in files: tidydataset.txt and tidydataset.csv


