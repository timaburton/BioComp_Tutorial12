# part 1 of Exercise 10
# create a scatter plot w a line of best fit for data on incident angle versus refracted angle

# load data file
dat <- read.csv("Angles.csv", header = TRUE, stringsAsFactors = FALSE)

# load ggplot
library(ggplot2)

# create scatter plot and trend line
ggplot(dat, aes(x=Incident.Angle, y=Refracted.Angle)) +
  geom_point(color="blue") +
  stat_smooth(method = "lm") +
  theme_classic()

#------------------------------------------------------------------
#load the data from data.txt
dat2 <- read.csv("data.txt", header = TRUE, stringsAsFactors = FALSE)

# plot a bar chart on the average observations for each region
ggplot(dat2, aes(x=region, y=observations))+
  geom_bar(stat = "summary", fun = "mean") +
  coord_cartesian(ylim=c(15,15.3)) +
  ylab("average observations")

# make a scatter plot of the observations in data.txt
