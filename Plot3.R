# Read in Dataset

setwd("C:/Users/xgao/Desktop/R/Assignment 4")

library(dplyr)

original <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
original$date2<- as.Date(original$Date, "%d/%m/%Y")

use<-filter(original, date2=="2007-02-01"|date2=="2007-02-02")

# Plot 1

png(file="Plot1.png", width=480, height=480)
hist(use$Global_active_power, col="red", xlab="Global Active Power (kilowatt)", ylab="Frequency", main="Global Active Power")
dev.off()

# Plot 2

use$datetime<-paste(use$date2,use$Time, sep=" ")
use$DT<-as.POSIXct(use$datetime)

png(file="Plot2.png", width=480, height=480)
with(use, {
  plot(Global_active_power~DT, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()

# Plot 3

png(file="Plot3.png", width=480, height=480)
with(use, {
  plot(Sub_metering_1~DT, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DT,col='Red')
  lines(Sub_metering_3~DT,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
