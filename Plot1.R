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
