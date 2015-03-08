path = "household_power_consumption.txt"
data=read.table(path,sep=";", quote="", header=TRUE)


data$date_time=as.POSIXct(paste(data$Date, data$Time, sep=" "), format= "%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, format="%d/%m/%Y")

# Subset only to get first and second of Feb 2007
sub=subset(data,data$Date == '2007-02-01' | data$Date == '2007-02-02' )
# convert Global active power to numeric
sub$Global_active_power = as.numeric(as.character(sub$Global_active_power))

png(filename="plot2.png", width=480, height=480)
plot(sub$date_time, sub$Global_active_power, type="l",xlab="",ylab = "Global Active Power(kilowatts)")
dev.off()
