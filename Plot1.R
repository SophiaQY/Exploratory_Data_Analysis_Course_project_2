## read dataset into R

source("readdata.R")

##calculate the total PM2.5 emission from all sources 
##for each of the years 1999, 2002, 2005, and 2008.

totalem <- tapply(NEI$Emissions, NEI$year, sum)

##make the plot

png("plot1.png",width=480,height=480)
barplot(totalem/10^6, 
        ylim = c(0,8),
        xlab = "year", 
        ylab = expression("Total "*PM[2.5]*" Emissions (10^6 Tons)"), 
        main = expression("Total "*PM[2.5]*" Emissions from All US Source" ),
        col = names(totalem))

dev.off()
