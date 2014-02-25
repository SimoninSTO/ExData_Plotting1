data<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

library(dplyr)
x<-filter(data,Date>="2007-02-01"&Date<="2007-02-02")
x <- x[complete.cases(x),]
x<-mutate(x,datetime=paste(x$Date, x$Time))
x$datetime <- as.POSIXct(x$datetime)

with(x, {
        plot(Sub_metering_1~datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~datetime,col='Red')
        lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()