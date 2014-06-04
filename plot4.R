### Create PNG File for Plot 3

## Read data
x <- read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?",colClasses=c("factor","factor",rep("numeric",7))) 

## Merge Date and Time Column to Timestamp
x$Timestamp <- strptime(paste(x$Date,x$Time), "%d/%m/%Y %H:%M:%S")  

## Subset Data to 2007-02-01 and 2007-02-02
x_sub <- subset(x,as.Date(x$Timestamp) == as.Date("2007-02-01") | as.Date(x$Timestamp) == as.Date("2007-02-02"))

## Open PNG Graphic Device
png("plot4.png",width = 480, height = 480, units = "px")

## Create grid
par(mfcol=c(2,2))

##Plot Graph 1
plot(x_sub$Timestamp,x_sub$Global_active_power, type = "l",xlab ="",ylab = "Global Active Power")

##Plot Graph 2
plot(x_sub$Timestamp,x_sub$Sub_metering_1, type = "l",xlab ="",ylab = "Energy sub metering",col="black")
lines(x_sub$Timestamp,x_sub$Sub_metering_2,col="red")
lines(x_sub$Timestamp,x_sub$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"),bty = "n")

##Plot Graph 3
plot(x_sub$Timestamp,x_sub$Voltage,type ="l",xlab="datetime",ylab="Voltage")

##Plot Graph 4
plot(x_sub$Timestamp,x_sub$Global_reactive_power,type ="l",xlab="datetime",ylab = "Global_reactive_power")

##Close Device
dev.off()