best<-function(state,outcome)
{
#read files and rearrange by states 
  read_file<-read.csv("~/datasciencecoursera/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv")
  read_file<-subset(read_file[,c(2,11,17,23)],read_file$State==state)
  
#match state name and subset 
  if(is.na(read_file[1,])){stop("invalid state")}
#homogenize data type
  read_file[,1]<-as.character(read_file[,1])
  read_file[,c(2,3,4)]<-sapply(read_file[,c(2,3,4)],as.numeric)
#match by outcome
  if(outcome=="heart attack")
  {
    #row_index of minimum value
    minimum<-min(read_file[,2], na.rm = TRUE)
    #get row with minimum value
    row_index<-which(read_file[,2]==minimum)
  }else if (outcome=="heart failure")
  {
    #row_index of minimum value
    minimum<-min(read_file[,3], na.rm = TRUE)
    #get row with minimum value
    row_index<-which(read_file[,3]==minimum)
  }else if (outcome=="pneumonia")
  {
    #row_index of minimum value
    minimum<-min(read_file[,4], na.rm = TRUE)
    #get row with minimum value
    row_index<-which(read_file[,4]==minimum)
  }else 
  {
    stop("invalid outcome")
  }
#Printing alphabetically
  if(length(row_index)!=1)
  {
    sorting_data<-read_file[row_index,1]
    sorted_list<-sort(sorting_data)
    print(sorted_list[1])
  }else
  {
    print(read_file[row_index,1])
  }
}
