setwd("C:/Users/Eduardo/Documents/Curso_doctorado/Data_analysis/Getting and cleaning data/Peer graded assignment")

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation 
	#for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set 
	#with the average of each variable for each activity and each subject.

# I download and unzip the files
if(!file.exists("./data")){dir.create("./data")}
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(Url,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# These are the libraries required.
library(data.table)
library(reshape2)

#Final files
tidy_dataset<-"./tidy-dataset.txt"
tidy_datasetAVG<-"./tidy-datasetAVG.csv"
tidy_datasetAVGtxt<-"./tidy-datasetAVG.txt"

##
###First activity. Merges the training and the test sets to create one data set.
###
##

x_train<-read.table("./UCI HAR Dataset/train/X_train.txt",header=F)
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt", header = F)
dim(x_train)
dim(y_train)

x_test<-read.table("./UCI HAR Dataset/test/X_test.txt",header=F)
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",header=F)
dim(x_test)
dim(y_test)

subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt", header = F)
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt", header = F)

#Here, I combine the file with data (x_train) with labels (x_text)
# and the same thing happen to y_train and y_test

A<-rbind(x_train,x_test)
B<-rbind(y_train,y_test)
C<-rbind(subject_train,subject_test)

###
####2. Extracts only the measurements on the mean and standard deviation 
##	#for each measurement.
###

features<-read.table("./UCI HAR Dataset/features.txt")
#Here the rename columns names of features to features_id and features_name
names(features)<-c('features_id','features_name')
# Searches each element of char vector for matches to the mean or std
index_features<-grep("-mean\\(\\)|-std\\(\\)",features$features_name) 
A<-A[,index_features]
# Replaces the matches from string
names(A)<-gsub("\\(|\\)","",(features[index_features,2]))
head(A)

###
##3. Uses descriptive activity names to name the activities in the data set
##

activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
#Rename the column to act_id and act_name instead V1 and V2
names(activities) <- c('act_id', 'act_name')
#assing the activity acording to the number of act_id.
B[,1]=activities[B[,1],2]

###
####4. Appropriately labels the data set with descriptive variable names.
###
#Rename the name of every column
names(B)<-"Activity"
names(C)<-"Subject"
#Finally we unify the A,B,C data
tidyDataSet<-cbind(C,B,A)

###
####5. From the data set in step 4, creates a second, independent tidy data set 
####	#with the average of each variable for each activity and each subject.
###

m <- tidyDataSet[,3:dim(tidyDataSet)[2]]
tidyDataAVGSet<-aggregate(m,list(tidyDataSet$Subject,tidyDataSet$Activity),mean)

#rename the columns from the data extracted 
names(tidyDataAVGSet)[1]<-"Subject"
names(tidyDataAVGSet)[2]<-"Activity"
# Created a tidy data set CSV in diretory |  Tidy UCI-HAR Dataset that compares the Mean of each variable for each Activity with each Subject
write.table(tidyDataSet,tidy_dataset,sep="")
# Created a tidy data set for Means CSV in diretory |  Tidy UCI-HAR Dataset that compares the Mean of each variable for each Activity with each Subject
write.csv(tidyDataAVGSet,tidy_datasetAVG,sep="")
# Created a tidy data set for Means as a TXT in diretory |  Tidy UCI-HAR Dataset that compares the Mean of each variable for each Activity with each Subject
write.table(tidyDataAVGSet, tidy_datasetAVGtxt, sep="", row.names=FALSE)

