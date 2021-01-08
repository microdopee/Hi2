best<-function(state,outcome)
{
#read files and rearrange by states 
  read_file<-read.csv("~/datasciencecoursera/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv")
  data_by_state<-subset(read_file[,c(11,17,23)],outcome$State==state)
  
#match state name and subset 
  if(data_by_state=NULL)
    {
    print("Invalid state")
    stop()
    }
#match by outcome
  if(outcome=="heart attack")
  {
    #row_index of minimum value
    minimum<-min(data_by_state[,11])
    #get row with minimum value
    row_index<-which(data_by_state[,11]==minimum)
  }
  else if (outcome=="heart failure")
  {
    #row_index of minimum value
    minimum<-min(data_by_state[,17])
    #get row with minimum value
    row_index<-which(data_by_state[,17]==minimum)
  }
  else if (outcome=="pneumonia")
  {
    #row_index of minimum value
    minimum<-min(data_by_state[,23])
    #get row with minimum value
    row_index<-which(data_by_state[,23]==minimum)
  }
  else 
  {
    print("Invalid outcome")
    stop()
  }
#Printing alphabetically
  if(length(row_index!=1))
  {
    sorting_data<-data_by_state[row_index,2]
    sorted_list<-sort(sorting_data[,2])
    print(sorted_list[1])
  }
  else
  {
    print(data_by_state[row_index,2])
  }
}