# plot2: Generates a plot of Global Active power usage against each timestamps
# The plot is stored as plot2.png in the current working directory.
plot2 <- function() {
  
  # Download and read relevant data -- Data from dates 1/2/2007 and 2/2/2007 are only considered
  source("./readFiles.R")
  downloadDataSet()
  plottingData <- readSelectedData()
  
  # Get the timestamp from date and time fields
  dateTime <- paste(plottingData$Date[1:nrow(data)], plottingData$Time[1:nrow(data)])
  datetime_formatted  <- strptime(dateTime,format ="%d/%m/%Y %H:%M:%S")
  
  # Global Active Power Vs Timestamp plotted as png file
  png("plot2.png")
  plot(datetime_formatted, plottingData$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)")
  dev.off()
}