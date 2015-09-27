# GettingCleaningDataProject
Project for the "Getting and Cleaning Data" course on Coursera


## run_analysys.R
When sourced this script, processeses the Samsung accelerometer data and generates a tidy data file named "uci_gar_tidy_data.txt". The Samsung data needs to be in the working directory and be containted in the original "UCI HAR Dataset" folder.

### Tidy data generation steps
1. Merge training and test data sets
2. Extract mean and standard deviations measurements
3. Add descriptive labels for the activities in the data set
4. Label the data with descriptive variable names
5. Create dataset where each variable is averaged by subject and activity
6. Generate the tidy data file

Additional comments are provided in the script for each step.

## CodeBook.MD
Description of the tidy data file variables. Links to the raw dataset are also provided for reference.