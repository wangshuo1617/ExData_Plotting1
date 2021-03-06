data1<- read.table(file = "household_power_consumption.txt",header = TRUE,sep = ";",quote = "",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data1$Time<- as.POSIXct(paste(data1$Date,data1$Time),format="%d/%m/%Y %H:%M:%S")
data1<-data1[,-1]
data1<- subset(x = data1,subset = (data1$Time>=as.POSIXct("2007-02-01") & data1$Time<as.POSIXct("2007-02-03")))
with(data1,plot(Time,Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab = ""))
with(data1,points(Time,Sub_metering_1,type = "l",col="black"))
with(data1,points(Time,Sub_metering_2,type = "l",col="red"))
with(data1,points(Time,Sub_metering_3,type = "l",col="blue"))
legend("topright",lty=1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 1)
dev.copy(png,file="plot3.png",height=720,width=720)
dev.off()