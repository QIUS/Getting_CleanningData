Source of the original dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . Description about this dataset in on the following web: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:

##First, merges the training and test sets to create one data set

##Second, reads file features.txt and extracts only the measurements on the mean and standard deviation for each measurement

The result is a 10299 x 66 data frame since 66 out of 561 attributes are measurements on the mean and standard deviation. All measurements appear to be floating point numbers in the range (-1, 1)

##Third, reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:
  walking

  walkingupstairs

  walkingdownstairs

  sitting

  standing

  laying

##Fourth, the script also appropriately labels the data set with descriptive names: 

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

##Finally, the script creates a second, independent tidy data set with the average of each measurement for each activity and each subject.

The result is saved as tidy.txt, a 180x68 data frame.

## The following is the data columns containning on the final tidy data

1.ActivityName: Activity being performed
2.SubjectID: ID indicating the subject from whom data was collected
3.tBodyAccMeanX
4.tBodyAccMeanY
5.tBodyAccMeanZ
6.tBodyAccStdX
7.tBodyAccStdY
8.tBodyAccStdZ
9.tGravityAccMeanX
10.tGravityAccMeanY
11.tGravityAccMeanZ
12.tGravityAccStdX
13.tGravityAccStdY
14.tGravityAccStdZ
15.tBodyAccJerkMeanX
16.tBodyAccJerkMeanY
17.tBodyAccJerkMeanZ
18.tBodyAccJerkStdX
19.tBodyAccJerkStdY
20.tBodyAccJerkStdZ
21.tBodyGyroMeanX
22.tBodyGyroMeanY
23.tBodyGyroMeanZ
24.tBodyGyroStdX
25.tBodyGyroStdY
26.tBodyGyroStdZ
27.tBodyGyroJerkMeanX
28.tBodyGyroJerkMeanY
29.tBodyGyroJerkMeanZ
30.tBodyGyroJerkStdX
31.tBodyGyroJerkStdY
32.tBodyGyroJerkStdZ
33.tBodyAccMagMean
34.tBodyAccMagStd
35.tGravityAccMagMean
36.tGravityAccMagStd
37.tBodyAccJerkMagMean
38.tBodyAccJerkMagStd
39.tBodyGyroMagMean
40.tBodyGyroMagStd
41.tBodyGyroJerkMagMean
42.tBodyGyroJerkMagStd
43.fBodyAccMeanX
44.fBodyAccMeanY
45.fBodyAccMeanZ
46.fBodyAccStdX
47.fBodyAccStdY
48.fBodyAccStdZ
49.fBodyAccJerkMeanX
50.fBodyAccJerkMeanY
51.fBodyAccJerkMeanZ
52.fBodyAccJerkStdX
53.fBodyAccJerkStdY
54.fBodyAccJerkStdZ
55.fBodyGyroMeanX
56.fBodyGyroMeanY
57.fBodyGyroMeanZ
58.fBodyGyroStdX
59.fBodyGyroStdY
60.fBodyGyroStdZ
61.fBodyAccMagMean
62.fBodyAccMagStd
63.fBodyBodyAccJerkMagMean
64.fBodyBodyAccJerkMagStd
65.fBodyBodyGyroMagMean
66.fBodyBodyGyroMagStd
67.fBodyBodyGyroJerkMagMean
68.fBodyBodyGyroJerkMagStd
