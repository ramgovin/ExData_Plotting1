## FileName: plot2.R 
## Date: 06/02/2015
## This logic is going to read a big text file 
## and plot xy chart for a datetime vs. Global Active Power Consumption in Kilowats 

## Read the full flat file 
fullData<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".")

## Get the subset of data for the dates 1/2/2007 and 2/2/2007
specData<-fullData[fullData$Date %in% c("1/2/2007", "2/2/2007"),]

## Convert the Global Active Power column data to numeric for plotting Histogram 
pData<-as.numeric(specData$Global_active_power)

## Get the Datetime together using strptime and paste commands
datetime <- strptime(paste(specData$Date, specData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Plot the datetime on x-axis and Global Active Power as y-axis
plot(datetime, pData, type="l", xlab="", ylab="Goabl Active Power (kilowatts)")

## Use Copy to copy the display device to PNG format 
dev.copy(png, file="plot2.png", height=480, width=480)

## Shutdown Device 
dev.off()
