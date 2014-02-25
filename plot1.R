data<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

library(dplyr)
x<-filter(data,Date>="2007-02-01"&Date<="2007-02-02")
x <- x[complete.cases(x),]
x<-mutate(x,datetime=paste(x$Date, x$Time))
x$datetime <- as.POSIXct(x$datetime)

hist(x$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="red")

        dev.copy(png,"plot1.png", width=480, height=480)
        dev.off()