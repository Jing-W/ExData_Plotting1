data <- read.table("./exploratory_data/household_power_consumption.txt", header = T, sep = ";")
data_0201 <- data[(which(data$Date == "1/2/2007")), ]
data_0202 <- data[(which(data$Date == "2/2/2007")), ]
data_needed <- rbind(data_0201, data_0202)
hist(as.numeric(as.character(data_needed$Global_active_power)), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480) 
dev.off()