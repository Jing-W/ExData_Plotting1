data <- read.table("./exploratory_data/household_power_consumption.txt", header = T, sep = ";")
data_0201 <- data[(which(data$Date == "1/2/2007")), ]
data_0202 <- data[(which(data$Date == "2/2/2007")), ]
data_needed <- rbind(data_0201, data_0202)
data_needed$DateTime <- strptime(paste(data_needed$Date, data_needed$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

x <- data_needed$DateTime
y1 <- as.numeric(as.character(data_needed$Sub_metering_1))
y2 <- as.numeric(as.character(data_needed$Sub_metering_2))
y3 <- as.numeric(as.character(data_needed$Sub_metering_3))
v <- as.numeric(as.character(data_needed$Voltage))
ap <- as.numeric(as.character(data_needed$Global_active_power))
rap <- as.numeric(as.character(data_needed$Global_reactive_power))
    
png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
# plot 1
plot(x, ap, type = "l", main = NULL, xlab = "", ylab = "Global Active Power")
# plot 2
plot(x, v, type = "l", main = NULL, xlab = "datetime", ylab = "Voltage")
# plot 3
plot(x, y1, ylim=range(c(y1, y2, y3)), type = "l", xlab = "", ylab = "Energy sub metering", col = "black", main = NULL)
par(new = TRUE)
plot(x, y2, ylim=range(c(y1, y2, y3)), type = "l", axes = FALSE, xlab = "", ylab = "", col = "red", main = NULL)
par(new = TRUE)
plot(x, y3, ylim=range(c(y1, y2, y3)), type = "l", axes = FALSE, xlab = "", ylab = "", col = "blue", main = NULL)
legend("topright", lwd = 1, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot 4
plot(x, rap, type = "l", main = NULL, xlab = "datetime", ylab = "Global_reactive_power")

#dev.copy(png, file = "plot3.png", width = 480, height = 480) 
dev.off()