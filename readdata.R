#download file and unzip file

url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = "data_for_peer_assignment.zip", method = "curl")
unzip("data_for_peer_assignment.zip")

# read data into R

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
