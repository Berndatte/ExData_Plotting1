#loading data into R.

fileUrl <- "./household_power_consumption.txt"
data <- read.table(fileUrl,header = TRUE,stringsAsFactors = FALSE,sep = ";")

#filtering the rows to use
library(dplyr)
myData <- data %>%
  filter(Date %in% c("1/2/2007","2/2/2007"))

##plotting
myData$Global_active_power <- as.numeric(myData$Global_active_power)
hist(myData$Global_active_power,xlab = "Global Active Power (kilowatts)",col="red",main = "Global Active Power")

##constructing plot.png
dev.copy(png,file ="plot1.png",width = 480, height = 480)
dev.off()
