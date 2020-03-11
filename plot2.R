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

##plotting

with(myData,{
  plot(Global_active_power~datetime,type = "l",ylab = "Global Active power (kilowatts)",xlab="")
})


##constructing plot2.png
dev.copy(png,file = "plot2.png",width =480,height =480)
dev.off()