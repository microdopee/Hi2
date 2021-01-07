corr<-function(directory,threshold=0)
{
  setwd(directory)
  all_files<-list.files(pattern=".csv")
  output<-c()
for (i in 1:332)
{
  data<-read.csv(all_files[i])
  y<-complete.cases(data)
  data<-data[y,]

  if (sum(y)>threshold)
  {
    correlation_quotient<-cor(data$sulfate,data$nitrate)
  }
  else if (sum(y)<=threshold)
  {
    correlation_quotient<-numeric()
  }
  output<-c(output, correlation_quotient)
}
  setwd("~/R/datasciencecoursera/")
  return(output)
}
