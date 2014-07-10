y <- data.frame(read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?"))
datetime<-paste(y$Date,y$Time)
y$datetime<-strptime(datetime,"%d/%m/%Y %H:%M:%s")
#y$Time<-strptime(y$Time,"%H:%M:%s")
y$Date<-as.Date(y$Date,"%d/%m/%Y")
y<-y[which(y$Date>="2007-02-01" & y$Date<="2007-02-02"),]

png(file="plot3.png", width=480, height=480)

plot(y$datetime,y$Sub_metering_1,type="l",ylab="Energy Sub metering",xlab="", col="black")
lines(y$datetime,y$Sub_metering_2,type="l",col="red")
lines(y$datetime,y$Sub_metering_3,type="l",col="blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

dev.off()