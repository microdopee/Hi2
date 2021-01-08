best<-function(state,outcome)
{
#read files and rearrange by states 
  read_file<-read.csv("~/datasciencecoursera/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv")
  read_file<-subset(read_file,read_file$State==state)
  
#match state name and subset 
  if(is.null(read_file))
    {
    stop("Invalid state")
    }
#match by outcome
  if(outcome=="heart attack")
  {
    #row_index of minimum value
    minimum<-min(read_file[,11], na.rm = TRUE)
    #get row with minimum value
    row_index<-which(read_file[,11]==minimum)
  }
  else if (outcome=="heart failure")
  {
    #row_index of minimum value
    minimum<-min(read_file[,17], na.rm = TRUE)
    #get row with minimum value
    row_index<-which(read_file[,17]==minimum)
  }
  else if (outcome=="pneumonia")
  {
    #row_index of minimum value
    minimum<-min(read_file[,23], na.rm = TRUE)
    #get row with minimum value
    row_index<-which(read_file[,23]==minimum)
  }
  else 
  {
    stop("Invalid outcome")
  }
#Printing alphabetically
  if(length(row_index)!=1)
  {
    sorting_data<-read_file[row_index,2]
    sorted_list<-sort(sorting_data[,2])
    print(sorted_list[1])
  }
  else
  {
    print(read_file[row_index,2])
  }
}
