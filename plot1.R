# read in the file
data <- read.table("household_power_consumption.txt", sep = ";")
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Subset data 
sub<-subset(data,Date%in%c("1/2/2007","2/2/2007"))

## Subset data for plot1
GAP <- as.numeric(as.character(sub$Global_active_power))

## Create histogram
hist(GAP, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## Save the image
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
