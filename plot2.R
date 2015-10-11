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
plot(data$dateTime,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#save to a png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()