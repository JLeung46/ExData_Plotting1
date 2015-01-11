library(sqldf)

file <- read.csv.sql('household_power_consumption.txt',"select*from file where Date in ('1/2/2007','2/2/2007')",sep=';',head=T)

hist(file$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()