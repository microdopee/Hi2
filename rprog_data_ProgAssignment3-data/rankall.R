rankall<-function(outcome,num="best")
{
read_file<-read.csv("~/datasciencecoursera/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv")

#set a
if(outcome=="heart attack"){
  a<-11
}else if (outcome=="heart failure"){
  a<-17
}else if(outcome=="pneumonia"){
  a<-23
}else {stop("invalid outcome")}

#Shrink data set to 3 variables
read_file<-read_file[,c(2,7,a)]

#order data set by outcome and then alphabetise
read_file[,c(1,2)]<-sapply(read_file[,c(1,2)],as.character)
read_file[,3]<-as.numeric(read_file[,3])
read_file<-read_file[order(read_file[,3],read_file[,1]),]

#Split by State=factor
df<-split(read_file,read_file$State)
x<-data.frame("Name"=character(),"State"=character())

for (i in 1:54)
{
#Homogenize data
  frame<-df[[i]]

  if(num=="best")
  {
    rnum<-1
  }else if(num=="worst")
    {
    b<-!is.na(frame[,3])
    a<-sum(b)
    rnum<-a }else  {
    rnum<-num}
  
  #resulting 2 column df
  result<-data.frame("Name"=frame[rnum,1],"State"=frame[1,2])
  x<-rbind(x,result)
}
return(as.data.frame(x))
}

