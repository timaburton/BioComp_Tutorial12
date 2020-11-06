setwd("~/BioComp_Tutorial12/")

#Jake Fuehrmeyer
#Biocomputing Exercise 10
#Dynamic Modeling

# 1)  Find some data on two variables that you would expect to be related to each other. These data can come
#     from your own research, your daily life, or the internet. Enter those data into a text file or Excel and then
#     save a text file, and write a script that loads this text file and produces a scatter plot of those two variables
#     that includes a trend line.

##make sure ggplot2 is installed
library(ggplot2)

##selected datafiles to read in 
##A data set involving photosynthesis (Anet)
##data set is Anet with constant temp and radiation and O2 partial 
##pressure versus varying CO2 partial pressure
O2data <- read.csv("Anetvso2.csv", header = T, stringsAsFactors = T)

##creating scatterplot for data
ggplot(O2data, aes(x = as.numeric(O2.Partial.Pressure), y = as.numeric(Anet..Photosynthesis.))) +
  geom_point() +
  stat_smooth(method="lm")+
  theme_bw() +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  xlab("CO2 Partial Pressure (mbar") + 
  ylab("Anet")

# 2) Given the data in “data.txt”. Write a script that generates two figures that sumamrize the data. First, show
# a barplot of the means of the four populations. Second, show a scatter plot of all of the observations. You may
# want to “jitter” the points (geom_jitter()) to make it easier to see all of the observations within a population
# in your scatter plot. Alternatively, you could also try setting the alpha argument in geom_scatterplot()
# to 0.1. Do the bar and scatter plots tell you different stories? Why?

#read in data.txt file
data = read.csv("data.txt", header = TRUE)

#create bar graph of the means of the four populations being observed
ggplot(data, aes(x = region, y = observations)) +
  stat_summary(fun = mean, 
               geom = "bar")  +
  theme_bw() +
  xlab("Population") 


#creating a scatterplot of all of the observations
ggplot(data, aes(x = region, y = observations)) +
  geom_jitter()+
  theme_bw() +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) 

#The scatterplot seems to offer a more accurate range of the values as it areas 
#points of greater densities.
#The bar graph allows for us to have a better concept of the measurement of the 
#average observation for each population.

#In conclusion, the scatterplot shows the actual differences within each population.
# It shows the eat having a dense amount of observations between 10 and 20. 
# It shows the north having a very condensed amount of observations at the 12 to 17 range.
# It shows the south having two separate dense areas, one at 5 and the other between
# 22 and 28 (rough estimate).
# It shows the west having a more dispersed amount of observations ranging from 
# 0 all the way through 30.
