#read the complete data set into variable data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors=FALSE, sep = ";", na.strings = "?")

#create subset data using data from the dates 2007-02-01 and 2007-02-02.
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data_subset$datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data_subset$Sub_metering_1 <- as.numeric(as.character(data_subset$Sub_metering_1))
data_subset$Sub_metering_2 <- as.numeric(as.character(data_subset$Sub_metering_2))
data_subset$Sub_metering_3 <- as.numeric(as.character(data_subset$Sub_metering_3))

#create a plot
plot(data_subset$datetime, data_subset$Sub_metering_1, type = "l", 
     ylab="Energy sub metering", xlab = "", col="Black")
lines(data_subset$datetime, data_subset$Sub_metering_2, type = "l", col = "Red")
lines(data_subset$datetime, data_subset$Sub_metering_3, type = "l", col = "Blue")
legend("topright", c("Sub_metering_1    ","Sub_metering_2    ","Sub_metering_3    "), 
       lty = c("solid","solid","solid"), lwd = 1, col = c("Black","Red","Blue"), 
       cex = 0.5)

#copying the plot to the file plot3.png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()