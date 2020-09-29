power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")
subsetpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#Drawing plot 1
hist(as.numeric(as.character(subsetpower$GlobalActivePower)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")

#Drawing plot 2
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")
subsetpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
subsetpower$Date <- as.Date(subsetpower$Date, format="%d/%m/%Y")
subsetpower$Time <- strptime(subsetpower$Time, format="%H:%M:%S")
subsetpower[1:1440,"Time"] <- format(subsetpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetpower[1441:2880,"Time"] <- format(subsetpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(subsetpower$Time,as.numeric(as.character(subsetpower$GlobalActivePower)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")

#Drawing plot 3
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")
subsetpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
subsetpower$Date <- as.Date(subsetpower$Date, format="%d/%m/%Y")
subsetpower$Time <- strptime(subsetpower$Time, format="%H:%M:%S")
subsetpower[1:1440,"Time"] <- format(subsetpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetpower[1441:2880,"Time"] <- format(subsetpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(subsetpower$Time,subsetpower$SubMetering1,type="n",xlab="",ylab="Energy sub metering")
with(subsetpower,lines(Time,as.numeric(as.character(SubMetering1))))
with(subsetpower,lines(Time,as.numeric(as.character(SubMetering2)),col="red"))
with(subsetpower,lines(Time,as.numeric(as.character(SubMetering3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")

#Drawing plot 4
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")
subsetpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
subsetpower$Date <- as.Date(subsetpower$Date, format="%d/%m/%Y")
subsetpower$Time <- strptime(subsetpower$Time, format="%H:%M:%S")
subsetpower[1:1440,"Time"] <- format(subsetpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetpower[1441:2880,"Time"] <- format(subsetpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
par(mfrow=c(2,2))
with(subsetpower,{
        plot(subsetpower$Time,as.numeric(as.character(subsetpower$GlobalActivePower)),type="l",  xlab="",ylab="Global Active Power")  
        plot(subsetpower$Time,as.numeric(as.character(subsetpower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
        plot(subsetpower$Time,subsetpower$SubMetering1,type="n",xlab="",ylab="Energy sub metering")
        with(subsetpower,lines(Time,as.numeric(as.character(SubMetering1))))
        with(subsetpower,lines(Time,as.numeric(as.character(SubMetering2)),col="red"))
        with(subsetpower,lines(Time,as.numeric(as.character(SubMetering3)),col="blue"))
        legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
        plot(subsetpower$Time,as.numeric(as.character(subsetpower$GlobalReactivePower)),type="l",xlab="datetime",ylab="Global_reactive_power")
})



