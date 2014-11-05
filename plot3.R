data <- read.csv('household_power_consumption.txt', sep = ";", stringsAsFactors = FALSE )
as_date <- as.Date(data[,1],'%d/%m/%Y')
start <- as.Date('01/02/2007','%d/%m/%Y')
end <- as.Date('02/02/2007','%d/%m/%Y')
filter <- as_date >= start & as_date <= end & data$Global_active_power != '?'
data <- data[filter,]
as_date <- strptime(paste(data[,1],data[,2]),'%d/%m/%Y %H:%M:%S')

par(ps=12)

# Plot 3 

png('plot3.png', width = 480, height = 480,bg = "transparent")

with(data,plot(as_date, as.numeric(Sub_metering_1), type="n",xlab = NA, ylab = "Energy sub metering"))
with(data,lines(as_date,as.numeric(Sub_metering_1)))
with(data,lines(as_date,as.numeric(Sub_metering_2), col = "red"))
with(data,lines(as_date,as.numeric(Sub_metering_3), col = "blue"))
legend("topright", c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty = c(1, 1, 1), col = c('black','red','blue'))
dev.off()
