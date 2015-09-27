# Getting and Cleaning Data Coursera course code book

## Raw data
The original dataset comes from Samsung smartphone accelerometers. This data has already been processed using several signal processing techniques.

More information can be found from the website where the data was retrieved :

- [Data information] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
- [Dataset] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )


## Tidy data set
Please read the README.MD file for more information about how the tidy dataset was generated.

The tidy data set contains the mean and standard deviation features of the raw dataset. These variables have been averaged and grouped by subject and activity type.

The tidy data file is named "uci_gar_tidy_data.txt".

### Variable descriptions
- subjectId : each subject is identified by a number. 30 subjects have participed in this experiment.
- activityLabel : LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

The features names have been modified in the tidy dataset :
- "-mean" has been replaced by "Mean"
- "-std" has been replaced by "Std"
- Dashes ("-") and parentheses have been removed

Example : "fBodyGyro-mean()-Y" becomes "fBodyGyroMeanY"

Please read the "features_info.txt" file in the original dataset for a description of the that have been averaged in the tidy dataset.
