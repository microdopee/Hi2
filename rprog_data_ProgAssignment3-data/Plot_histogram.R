setwd("~/datasciencecoursera/rprog_data_ProgAssignment3-data")
##Used "read_file" instead of "outcome" to avoid confusion
read_file<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(read_file)
ncol(read_file)
names(read_file)
read_file[,11]<-as.numeric(read_file[,11])
hist(read_file[,11])
