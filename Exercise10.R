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

