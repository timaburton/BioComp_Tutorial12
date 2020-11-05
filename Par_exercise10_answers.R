#Question1
#Load the csv file into a variable called test1
test1->read.csv(file=test.csv, header = TRUE, stringsAsFactors = FALSE)
#Draw the scatetr plot with a trendline
ggplot(data = test1, 
       aes(x = X, y = Y)) +
  geom_point() +
  stat_smooth(method="lm") +
  theme_classic()

#Question2
#Read the dataset.
data<-read.table(file="data.txt", header = TRUE, sep = ",", stringsAsFactors = FALSE)
data
#Draw a barplot of the means of the four populations
ggplot(data, aes(x = region, y = observations)) +
  stat_summary(fun = mean,
               geom = "bar") +
  theme_bw() +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

#scatter plot of all of the observations
ggplot(data, aes(x = region, y = observations)) +
  geom_jitter()+
  theme_bw() +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

#The bar plot is continous while the scatter plot is discrete.