
png(filename="ExData_Plotting1/figure/plot3.png",height=480,width=480)
 lines = grep("^0?[12]/0?2/2007",
               readLines("household_power_consumption.txt"),
               value=TRUE)
 power = read.table(text=lines,
     col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
     sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
 str(power)
 power$DateTime = strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
 str(power)                   
 summary(power)
 power$dow = factor(weekdays(power$DateTime), ordered=TRUE, levels=c("lunes","martes","miércoles","jueves","viernes","sábado","domingo"))
 str(power)                   
 summary(power)
plot(x=power$DateTime,y=power$Sub_metering_1,type="l",ylab="Energy sub metering")
lines(x=power$DateTime,y=power$Sub_metering_2,type="l",col="red")
lines(x=power$DateTime,y=power$Sub_metering_3,type="l",col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black","red","blue"))
dev.off()
