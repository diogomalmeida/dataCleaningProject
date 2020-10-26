# Information about the update of available codebooks with the data. This code book indicate all the variables and summaries calculated, along with units, and any other relevant information.

Training and test sets have been concatenated;

Mean and standard deviation for each column have been extracted and saved in files: datasetmean.csv and datasetsd.csv;

Descriptive activity names (by the original codebook) have beem used to name the activities in data sets;

Appropriately labels (by the original codebook) have been aplied to descriptive variable names in the data set and it has been saved as tidydata.csv;  

An independent tidy data set with the average of each variable for each activity and each subject has been created. Falowing these steps:

1. Filtering each dataset by activity and subject with dplyr package
2. Getting the average with dplyr package
3. Saving file as tidydatamean.csv and tidydatamean.txt


