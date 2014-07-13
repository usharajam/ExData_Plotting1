downloadDataSet<-function(
  dataSetURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
){
  if(!file.exists("./household_power_consumption.txt")){
    dir.create("./data")
    temp <-tempfile()
    download.file(dataSetURL, temp, method="curl")
    unzip(temp,exdir="./data/")
    unlink(temp)
  }
}
  ## Assumption: for OSs other than windows using grep with pipe works perfect for filtering data
  ## For Windows Platform we need findstr in the place of grep 
  ## The dates to filter are hard coded
  readSelectedData<- function(){
   
    ## findstr -- works only for windows....
    if (.Platform$OS.type == "windows")
    dat <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';')
       
    else
    dat <- read.table(pipe('grep ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';')  
    
    colnames(dat) <-names(read.table('./household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
    dat
  }
  