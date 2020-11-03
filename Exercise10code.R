data<-read.table("data.txt", header=TRUE, sep = ",", stringsAsFactors = FALSE)
library(ggplot2)
#Question 1


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

