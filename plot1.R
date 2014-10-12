data <- read.csv2("household_power_consumption.txt")
data[,1] <- as.Date(data[,1],"%d/%m/%Y")
start <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
data_sub <- subset(data, Date >= start & Date <= end)

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(data_sub$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()