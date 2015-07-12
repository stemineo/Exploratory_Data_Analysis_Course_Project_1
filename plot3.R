## Read the full dataset
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Convert the Date and Time variables to Date/Time classes
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Use only data from the dates 2007-02-01 and 2007-02-02
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Make Plot 3
png("plot3.png", width=480, height=480)
plot(data$Datetime, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data$Datetime, data$Sub_metering_2,col='red')
lines(data$Datetime, data$Sub_metering_3,col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()