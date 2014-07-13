# plot3: Generates a plot of 3 different Sub Meter Readings against each timestamps
# The plot is stored as plot3.png in the current working directory.
plot3 <- function() {
  
  # Download and read relevant data -- Data from dates 1/2/2007 and 2/2/2007 are only considered
  source("./readFiles.R")
  downloadDataSet()
  plottingData <- readSelectedData()
  
  # Cast Date and time into Timestamps
  dateTime <- paste(plottingData$Date[1:nrow(data)], plottingData$Time[1:nrow(data)])
  datetime_formatted  <- strptime(dateTime,format ="%d/%m/%Y %H:%M:%S")
  
  # Three sub meter readings are plotted as 3 different colored lines
  # Legends are added to describe which colored line corresponds to which submeter reading
  png("plot3.png")
  plot(datetime_formatted, plottingData$Sub_metering_1, type = "l", xlab = "", ylab= "Energy sub metering")
  lines(datetime_formatted, plottingData$Sub_metering_2, type = "l", col = "red")
  lines(datetime_formatted, plottingData$Sub_metering_3, type = "l", col = "blue")
  legend(x="topright", 
         c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"),  
         lty=c(1,1,1), # gives the legend appropriate symbols (lines)
         box.lty= 1,
         lwd=c(2.5,2.5,2.5),col=c("black", "red","blue")) 
  dev.off()
}