# hw4v2
Course Project/Overview:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your mentors on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis.r explanation:
1. ##merge train and test data
used rbind to merge data sets; test with dim

2. ##question #2
extracts only mean and sd by using grep to search

3. ##question #3
use descriptive activity names to name data in dataset
heading Y = standing

4. ##question #4 label datasets with variable names
used Subject ID and activity

5. ##question #5 create 2nd  independent tidy dataset
write table TidyData 
SubjectID           Activity tBodyAcc-mean()-X tBodyAcc-mean()-Y
 1:         1           STANDING         0.2789176      -0.016137590
 2:         1            SITTING         0.2612376      -0.001308288
 3:         1             LAYING         0.2215982      -0.040513953
 4:         1            WALKING         0.2773308      -0.017383819
 5:         1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505
 6:         1   WALKING_UPSTAIRS         0.2554617      -0.023953149
 7:         2           STANDING         0.2779115      -0.018420827
 8:         2            SITTING         0.2770874      -0.015687994
 9:         2             LAYING         0.2813734      -0.018158740
10:         2            WALKING         0.2764266      -0.018594920
11:         2 WALKING_DOWNSTAIRS         0.2776153      -0.022661416
12:         2   WALKING_UPSTAIRS         0.2471648      -0.021412113


