pollutantmean<-function(directory, pollutant , id=1:332)
{
  setwd(directory)
  all_files<-list.files(pattern=".csv")
  data1<-data.frame()
  data<-data.frame()
  for (i in id)
  {
    data1<-read.csv(all_files[i])
    data<-rbind(data,data1)
  }
  
  if (pollutant=="nitrate")
  {
    x<-mean(data$nitrate, na.rm = TRUE)
  }
  else if (pollutant=="sulfate")
  {
    x<-mean(data$sulfate, na.rm = TRUE)
  }
  print(x)
  setwd("~/R/datasciencecoursera/")
}
