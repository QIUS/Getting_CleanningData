Source of the original dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . Description about this dataset in on the following web: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:

1. Merges the training and test sets to create one data set

2. Reads file features.txt and extracts only the measurements on the mean and standard deviation for each measurement.

The result is a 10299 x 66 data frame since 66 out of 561 attributes are measurements on the mean and standard deviation. All measurements appear to be floating point numbers in the range (-1, 1)

3. Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:
  walking

  walkingupstairs

  walkingdownstairs

  sitting

  standing

  laying

4. The script also appropriately labels the data set with descriptive names: 

all names of feature (attributes) and activity are converted to lower case, underscores without brackets, then it merges the 10299x66 data frame containing features with 10299x1 data frames containing activity labels and subject IDs.

The result is saved as mergedData.txt, a 10299x68 data frame with subject IDs on 1st column, activity names on 2nd column, and measurements on the following. Subject IDs are integers between 1 and 30 inclusive. Names of the attributes are similar to the following:

  tbodyacc-mean-x

  tbodyacc-mean-y

  tbodyacc-mean-z

  tbodyacc-std-x

  tbodyacc-std-y

  tbodyacc-std-z

  tgravityacc-mean-x

  tgravityacc-mean-y

5. the script creates a second, independent tidy data set with the average of each measurement for each activity and each subject.

The result is saved as tidy.txt, a 180x68 data frame.
