#loading data into R.

fileUrl <- "./household_power_consumption.txt"
data <- read.table(fileUrl,header = TRUE,stringsAsFactors = FALSE,sep = ";")

#filtering the rows to use
library(dplyr)
myData <- data %>%
  filter(Date %in% c("1/2/2007","2/2/2007"))

myData$Date <- as.Date(myData$Date,format = "%d/%m/%Y")
datetime <- paste(as.Date(myData$Date),myData$Time)
myData$datetime <- as.POSIXct(datetime)

#plotting
with(myData,{
  plot(Sub_metering_1~datetime,type = "l",ylab = "Energy sub metering",xlab = "")
  lines(Sub_metering_2~datetime,col="red")
  lines(Sub_metering_3~datetime,col = "blue")
})

legend("topright",col = c("black","red","blue"),lty = 1,lwd = 2,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


##constructing the plot3.png

png(file ="plot3.png",width = 480, height = 480)
with(myData,{
  plot(Sub_metering_1~datetime,type = "l",ylab = "Energy sub metering",xlab = "")
  lines(Sub_metering_2~datetime,col="red")
  lines(Sub_metering_3~datetime,col = "blue")
})

legend("topright",col = c("black","red","blue"),lty = 1,lwd = 2,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()