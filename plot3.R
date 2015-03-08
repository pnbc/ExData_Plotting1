path = "household_power_consumption.txt"
data=read.table(path,sep=";", quote="", header=TRUE)


data$date_time=as.POSIXct(paste(data$Date, data$Time, sep=" "), format= "%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, format="%d/%m/%Y")

# Subset only to get first and second of Feb 2007
sub=subset(data,data$Date == '2007-02-01' | data$Date == '2007-02-02' )

# convert submetering to numeric
sub$Sub_metering_1 = as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2 = as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3 = as.numeric(as.character(sub$Sub_metering_3))


# do the actual plotting and save to png
png(filename="plot3.png", width=480, height=480)

plot(sub$date_time, sub$Sub_metering_1, type="l",xlab="",ylab = "Energy sub metering")
lines(sub$date_time, sub$Sub_metering_2, col="red")
lines(sub$date_time, sub$Sub_metering_3, col="blue")

legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1)

dev.off()

