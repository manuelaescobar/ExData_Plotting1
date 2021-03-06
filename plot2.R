#Drawing plot 2
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")
subsetpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
subsetpower$Date <- as.Date(subsetpower$Date, format="%d/%m/%Y")
subsetpower$Time <- strptime(subsetpower$Time, format="%H:%M:%S")
subsetpower[1:1440,"Time"] <- format(subsetpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetpower[1441:2880,"Time"] <- format(subsetpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(subsetpower$Time,as.numeric(as.character(subsetpower$GlobalActivePower)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")
dev.off()