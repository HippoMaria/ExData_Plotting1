# Read in Dataset

setwd("C:/Users/xgao/Desktop/R/Assignment 4")

library(dplyr)

original <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
original$date2<- as.Date(original$Date, "%d/%m/%Y")

use<-filter(original, date2=="2007-02-01"|date2=="2007-02-02")

use$datetime<-paste(use$date2,use$Time, sep=" ")
use$DT<-as.POSIXct(use$datetime)

# Plot 4

png(file="Plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(use, {
  plot(Global_active_power~DT, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DT, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~DT, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DT,col='Red')
  lines(Sub_metering_3~DT,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DT, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()
