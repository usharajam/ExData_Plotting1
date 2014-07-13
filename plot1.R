# plot1: Generates a histogram of Global Active power frequency
# The graph is stored as plot1.png in the current working directory.
plot1 <- function() {
  # Download and read relevant data -- Data from dates 1/2/2007 and 2/2/2007 are only considered
  source("./readFiles.R")
  downloadDataSet()
  plottingData <- readSelectedData()
  
  # Histogram is generated in plot1.png file
  png("plot1.png")
  hist(as.numeric(plottingData$Global_active_power), col="red", xlab= "Global Active Power (kilowatts)", ylab = "Frequency", main ="Global Active Power")
  dev.off()
}

