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
# part 2 of exercise 10
# compare two kinds of graphs using data.txt

#load the data from data.txt
dat2 <- read.csv("data.txt", header = TRUE, stringsAsFactors = FALSE)

# load ggplot
library(ggplot2)

# plot a bar chart on the average observations for each region
ggplot(dat2, aes(x=region, y=observations))+
  geom_bar(stat = "summary", fun = "mean", fill = "cornflowerblue") +
  coord_cartesian(ylim=c(15,15.3)) +
  ylab("average observations")

# make a scatter plot of the observations in data.txt
ggplot(dat2, aes(x=region, y=observations))+
  geom_jitter(aes(color=as.factor(region)))+
  scale_color_manual(values=c("mediumpurple1", "aquamarine", "slategray1", "lightpink"))+
  labs(color = "Region")

# The bar and scatter plots do tell different stories. 
# The bar plot only shows the averages so there is much less context to the data. 
# The scatter plot shows many attributes about the data like the spread.
# The scatter plot shows outliers and breaks of no data. 
# For example, south has a large range where there are no data points in the middle of its spread
# North and west have very similar averages and yet their ranges are very different. 
              