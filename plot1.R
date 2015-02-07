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

## Creating plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving plot to file with height 480 and width 480
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()