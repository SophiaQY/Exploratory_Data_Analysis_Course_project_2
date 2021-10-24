## read dataset into R

source("readdata.R")

## subset data in baltimore city & from Motor Vehicles

baltimore <- subset(NEI, fips == "24510")
baltimoremotor <- subset(baltimore, type=="ON-ROAD")

## make the plot

library(ggplot2)
png("plot5.png",width=480,height=480)
plot5 <- ggplot(baltimoremotor, aes(x = factor(year), y = Emissions, fill=year))+
        geom_bar(stat = "identity")+
        xlab("year")+
        ylab(expression("Total "*PM[2.5]*" Emissions"))+
        ggtitle(expression("Total "*PM[2.5]*" from Motor Vehicles Sources"))

print(plot5)

dev.off()