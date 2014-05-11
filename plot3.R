data <- read.table("./exploratory_data/household_power_consumption.txt", header = T, sep = ";")
data_0201 <- data[(which(data$Date == "1/2/2007")), ]
data_0202 <- data[(which(data$Date == "2/2/2007")), ]
data_needed <- rbind(data_0201, data_0202)
data_needed$DateTime <- strptime(paste(data_needed$Date, data_needed$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

x <- data_needed$DateTime
y1 <- as.numeric(as.character(data_needed$Sub_metering_1))
y2 <- as.numeric(as.character(data_needed$Sub_metering_2))
y3 <- das.numeric(as.character(data_needed$Sub_metering_3))

png(file = "plot3.png", width = 480, height = 480)

plot(x, y1, ylim=range(c(y1, y2, y3)), type = "l", xlab = "", ylab = "Energy sub metering", col = "black", main = NULL)
par(new = TRUE)
plot(x, y2, ylim=range(c(y1, y2, y3)), type = "l", axes = FALSE, xlab = "", ylab = "", col = "red", main = NULL)
par(new = TRUE)
plot(x, y3, ylim=range(c(y1, y2, y3)), type = "l", axes = FALSE, xlab = "", ylab = "", col = "blue", main = NULL)
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#dev.copy(png, file = "plot3.png", width = 480, height = 480) 
dev.off()