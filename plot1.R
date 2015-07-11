data1<- read.table(file = "household_power_consumption.txt",header = TRUE,sep = ";",quote = "",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data1$Time<- as.POSIXct(paste(data1$Date,data1$Time),format="%d/%m/%Y %H:%M:%S")
data1<-data1[,-1]
data1<- subset(x = data1,subset = (data1$Time>=as.POSIXct("2007-02-01") & data1$Time<as.POSIXct("2007-02-03")))
with(data1,hist(Global_active_power,xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power"))
dev.copy(png,file="plot1.png",height=720,width=720)
dev.off()