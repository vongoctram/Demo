#Load DATA
setwd('C:/Users/Vo Ngoc Tram/Desktop/assignment')
getwd()
datafile='household_power_consumption.txt'
data=read.table(datafile, header = TRUE, sep=';', stringsAsFactors = FALSE, dec='.')
print(data)

# data from the dates 2007-02-01 and 2007-02-02
sub_data=data[data$Date %in% c('1/2/2007', '2/2/2007'),]
print(sub_data)

# take Sub_metering
datetime = strptime(paste(sub_data$Date, sub_data$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower = as.numeric(sub_data$Global_active_power)
voltage = as.numeric(sub_data$Voltage)
globalReactivepower = as.numeric(sub_data$Global_reactive_power)
Sub_metering1 = as.numeric(sub_data$Sub_metering_1)
Sub_metering2 = as.numeric(sub_data$Sub_metering_2)
Sub_metering3 = as.numeric(sub_data$Sub_metering_3)

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png( width = 480, height = 480, file = "Plot3.png")
#pdf("Plot.pdf")
par(mfrow=c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, voltage, type="l",  xlab="datetime", ylab="Voltage")
plot(datetime, Sub_metering1, type="l", xlab="", ylab="Energy Sub metering")
lines(datetime, Sub_metering2, col = "red", type = "l")
lines(datetime, Sub_metering3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, globalReactivepower, type="l",  xlab="datetime", ylab="Global_reactive_power")
dev.off()