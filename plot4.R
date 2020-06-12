dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
allData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#getting the subset for 1/2/2007 to 2/2/2007
subSetData <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]

#Getting the time frame to plot consumption over perios of time
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#getting the Global Active and Reactive Power in numeric form for plotting
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)

#Converting sub metering readings to numeric form for plotting
subMeter1 <- as.numeric(subSetData$Sub_metering_1)
subMeter2 <- as.numeric(subSetData$Sub_metering_2)
subMeter3 <- as.numeric(subSetData$Sub_metering_3)

#Converting voltage readings to numeric form for plotting
voltage <- as.numeric(subSetData$Voltage)

#plotting the 4 graphs in the 4(2 by 2) quadrants
png("./exdata_data_household_power_consumption/plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateTime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMeter2, type="l", col="red")
lines(dateTime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
