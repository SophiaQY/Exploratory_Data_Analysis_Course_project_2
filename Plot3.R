## read dataset into R

source("readdata.R")

## subset data in baltimore city

baltimore <- subset(NEI, fips == "24510")

##calculate the total PM2.5 emission in the Baltimore City, Maryland
##for each of the years 1999, 2002, 2005, and 2008 by type of source

library(dplyr)
baltimoreyeartype <- summarize(group_by(baltimore, year,type), Emissions=sum(Emissions))

## make the plot showing the total PM2.5 emission in the Baltimore vs year by type
library(ggplot2)
png("plot3.png",width=960,height=480)

plot3 <- ggplot(baltimore, aes(x = factor(year), y = Emissions, fill=type))+
        geom_bar(stat = "identity")+
        facet_grid(.~ type)+
        xlab("year")+
        ylab(expression("Total "*PM[2.5]*" Emissions (tons)"))+
        ggtitle(expression("Total "*PM[2.5]*" Emissions in Baltimore by Source Type"))

print(plot3)
dev.off()


