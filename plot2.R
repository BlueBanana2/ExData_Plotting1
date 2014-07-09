y <- data.frame(read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?"))
datetime<-paste(y$Date,y$Time)
y$datetime<-strptime(datetime,"%d/%m/%Y %H:%M:%s")
#y$Time<-strptime(y$Time,"%H:%M:%s")
y$Date<-as.Date(y$Date,"%d/%m/%Y")
y<-y[which(y$Date>="2007-02-01" & y$Date<="2007-02-02"),]

png(file="plot2.png")
plot(y$datetime,y$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()