best<-function(state,outcome)
{
#read files and rearrange by states 
  read_file<-read.csv("outcome-of-care-measures.csv")
  name_by_states<-split(outcome[outcome$Hospital.Name,c(11,17,23)],outcome$State)
  
#match state name and subset 
  data_per_state<-subset(name_by_state, outcome$State==state) 
  if(data_per_state=NULL)
    {
    print("Invalid state")
    stop()
    }
#match by outcome
  if(outcome=="heart attack")
  {
    minimum<-min(outcome[,11])
    #row_index of minimum value
   print(outcome$Hospital.Name[row_index])
  }
  else if (outcome=="heart failure")
  {
    hosp_name<-min(outcome[,17])
    print(hosp_name)
  }
  else if (outcome=="pneumonia")
  {
    hosp_name<-min(outcome[,23])
    print(hosp_name)
  }
  else 
  {
    print("Invalid outcome")
    stop()
  }
}