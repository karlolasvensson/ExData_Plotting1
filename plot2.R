#read the complete data set into variable data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors=FALSE, sep = ";", na.strings = "?")

#create subset data using data from the dates 2007-02-01 and 2007-02-02.
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data_subset$datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data_subset$globalActivePower <- as.numeric(data_subset$Global_active_power)

#create a plot
plot(data_subset$datetime, data_subset$Global_active_power, type = "l", 
     ylab="Global Active Power (kilowatts)", xlab = "", col="Black")

#copying the plot to the file plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()