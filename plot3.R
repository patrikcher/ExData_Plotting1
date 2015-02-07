## Get full dataset
fullData <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fullData$Date <- as.Date(fullData$Date, format="%d/%m/%Y")

## Subsetting to use data from the dates 2007-02-01 and 2007-02-02
data <- subset(fullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fullData)

## Converting dates
dateTime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(dateTime)

## Creating plot 3
with(data, {
  plot(Sub_metering_1~Datetime, 
       type="l", xlab="",
       ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

## Adding legend on top right corner
legend("topright", col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

## Saving plot to file with height 480 and width 480
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()