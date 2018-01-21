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
new_date <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))

## date conversion
new_date$Date <- as.Date(new_date$Date, format="%d/%m/%Y")

## set date time conversion 
datetime <- paste(as.Date(new_date$Date), new_date$Time)
new_date$Datetime <- as.POSIXct(datetime)

## Creating Png file 
png("plot2.png", width = 480, height = 480)

## plot 2 code
with (new_date, plot (Global_active_power~Datetime, 
                      type = "l", 
                      ylab="Global Active Power (kilowatts)", 
                      xlab=""))

## closing png file 
dev.off()
