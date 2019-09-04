library(lubridate)

## set working directory to the cloned GitHub repo
setwd("./Desktop/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")

## download and unzip the zip file in the working directory
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "ElectricPowerConsumptionData.zip", method = "curl")
myFile <- unzip("ElectricPowerConsumptionData.zip")

## read in data, subset on relevant dates, convert Date and Time vars to POSIXct using lubridate
fullData <- read.table(myFile, header = TRUE, na.strings = "?", sep = ";", stringsAsFactors = FALSE)
myData <- subset(fullData, fullData$Date == "1/2/2007" | fullData$Date == "2/2/2007")
myData$date_time <- dmy_hms(paste(myData$Date, myData$Time))

## open png file device, create "plot4.png" in working directory
png("plot4.png")

## set layout to 2x2, filling rows first
par(mfrow = c(2,2))

## create top left plot
with(myData, plot(date_time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

## create top right plot
with(myData, plot(date_time, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

## create bottom left plot
with(myData, plot(date_time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(myData, lines(date_time, Sub_metering_2, col = "red"))
with(myData, lines(date_time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

## create bottom right plot
with(myData, plot(date_time, Global_reactive_power, type = "l", xlab = "datetime"))

## close png file device
dev.off()