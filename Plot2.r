
#Load DATA
setwd('C:/Users/Vo Ngoc Tram/Desktop/assignment')
getwd()
datafile='household_power_consumption.txt'
data=read.table(datafile, header = TRUE, sep=';', stringsAsFactors = FALSE, dec='.')
print(data)

# data from the dates 2007-02-01 and 2007-02-02
sub_data=data[data$Date %in% c('1/2/2007', '2/2/2007'),]
print(sub_data)

# take Global_active_power
datetime = strptime(paste(sub_data$Date, sub_data$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower = as.numeric(sub_data$Global_active_power)

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png( width = 480, height = 480, file = "Plot2.png")
#pdf("Plot.pdf")
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

