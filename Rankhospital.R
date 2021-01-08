rankhospital<-function(state, outcome, num="best")
{
#read file and subset by state
  read_file<-read.csv("~/datasciencecoursera/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv")
  
  read_file<-subset(read_file[,c(2,7,11,17,23)],read_file$State==state)
  if(is.na(read_file[1,])) 
  {stop("invalid state")}
  
#homogenize columns
read_file[,c(1,2)]<-sapply(read_file[,c(1,2)],as.character)  
read_file[,c(3,4,5)]<-sapply(read_file[,c(3,4,5)],as.numeric)
  
  
  if(outcome=="heart attack") 
    {a<-3} else if(outcome=="heart failure") 
    {a<-4}else if(outcome=="pneumonia") 
    {a<-5} else {stop("invalid outcome")}
  
read_file<-read_file[order(read_file[,a],read_file[,1]),]
#subset by outcome
  if(num=="best")
  {
    row_index<-1
  }else if (num=="worst")
  {
    maximum<-max(read_file[,a], na.rm = TRUE)
    row_index<-which(read_file[,a]==maximum)
    row_index<-max(row_index)
  } else 
  {
    row_index<-num
  }
   print(read_file[row_index,1])
}
