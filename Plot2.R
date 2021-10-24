## read dataset into R

source("readdata.R")

##calculate the total PM2.5 emission in the Baltimore City, Maryland
##for each of the years 1999, 2002, 2005, and 2008.

baltimore <- subset(NEI, fips == "24510")

baltimoretotal <- tapply(baltimore$Emissions, baltimore$year, sum)

#### make the plot
png("plot2.png",width=480,height=480)
barplot(baltimoretotal, 
        ylim = c(0,4000),
        xlab = "year", 
        ylab = expression("Total "*PM[2.5]*" Emissions (tons)"), 
        main = expression("Total "*PM[2.5]*" Emissions in Baltimore City" ),
        col = names(baltimoretotal))

dev.off()