library(dplyr)

#Loading the data into R (it is assumed the user already has the txt downloaded, unzipped and in his working directory. Otherwise, the following code must be executed:
##download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", destfile = "household_power_consumption.zip"))
##unzip("household_power_consumption.zip")
#)
data<-read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")
data$Date<-as.Date(data$Date,format='%d/%m/%Y')

#Extracting the desired days to make the analysis
dataf<-filter(data, Date == "2007-02-01" | Date == "2007-02-02")

#Making the plot
png("plot1.png", width = 480, height = 480)
hist(dataf$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()