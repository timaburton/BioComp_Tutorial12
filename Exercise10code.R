data<-read.table("data.txt", header=TRUE, sep = ",", stringsAsFactors = FALSE)
library(ggplot2)
#Question 1
#datasource: https://www.sheffield.ac.uk/mash/statistics/datasets Birthweight Dataset
birthweight<-read.table("Question1data.txt", header=TRUE, sep = "\t", stringsAsFactors = FALSE)
ggplot(data=birthweight, aes(x=mnocig, y=Birthweight))+
  geom_point()+
  xlab("Number Cigarettes Smoked by Mother")+
  ylab("Birthweight of Baby (lb.)")+
  stat_smooth(method="lm")+
  theme_classic()

##Question 2
ggplot(data=data, aes(x= region, y=observations))+
  stat_summary(fun.y=mean,
               geom="bar")+
  stat_summary(fun.data = mean_se,
               geom = "errorbar", 
               width=.3) +
  theme_bw()

ggplot(data = data, aes(x=region, y=observations))+
  geom_point()+
  geom_jitter()+
  theme_classic()

#Tell different stories because it is easier to see the range/skew
#of the data in the scatterplot. It is easier to see where data clusters 
#around the mean in the scatterplot. The bar plot simply shows that the 
#means for each population are similar; the error bars do not give a
#good sense of how the data looks
