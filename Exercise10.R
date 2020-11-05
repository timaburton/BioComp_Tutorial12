# load data file
dat <- read.csv("Angles.csv", header = TRUE, stringsAsFactors = FALSE)

# load ggplot
library(ggplot2)

# create scatterplot and trend line
ggplot(dat, aes(x=Incident.Angle, y=Refracted.Angle)) +
  geom_point(color="blue") +
  stat_smooth(method = "lm") +
  theme_classic()
