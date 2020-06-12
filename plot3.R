dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
allData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#getting the subset for 1/2/2007 to 2/2/2007
subSetData <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]

#Getting the time frame to plot consumption over perios of time
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#getting the Global Active Power in numeric form for plotting
globalActivePower <- as.numeric(subSetData$Global_active_power)

#Converting sub metering readings to numeric form for plotting
subMeter1 <- as.numeric(subSetData$Sub_metering_1)
subMeter2 <- as.numeric(subSetData$Sub_metering_2)
subMeter3 <- as.numeric(subSetData$Sub_metering_3)

png("./exdata_data_household_power_consumption/plot3.png", width=480, height=480)
plot(dateTime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMeter2, type="l", col="red")
lines(dateTime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
