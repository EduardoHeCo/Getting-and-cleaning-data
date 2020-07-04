# Getting-and-cleaning-data
---
  title: "Getting and Cleaning Data | Week 4"
output: github_document
---
  
  # Getting and Cleaning Data | Week 4
  ## CodeBook for Wearable Computing Project
  
  The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.


This code book describes how and which variables, data, and any transformations/work took place to clean up the data.

This code book will be split up into 4 sections.
1.  Data Set Information
2.  Understanding the Data
3.  Analysis/Processing Details


## Data Set Information

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
  
  "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

### The Data Source
* The UCI Machine Learning Lab
* Original description of the dataset http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Original UCI-HAR Dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Understanding the Data

Listing the Data directory shows us the following:
  
  -rwxr-xr-x  1 thanos  staff   4453 Mar 27 19:34 README.txt
-rwxr-xr-x  1 thanos  staff     80 Mar 27 19:34 activity_labels.txt
-rwxr-xr-x  1 thanos  staff  15785 Mar 27 19:34 features.txt
-rwxr-xr-x  1 thanos  staff   2809 Mar 27 19:34 features_info.txt
drwxr-xr-x  6 thanos  staff    204 Nov 29  2012 test
drwxr-xr-x  6 thanos  staff    204 Nov 29  2012 train

- 'README.txt'
- 'activity_labels.txt': Links the class labels with their activity name.
- 'features.txt': List of all features.
- 'features_info.txt': Shows information about the variables used on the feature vector.

The Two directories that comes with the zipped data houses both test and training data respectively.  The following files are available for the train and test data. Their descriptions are equivalent.  Here are some relevant files to this assignment 

- 'test': Test Data
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train': Training Data
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Also, the raw data from the 'Inertial Signals' were ignored

## Analysis/Processing Details