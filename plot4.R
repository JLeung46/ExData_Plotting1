library(sqldf)

file <- read.csv.sql('household_power_consumption.txt',"select*from file where Date in ('1/2/2007','2/2/2007')",sep=';',head=T)

file$DateTime<-as.POSIXct(paste(file$Date,file$Time), format="%d/%m/%Y %H:%M:%S")

png(file = "plot4.png",width=480,height=480,pointsize=12)

par(mfrow = c(2,2))

plot(file$DateTime,file$Global_active_power,col ="black",type = "l", ylab="Global Active Power", xlab ="")

plot(file$DateTime,file$Voltage,type="l",xlab="datetime",ylab="Voltage")

with(file,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))

with(file,lines(DateTime,Sub_metering_2,col="red"))

with(file,lines(DateTime,Sub_metering_3,col="blue"))

legend("topright",lty=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red","blue"))

plot(file$DateTime,file$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()