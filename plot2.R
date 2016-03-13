#Set your working directory
setwd("./R/Exploratory Data Analysis/ExData_Plotting1")

#Load the data into R
HHPwrC <- read.table("data/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

#Consider the data only for 1st and 2nd February,2007
HHPwrC_2days <- subset(HHPwrC,Date == "1/2/2007" | Date == "2/2/2007",select = Date:Sub_metering_3)

#Convert Date & Time variables To Date/Time classes
DateTime <- strptime(paste(HHPwrC_2days$Date,HHPwrC_2days$Time),format = "%d/%m/%Y %H:%M:%S")

#Creating the 2nd plot
with(HHPwrC_2days,plot(DateTime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))

#Copying plot in a png file
dev.copy(png,"plot2.png",height = 480,width = 480)
dev.off()