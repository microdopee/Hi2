download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "~/datasciencecoursera/Course3.zip") 
unzip(zipfile = "~/datasciencecoursera/Course3.zip")
setwd("~/datasciencecoursera/UCI HAR Dataset")

library(dplyr)

features<-read.table("features.txt", col.names = c("findex","func"))
activity_labels<-read.table("activity_labels.txt", col.names = c("aindex","activity"))

X_test<-read.table("test/X_test.txt")
Y_test<-read.table("test/Y_test.txt", col.names = "aindex")
subject_test<-read.table("test/subject_test.txt",header = FALSE, col.names = "subject")


X_train<-read.table("train/X_train.txt")
Y_train<-read.table("train/Y_train.txt", col.names="aindex")
subject_train<-read.table("train/subject_train.txt", col.names = "subject")

X<-rbind(X_train,X_test)
Y<-rbind(Y_train,Y_test)
subject<-rbind(subject_train,subject_test)

names(X)<-features$func

Y<-merge(activity_labels,Y, by="aindex")
A<-select(Y, "activity")

full<-cbind(subject,A,X)

full<-select(full, subject, activity, contains("mean"), contains("std"))

names(full)<-sub("^t","Time ",names(full))
names(full)<-sub("^f","Frequency ",names(full))
names(full)<-sub("Acc"," by accelerometer ",names(full))
names(full)<-sub("Gyro"," by gyroscope ",names(full))
names(full)<-sub("Mag"," magnitute ",names(full))
names(full)<-sub("-"," ",names(full))
names(full)<-sub("X"," along X ",names(full))
names(full)<-sub("Y"," along Y ",names(full))
names(full)<-sub("Z"," along Z ",names(full))
names(full)<-sub("BodyBody"," body ",names(full))

write.table(full, "Course 3 tidy data.txt", row.names = FALSE)
