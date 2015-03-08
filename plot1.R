path = "household_power_consumption.txt"
data=read.table(path,sep=";", quote="", header=TRUE)

data$Date = as.Date(data$Date, format="%d/%m/%Y")
data$Time = strptime(data$Time,format="%H:%M:%S")
# Subset only to get first and second of Feb 2007
sub=subset(data,data$Date == '2007-02-01' | data$Date == '2007-02-02' )
# convert Global active power to numeric
sub$Global_active_power = as.numeric(as.character(sub$Global_active_power))

png(filename="plot1.png", width=480, height=480)
hist(sub$Global_active_power, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
