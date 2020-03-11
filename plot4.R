#loading data into R.

fileUrl <- "./household_power_consumption.txt"
data <- read.table(fileUrl,header = TRUE,stringsAsFactors = FALSE,sep = ";")

#filtering the rows to be used
library(dplyr)
myData <- data %>%
  filter(Date %in% c("1/2/2007","2/2/2007"))

myData$Date <- as.Date(myData$Date,format = "%d/%m/%Y")
datetime <- paste(as.Date(myData$Date),myData$Time)
myData$datetime <- as.POSIXct(datetime)

##plotting
par(mfcol = c(2,2),mar = c(4,4,2,1),oma = c(0,0,2,0))
#plot1

with(myData,plot(Global_active_power~datetime,type = "l",ylab = "Global Active Power",xlab = ""))

#plot2
with(myData,{
  plot(Sub_metering_1~datetime,type = "l",ylab = "Energy sub metering",xlab = "")
  lines(Sub_metering_2~datetime,col="red")
  lines(Sub_metering_3~datetime,col = "blue")
})

legend("topright",col = c("black","red","blue"),lty = 1,lwd = 2,bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot3
with(myData,
     plot(Voltage~datetime,type = "l"))

#plot4
with(myData,
     plot(Global_reactive_power~datetime,type ="l"))


##constructing plot4.png
png(file ="plot4.png",width = 480,height = 480)
par(mfcol = c(2,2),mar = c(4,4,2,1),oma = c(0,0,2,0))
#plot1

with(myData,plot(Global_active_power~datetime,type = "l",ylab = "Global Active Power",xlab = ""))

#plot2
with(myData,{
  plot(Sub_metering_1~datetime,type = "l",ylab = "Energy sub metering",xlab = "")
  lines(Sub_metering_2~datetime,col="red")
  lines(Sub_metering_3~datetime,col = "blue")
})

legend("topright",col = c("black","red","blue"),lty = 1,lwd = 2,bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot3
with(myData,
     plot(Voltage~datetime,type = "l"))

#plot4
with(myData,
     plot(Global_reactive_power~datetime,type ="l"))

dev.off()