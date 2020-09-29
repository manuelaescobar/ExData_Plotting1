#Drawing plot 1
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")
subsetpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(subsetpower$GlobalActivePower)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")
dev.off()


