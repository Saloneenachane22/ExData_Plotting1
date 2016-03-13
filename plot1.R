#Set your working directory
setwd("./R/Exploratory Data Analysis/ExData_Plotting1")

#Load the data into R
HHPwrC <- read.table("data/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

#Consider the data only for 1st and 2nd February,2007
HHPwrC_2days <- subset(HHPwrC,Date == "1/2/2007" | Date == "2/2/2007",select = Date:Sub_metering_3)

#Creating the 1st plot
hist(HHPwrC_2days$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

#Copying plot in a png file
dev.copy(png,"plot1.png",height = 480,width = 480)
dev.off()