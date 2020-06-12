dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
allData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#getting the subset for 1/2/2007 to 2/2/2007
subSetData <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]

#Getting the time frame to plot consumption over perios of time
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#getting the Global Active Power in numeric form for plotting
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("./exdata_data_household_power_consumption/plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
