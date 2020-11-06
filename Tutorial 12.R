#Challenge 1

#load file
setwd("/Users/savannahmiracle/Desktop/BioComp_Tutorial12")
sleepdata = read.csv("HoursRest.txt", header = FALSE)
#plot points and trend line
plot(sleepdata[,1],sleepdata[,2],type="p", main="Hours Slept vs. Rested Feeling", xlab="Hours Slept", ylab="Feeling of Restfulness")
abline(lm(sleepdata[,2]~sleepdata[,1]))


#Challenge 2

#load file and ggplot2
setwd("/Users/savannahmiracle/Desktop/BioComp_Tutorial12")
data = read.csv("data.txt", header = TRUE)
library(ggplot2)

#get means and store
north <- data[data$region == "north",]
south <- data[data$region == "south",]
east <- data[data$region == "east",]
west <- data[data$region == "west",]
nmean <- mean(north[,2])
smean <- mean(south[,2])
emean <- mean(east[,2])
wmean <- mean(west[,2])

#making barplot
Region = c("North", "South", "East", "West")
MeanObservations = value = c(nmean, smean, emean, wmean)
dataForBar <- data.frame(Region, MeanObservations)
ggplot(dataForBar, aes(x = Region, y = MeanObservations)) + geom_bar(stat = "identity")

#making scatterplot
Area = data[,1]
Observations = data[,2]
ggplot(data, aes(x=Area, y=Observations)) + geom_point(position = "jitter")

#The barplot and scatterplot tell you different things about the data. 
#According to the barplot, it seems that the observations for all 4 regions
#seem to be about the same. Looking at the scatterplot, it becomes clear that
#the range and distribution of the observations varies substantially between 
#the regions.