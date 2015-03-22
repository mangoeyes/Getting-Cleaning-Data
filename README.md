Getting and Cleaning Data: Course Project
=========================================
2015-03-21
Introduction
------------
This repository contains my work for the course project for the Coursera course "Getting and Cleaning data".

About the raw data
------------------

The features (561 of them) are unlabeled and can be found in the X_test.txt. 
###The activity labels are in the y_test.txt file.
###The test subjects are in the subject_test.txt file.

###The features.txt file contains the labels of each column in X_test.txt 
###The activity_labels.txt file contains the activity names for each activity labels in y_test.txt

###The same holds for the training set.

About the script and the tidy dataset
-------------------------------------
- A script called run_analysis.R is created which will merge the test and training sets together.
- Prerequisites for this script is that the UCI HAR Dataset must be extracted and put under the working directory
- After merging testing and training, only columns that have to do with mean and standard deviation are kept, after which labels are added
- Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity.
