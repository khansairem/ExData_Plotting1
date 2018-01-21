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
new_date$Date <- as.Date(new_date$Date, format="%d/%m/%Y")

## Creating Png file 
png ("plot1.png", width = 480, height = 480)

## Plot 1: Histogram
hist (new_date$Global_active_power, 
      col = "Red", 
      main = "Global Active Power", 
      xlab = "Global Active Power(kilowatts)", 
      ylab = "Frequency")

## closing png file 
dev.off()