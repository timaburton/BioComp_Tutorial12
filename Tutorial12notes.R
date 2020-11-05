##Tutorial 12 walkthrough

library(ggplot2)
setwd("/Users/benjaminwalter/Desktop/Storage/Biocomputing/BioComp_Tutorial12")

iris <- read.csv("iris.csv", header=TRUE, stringsAsFactors = FALSE)
iris

##challenge 1
#use a for loop to generate violin plots for each measurement in the data set,
#using species name as categories

for(i in 1:4){
 plot= ggplot(data=iris, aes(x=Species, y=iris[,i]))+
  geom_violin(color="black", fill="blue")+
  xlab("Species")+
  ylab(colnames(iris)[i])
  theme_bw()
  print(plot)
}
    
