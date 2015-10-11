# Reading dataset
data_all <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259)
#converting Date to date class
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")
dim(data_all) #2075259       9

# Subsetting the data
data <- subset(data_all, Date=="2007-02-01" | Date=="2007-02-02")
dim(data) #2880    9
rm(data_all)

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$dateTime <- as.POSIXct(datetime)

#save to a png file
png("plot3.png", width=480, height=480)
plot(data$dateTime,data$Sub_metering_1, type="l", lwd=2.5, xlab="", ylab="Energy sub metering")
lines(data$dateTime,data$Sub_metering_2, col = "red")
lines(data$dateTime,data$Sub_metering_3, col = "blue")
legend("topright", lty= 1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col=c("black", "red", "blue"))
dev.off()