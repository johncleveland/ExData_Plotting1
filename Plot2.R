## Raw Data
rawdata <- read.csv("C:/Users/T/Documents/GitHub/ExData_Plotting1/CourseProject_1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")

## Subsetting the Raw data for two day data 
data <- subset(rawdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(rawdata)

## Date Conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
