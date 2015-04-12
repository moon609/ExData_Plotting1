# read in the file
data <- read.table("household_power_consumption.txt", sep = ";")
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Subset data 
sub<-subset(data,Date%in%c("1/2/2007","2/2/2007"))

## Converting dates
library(lubridate)
sub$Date<-as.Date(sub$Date, format="%d/%m/%Y")
DT<-paste(sub$Date, sub$Time)
DT<-as.POSIXct(DT)

## Subset data for plot2
GAP <- as.numeric(as.character(sub$Global_active_power))

## x-axis mark from chinese to english
Sys.setlocale("LC_ALL", "English")

## plot
plot(GAP~DT, type="l",ylab="Global Active Power (kilowatts)", xlab="")

## Save the image
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

