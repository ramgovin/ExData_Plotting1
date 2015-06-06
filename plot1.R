## FileName: plot1.R 
## Date: 06/02/2015
## This logic is going to read a big text file 
## and plot Histogram for a subset of Global Active Power Consumption in Kilowats

## Read the full flat file 
fullData<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".")

## Get the subset of data for the dates 1/2/2007 and 2/2/2007
specData<-fullData[fullData$Date %in% c("1/2/2007", "2/2/2007"),]

## Convert the Global Active Power column data to numeric for plotting Histogram 
pData<-as.numeric(specData$Global_active_power)

## Histogram function to plot the Global Active Power data vs. Freequency 
hist(pData, xlab="Global Active Power (kilowatts)", main='Global Active Power', col="red")

## Use Copy to copy the display device to PNG format 
dev.copy(png, file="plot1.png", height=480, width=480)

## Shutdown Device 
dev.off()
