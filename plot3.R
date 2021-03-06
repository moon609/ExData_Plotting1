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

## x-axis mark from chinese to english
Sys.setlocale("LC_ALL", "English")

## Sub data for plot3
Sm1 <- as.numeric(as.character(sub$Sub_metering_1))
Sm2 <- as.numeric(as.character(sub$Sub_metering_2))
Sm3 <- as.numeric(as.character(sub$Sub_metering_3))

## plot
plot(Sm1~DT, type="l",ylab="Energy sub metering", xlab="")
lines(Sm2~DT,col="Red")
lines(Sm3~DT,col="Blue")
legend("topright",col=c("black", "red", "blue"), lty=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save the image
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()

