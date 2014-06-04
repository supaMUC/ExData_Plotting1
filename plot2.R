### Create PNG File for Plot 2

## Read data
x <- read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?",colClasses=c("factor","factor",rep("numeric",7))) 

## Merge Date and Time Column to Timestamp
x$Timestamp <- strptime(paste(x$Date,x$Time), "%d/%m/%Y %H:%M:%S")  

## Subset Data to 2007-02-01 and 2007-02-02
x_sub <- subset(x,as.Date(x$Timestamp) == as.Date("2007-02-01") | as.Date(x$Timestamp) == as.Date("2007-02-02"))

## Open PNG Graphic Device
png("plot2.png",width = 480, height = 480, units = "px")

##Plot Graph
plot(x_sub$Timestamp,x_sub$Global_active_power, type = "l",xlab ="",ylab = "Global Active Power (kilowatts)")

##Close Device
dev.off()