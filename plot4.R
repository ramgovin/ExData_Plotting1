## FileName: plot4.R 
## Date: 06/02/2015
## This logic is going to read a big text file 
## and plot various charts in 2x2 matrix 

## Read the full flat file 
fullData<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".")

## Get the subset of data for the dates 1/2/2007 and 2/2/2007
specData<-fullData[fullData$Date %in% c("1/2/2007", "2/2/2007"),]

## Convert the GlobalActivePower, GlobalReactivePower and Voltage columns for plotting
globalActivePower <- as.numeric(specData$Global_active_power)
globalReactivePower <- as.numeric(specData$Global_reactive_power)
voltage <- as.numeric(specData$Voltage)

## Convert the Sub_metering columns data to numeric for plotting  
subMetering1<-as.numeric(specData$Sub_metering_1)
subMetering2<-as.numeric(specData$Sub_metering_2)
subMetering3<-as.numeric(specData$Sub_metering_3)

## Get the Datetime together using strptime and paste commands
datetime <- strptime(paste(specData$Date, specData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Call png function to setup png file
png(filename="plot4.png", width=480, height=480)

## Plot 2x2 (4 charts) using par command 
par(mfrow= c(2,2))

## Plot datetime vs. Global Active Power (1x1 - First chart)
plot(datetime, globalActivePower, type="l", ylab="Global Active Power", xlab="")

## Plot datetime vs. Voltage (1x2 - Second chart)
plot(datetime, voltage, type="l", ylab="Voltage", xlab="datetime")

## Plot the datetime vs. SubMetering1 as y-axis (2x1 - Third chart)
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy Submetering")
## Draw additional lines for subMetering2 & 3 with red and blue colors
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
## Create legend for all three lines on the plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=2.5, 
        bty="n" ,col=c("black", "red", "blue"))

## Plot the datetime vs. Global Reactive Power (2x2 - Fourth chart)
plot(datetime, globalReactivePower, type="l", ylab="Global_reactive_power", xlab="datetime")

## DO NOT use dev.copy option, The legend is getting truncated and generating partial
## PNG file for my RStudio version (Version 0.98.1103). Most likely a bug in the dev.copy()
## So I used png() function instead of dev.copy() for this exercise
## dev.copy(png, file="plot3.png", height=480, width=480)

## Shutdown Device 
dev.off()
