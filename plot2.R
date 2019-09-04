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

## open png file device, create "plot2.png" in working directory
png("plot2.png")

## create a line plot with date_time and Global_active_power vars, set x- and y-labels
with(myData, plot(date_time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

## close png file device
dev.off()