#read the complete data set into variable data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors=FALSE, sep = ";", na.strings = "?")

#create subset data using data from the dates 2007-02-01 and 2007-02-02.
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#create a histogram
hist(data_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#copying the plot to the file plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()