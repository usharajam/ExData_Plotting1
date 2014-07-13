# plot 4: Generates 4 plots which are displayed as 2 * 2 matrix and store it in
# "plot4.png file in the current working directory

plot4 <- function() {
  
  # Download and read relevant data -- Data from dates 1/2/2007 and 2/2/2007 are only considered
  source("./readFiles.R")
  downloadDataSet()
  plottingData <- readSelectedData()
  
  # Format Date and time column for plotting
  dateTime <- paste(plottingData$Date[1:nrow(data)], plottingData$Time[1:nrow(data)])
  datetime_formatted  <- strptime(dateTime,format ="%d/%m/%Y %H:%M:%S")
  
  # Create a png file for the graphics
  png("plot4.png")
  
  # 4 plots arranged in a 2 cross 2 matrix
  par(mfrow=c(2,2))
  
  # Top left plot - Global Active power Vs DateTime
  plot(datetime_formatted, plottingData$Global_active_power, type = "l", xlab=" ", ylab ="Global Active Power")
  
  # Top right plot for Voltage Vs DateTime
  plot(datetime_formatted, plottingData$Voltage, type = "l", xlab="datetime", ylab ="Voltage")
  
  # Bottom left plot for 3 different Submetering data Vs DateTime
  plot(datetime_formatted, plottingData$Sub_metering_1, type = "l", xlab = "", ylab= "Energy sub metering")
  lines(datetime_formatted, plottingData$Sub_metering_2, type = "l", col = "red")
  lines(datetime_formatted, plottingData$Sub_metering_3, type = "l", col = "blue")
  legend(x="topright", 
         c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
         lty=c(1,1,1), # gives the legend appropriate symbols (lines)
         bty="n",# transparent legend box
         lwd=c(2.5,2.5,2.5),col=c("black", "red","blue")) 
  
  # Bottom right plot for Global reactive power Vs DateTime
  plot(datetime_formatted, plottingData$Global_reactive_power,  type = "l", xlab="datetime", ylab ="Global_rective_power")
  dev.off()
}