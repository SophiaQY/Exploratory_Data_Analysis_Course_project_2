## read dataset into R

source("readdata.R")

## subset data in baltimore city & from Motor Vehicles

baltimore <- subset(NEI, fips == "24510")
baltimoremotor <- subset(baltimore, type=="ON-ROAD")

## subset the data from moter vehicle in LA

LA <- subset(NEI, fips=="06037")
LAmotor <- subset(LA, type=="ON-ROAD")

## add column of county to both datasets

baltimoremotor$county <- "Baltimore_City"
LAmotor$county<- "Los_Angeles_County"

## combine baltimore and LA data into one dataset

both<- rbind(baltimoremotor, LAmotor)

## make the plot

library(ggplot2)
png("plot6.png",width=480,height=480)
plot6<- ggplot(both, aes(x = factor(year), y = Emissions, fill=county))+
        geom_bar(stat = "identity")+
        facet_grid(county~., scales="free")+
        xlab("year")+
        ylab(expression("Total "*PM[2.5]*" Emissions (tons)"))+
        ggtitle(expression("Total "*PM[2.5]*" from Motor Vehicles Sources in Baltimore and Los Angeles"))
print(plot6)
dev.off()

