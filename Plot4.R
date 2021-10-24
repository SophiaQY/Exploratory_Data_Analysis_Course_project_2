## read dataset into R

source("readdata.R")

## select data from coal combustion-related sources

coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
coalcomb <- SCC[coal,]
SCC1<- coalcomb$SCC
coalNEI <- NEI[NEI$SCC %in% SCC1,]
coalcombyear <- summarise(group_by(coalNEI, year), Emissions = sum(Emissions))
coalcombyear$year<- as.factor(coalcombyear$year)

## make the plot
library(ggplot2)
png("plot4.png",width=480,height=480)
plot4 <- ggplot(coalcombyear, aes(x = year, y = Emissions/10^5, fill=year))+
        geom_bar(stat = "identity")+
        xlab("year")+
        ylab(expression("Total "*PM[2.5]*" Emissions (10^5 tons)"))+
        ggtitle(expression("Total "*PM[2.5]*" from Coal Combustion-Related Sources"))

print(plot4)

dev.off()