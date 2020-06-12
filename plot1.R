dataFile <- "E:/R/datasciencecoursera/exdata_data_household_power_consumption/household_power_consumption.txt"
allData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#getting the subset for 1/2/2007 to 2/2/2007
subSetData <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]

#getting the Global Active Power in numeric form for plotting

globalActivePower <- as.numeric(subSetData$Global_active_power)
png("E:/R/datasciencecoursera/exdata_data_household_power_consumption/plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
