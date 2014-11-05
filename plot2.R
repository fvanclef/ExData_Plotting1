data <- read.csv('household_power_consumption.txt', sep = ";", stringsAsFactors = FALSE )
as_date <- as.Date(data[,1],'%d/%m/%Y')
start <- as.Date('01/02/2007','%d/%m/%Y')
end <- as.Date('02/02/2007','%d/%m/%Y')
filter <- as_date >= start & as_date <= end & data$Global_active_power != '?'
data <- data[filter,]
as_date <- strptime(paste(data[,1],data[,2]),'%d/%m/%Y %H:%M:%S')

par(ps=12)


# Plot 2 

png('plot2.png', width = 480, height = 480,bg = "transparent")

with(data,plot(as_date, as.numeric(Global_active_power), type="n",xlab = NA, ylab = "Global Active Power (kilowatts)"))
with(data,lines(as_date,as.numeric(Global_active_power)))#dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()