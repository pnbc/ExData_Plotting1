path = "household_power_consumption.txt"
data=read.table(path,sep=";", quote="", header=TRUE)

data$date_time=as.POSIXct(paste(data$Date, data$Time, sep=" "), format= "%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, format="%d/%m/%Y")

# Subset only to get first and second of Feb 2007
sub=subset(data,data$Date == '2007-02-01' | data$Date == '2007-02-02' )
# convert Global active power to numeric
sub$Global_active_power = as.numeric(as.character(sub$Global_active_power))
# convert submetering to numeric
sub$Sub_metering_1 = as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2 = as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3 = as.numeric(as.character(sub$Sub_metering_3))
# conver voltage to numeric
sub$Voltage = as.numeric(as.character(sub$Voltage))
# Convert global reactive power to numeric
sub$Global_reactive_power = as.numeric(as.character(sub$Global_reactive_power))

png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))
# First plot
plot(sub$date_time, sub$Global_active_power, type="l",xlab="",ylab = "Global Active Power")
# Second plot
plot(sub$date_time, sub$Voltage, type="l",xlab="datetime",ylab = "Voltage")

# third plot
plot(sub$date_time, sub$Sub_metering_1, type="l",xlab="",ylab = "Energy sub metering")
lines(sub$date_time, sub$Sub_metering_2, col="red")
lines(sub$date_time, sub$Sub_metering_3, col="blue")
# forth plot
plot(sub$date_time, sub$Global_reactive_power, type="l",xlab="datetime",ylab = "Global_reactive_power")

dev.off()
