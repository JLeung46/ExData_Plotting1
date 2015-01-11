library(sqldf)

file <- read.csv.sql('household_power_consumption.txt',"select*from file where Date in ('1/2/2007','2/2/2007')",sep=';',head=T)

file$DateTime<-as.POSIXct(paste(file$Date,file$Time), format="%d/%m/%Y %H:%M:%S")

plot(file$DateTime,file$Global_active_power,col ="black",type = "l", ylab="Global Active Power (kilowatts)", xlab ="")

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()