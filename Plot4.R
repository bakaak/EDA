# Obtaining Full Dataset
fulldataset <- read.csv("./EDA/household_power_consumption.txt", 
                        header=T, 
                        sep=';', 
                        na.strings="?", 
                        nrows=2075259, 
                        check.names=F, 
                        stringsAsFactors=F, 
                        comment.char="", 
                        quote='\"')
fulldataset$Date <- as.Date(fulldataset$Date, format="%d/%m/%Y")

# Creating Subset
data <- subset(fulldataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fulldataset)

# Date Conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Initiating Plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Datetime, 
       type="l",
       xlab="",
       ylab="Global Active Power")
  plot(Voltage~Datetime, 
       type="l", 
       xlab="",
       ylab="Voltage")
  plot(Sub_metering_1~Datetime, 
       type="l", 
       xlab="",
       ylab="Global Active Power")
     lines(Sub_metering_2~Datetime,col='Red')
     lines(Sub_metering_3~Datetime,col='Blue')
     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, 
       type="l", 
       xlab="",
       ylab="Global Rective Power")
})

# Saving Plot to File
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()