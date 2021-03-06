## file loaded into R
hpc <- read.table("household_power_consumption.txt", 
                  header = TRUE, 
                  sep = ";", 
                  na.strings = "?", 
                  nrows=2075259, 
                  check.names=F, 
                  stringsAsFactors=F, 
                  comment.char="", 
                  quote='\"')

##subsetting of Dates
new_date <- subset (hpc, Date %in% c("1/2/2007","2/2/2007"))

## date conversion
new_date$Date <- as.Date (new_date$Date, format="%d/%m/%Y")

## set date time conversion 
datetime <- paste(as.Date(new_date$Date), new_date$Time)
new_date$Datetime <- as.POSIXct(datetime)

## Creating Png file 
png ("plot4.png", width = 480, height = 480)

## plot 4 code
with(new_date, {
  plot(Global_active_power~Datetime, type = "l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type = "l", ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, 
       type = "l",
       ylab = "Energy sub metering", 
       xlab = "")
  lines(Sub_metering_2~Datetime, col = 'Red')
  lines(Sub_metering_3~Datetime, col = 'Blue') 
legend("topright", 
       col = c("black", "red", "blue"), 
       lty = 1, 
       lwd=2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 plot(Global_reactive_power~Datetime, type = "l", ylab="Global_reactive_power", xlab="datetime")
})

## closing png file 
dev.off()