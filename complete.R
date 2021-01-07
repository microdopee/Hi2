complete<-function(directory,id=1:332)
{
  setwd(directory)
  all_files<-list.files(pattern=".csv")
      data1<-data.frame(id=integer(),nobs=integer())
      data<-data.frame(id=integer(),nobs=integer())
  for (i in id)
    {
    data1<-read.csv(all_files[i])
    x<-complete.cases(data1)
    nobs<-sum(x)
    data<-rbind(data,data.frame("id"=i,"nobs"=nobs))
  }
  setwd("~/R/datasciencecoursera/")
  print(data)
}
