##Exercise 10

#1) find data online and create a scatter plot showing the correlation between two variables

##I found a dataset with a list of categories associated with movies
##I predicted that budget would have a correlation with revenue

setwd("/Users/benjaminwalter/Desktop/Storage/Biocomputing/BioComp_Tutorial12")
movies <- read.csv("Movies.csv",header = TRUE, stringsAsFactors = FALSE)
movies
colnames(movies)

library(ggplot2)
ggplot(data=movies, aes(x=budget, y=revenue))+
  geom_point()+
  ylab("Revenue (Millions of $)") +
  xlab("Budget (Millions of $)") +
  ggtitle("Budget vs. Revenue Scatterplot for Movies")+
  geom_smooth(method=lm)+
  theme_bw()
##this data shows a weak/moderate positive correlation between budget and revenue

#################################

#2) In data.txt create a barplot that shows the means for the four populations
##  Then create a scatterplot of all the observations

setwd("/Users/benjaminwalter/Desktop/Storage/Biocomputing/BioComp_Tutorial12")
data <- read.csv("data.txt",header = TRUE, stringsAsFactors = FALSE)
data
colnames(data)

##barplot of the means for the four populations

north <- mean(data$observations[data$region=="north"])
south <- mean(data$observations[data$region=="south"])
east <- mean(data$observations[data$region=="east"])
west <- mean(data$observations[data$region=="west"])

names <- c("North", "South", "East", "West")
bargraph <- matrix(data=NA, nrow=1, ncol=4)
bargraph[,1]=north
bargraph[,2]=south
bargraph[,3]=east
bargraph[,4]=west
colnames(bargraph) = names

barplot(bargraph, main="Bar Plot of Mean Observations", 
        xlab="Direction", ylab="Mean Observation", ylim=c(0,20))

##scatterplot of all observations
ggplot(data=data, aes(x=region, y=observations))+
  geom_jitter()+
  ylab("Observations") +
  xlab("Region") +
  theme_bw()

##The bar plot and scatter plot show very different stories.
##The bar plot shows that the regions have very similar means regarding observations,
##however, the scatterplot shows if each region has multiple nodes of concentration, and shows
##the different distributions of observations, whether that is more spread out or very clustered.
