library(dplyr)
library(lubridate)

#Loading the data into R (it is assumed the user already has the txt downloaded, unzipped and in his working directory. Otherwise, the following code must be executed:
##download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", destfile = "household_power_consumption.zip"))
##unzip("household_power_consumption.zip")
#)
data<-read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")
data$Date<-as.Date(data$Date,format='%d/%m/%Y')

#Extracting the desired days to make the analysis
dataf<-filter(data, Date == "2007-02-01" | Date == "2007-02-02")

#Converting the time into a nicer format
dataf$DateTime <- as.POSIXct(ymd_hms(paste(dataf$Date, dataf$Time)))

#Making the plot
png("plot3.png", width = 480, height = 480)
plot(dataf$DateTime, dataf$Sub_metering_1, type = "l", ylab ="Energy sub metering", xlab = "")
lines(dataf$DateTime, dataf$Sub_metering_2, type = "l", col ="red")
lines(dataf$DateTime, dataf$Sub_metering_3, type = "l", col ="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()