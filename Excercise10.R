#Excercise10
#Anoop Sunkara
#part1
#historical temperature data accessed, 
#analyzing only last five points in data set to create linear trendline

#set working directory to directory with the GlobalTemperatures.csv file
setwd("/Users/anoopsunkara/Downloads/Biocomputing/BioComp_Tutorial12")

#access GlobalTemperatures.csv file with read.csv
temperaturedata = read.csv("GlobalTemperatures.csv", header = TRUE)

#accessed last 5 lines of temperature readings from this file
temperature = temperaturedata[3188:3192, 1:2]
#must read into ggplot library before creating ggplot file
library(ggplot2)

#for loop to change first column to simple column numbers in order to create linear trendline
for(i in 1:dim(temperature)[1]){
  temperature[i,1] = i
  
}
#create ggplot graph
#create linear trend line for the plotted points
#change axis names 
ggplot(temperature, aes(x = as.numeric(dt), y = LandAverageTemperature)) +
  geom_point() +
  stat_smooth(method="lm")+
  theme_bw() +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
xlab("month") + 
  ylab("average global temperature (celsius)")

#part2
#access data.txt file with read.csv
data = read.csv("data.txt", header = TRUE)


#first ggplot call
#create bar graph of the means of the four populations that are observed
ggplot(data, aes(x = region, y = observations)) +
 stat_summary(fun = mean, 
                geom = "bar")  +
  theme_bw() +
  xlab("Population") 

#second ggplot call
#use geom_jitter to create a clear scatterplot of the observations for each population
ggplot(data, aes(x = region, y = observations)) +
  geom_jitter()+
  theme_bw() +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) 
 
#scatterplot better illustrates the range of values 
#scatterplot also shows density of points
#bargraph provides a more concrete measurement of the average observation for each of the four populations
#altogether, bar graphs make it seem like the populations have similar observation data sets (similar means around 15)
#however, scatterplot provides a more detailed picture that shows the differences within each population
#east population has large range (5-25) with high density of observations in middle around 15
#north has small range with very dense middle around 15
#south has dense region of observations around 5 and slightly less dense region of observations around 25
#west has very large range and scattered points with no clear density (0-30 is the range)
