#Obtaining Full Dataset
fulldataset <- read.csv("./EDA/household_power_consumption.txt", 
                        header=T, 
                        sep=';', 
                        na.strings="?", 
                        nrows=2075259, 
                        check.names=F, 
                        stringsAsFactors=F, 
                        comment.char="", quote='\"')
fulldataset$Date <- as.Date(fulldataset$Date, format="%d/%m/%Y")

# Creating Subset
data <- subset(fulldataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fulldataset)

# Date Conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Initiating Plot
hist(data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# Saving Plot to File
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()