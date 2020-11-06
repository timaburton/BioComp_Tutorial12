# Code for exercise 10
# Problem 1

# Data description: Housing values in suburbs of Boston, by town
# Source: https://www.kaggle.com/arslanali4343/real-estate-dataset
# Hypothesis: Average number of rooms is related to median value of a home in a town
# Requires ggplot package to be installed in R
# If not installed, uncomment the following:
# install.packages("ggplot2")

# load data
setwd("/Users/platinaz/Desktop/BioComp_Tutorial12")
house <- read.table("real_estate.txt", header = TRUE, stringsAsFactors = FALSE)

# load ggplot library
library(ggplot2)

# Draw graph and add trendline
ggplot(data=house, aes(x=RM, y=MEDV))+
  geom_point()+
  ylab("Median Value of Owner-Occupied Home (thousand dollars)")+
  xlab("Average Number of Rooms Per Dwelling")+
  ggtitle("Number of Rooms vs. Housing Value")+
  geom_smooth(method=lm)
  theme_bw()

# There is a strong positive linear relationship between number of rooms and housing value
  
# ---------------------------------------
# Problem 2
# load data
dat <- read.csv("data.txt", header = TRUE, stringsAsFactors = FALSE)
dat

# Graph barplot for the means for the four populations
ggplot(dat, aes(x=region, y=observations))+
  geom_bar(stat='summary', fun='mean', fill='light blue')+
  coord_cartesian(ylim = c(0,20))+
  theme_bw()
ggplot(dat, aes(x=region, y=observations))+
  geom_jitter(aes(color=region), show.legend = FALSE)
  theme_bw()

# The two plots show data in very different ways.
# In the first plot, you only see the mean value for each population but how they are distrbuted is unknown
# In the second plot, you can see how each data point is placed and how the population is distributed (whether it is diverse, close to each other, bimodal, etc.)