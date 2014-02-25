data<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

library(dplyr)
x<-filter(data,Date>="2007-02-01"&Date<="2007-02-02")
x <- x[complete.cases(x),]
x<-mutate(x,datetime=paste(x$Date, x$Time))
x$datetime <- as.POSIXct(x$datetime)

plot(x$Global_active_power~x$datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()