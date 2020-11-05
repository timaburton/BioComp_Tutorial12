setwd("C:/Users/matth/Desktop/Intro_to_Biocomputing/BioComp_Tutorial12") #set wd

##QUESTION1
daphnia <- read.table(file="DaphniaData.txt", header=TRUE,sep="",
                      stringsAsFactors = FALSE) #import data
library(ggplot2)#load package
ggplot(data=daphnia, aes(x=WidthMat,y=LengthMat))+
  geom_point()+
  stat_smooth(method="lm")+
  theme_classic() #make graph

##QUESTION2
data <- read.table(file="data.txt", header=TRUE, stringsAsFactors = FALSE, sep=",")
ggplot(data=data, aes(x=region,y=observations))+
  stat_summary(fun.y=mean,geom="bar", fill="lemonchiffon4")+
  theme_classic() #graph1
ggplot(data=data, aes(x=region, y=observations), show.legend=FALSE)+
  geom_jitter(aes(color=region), show.legend = FALSE)+
  theme_classic()

#These plots show the data quite differently. In the bar plot,
#the regions appear to have similar mean observations. 
#Once we can see the individual points, however, 
#we learn that is not the case. For example, 
#South is bidmodal and north is tightly clustered around 15,
#while east is somewhat evenly distributed between 5 and 25
#and west is very evenly distributed between 0 and 30. 
#Seeing each individual datum helps visualize the data more accurately.