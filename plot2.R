data <- read.table("./exploratory_data/household_power_consumption.txt", header = T, sep = ";")
data_0201 <- data[(which(data$Date == "1/2/2007")), ]
data_0202 <- data[(which(data$Date == "2/2/2007")), ]
data_needed <- rbind(data_0201, data_0202)
data_needed$DateTime <- strptime(paste(data_needed$Date, data_needed$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
png(file = "plot2.png", width = 480, height = 480) 
with(data_needed, plot(DateTime, as.numeric(as.character(Global_active_power)), type = "l", main = NULL, xlab = "", ylab = "Global Active Power (kilowatts)"))
# dev.copy(png, file = "plot2.png", width = 480, height = 480) 
dev.off()