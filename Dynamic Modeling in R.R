##11/2 Dynamic Modeling in R
##model is a useful abstraction of a complex system
##every state variable needs an equation in a dynamic variable
##changes can be modeled with difference equations or differential equations

##sunfish population model

# population(current year)= population(previous year) + birthrate(population size) - deaths(population size)
  #assumptions include there will not be any added or removed fish (and if so, the should qualify as births or deaths)
  #assume the sexes of the fish will not affect mating
  #assume limitation in resources that limit growth (populatoin has a carrying capacity)
  #future growth will be density dependent

# Set parameter and state variable values
r=0.5
  #when resources are good, each fish will have .5 offspring
K=100
  #carrying capacity
N=1:150
  #vector of possible state variable values

# Plot quantities of interest
plot(N,r*N*(1-N/K),type='l',lwd=2,xlab="N",ylab="N(t+1)-N(t)")
abline(h=0,lty=3)

##can see at low population sizes, change is low, at intermediate, change is high, then at high size, change is negative
#over time, the population will grow to carrying capacity, then get smaller, then rise again, and oscillate between 50-100 individuals
#graph actually looks  like an S curve with a horizontal asymptote at carrying capacity

##coding denisty-dependent population growth
#N(t+1)=N(t)+r*N(t)*(1-N(t)/K)
#parameters: r=.5, k=100
#pick time horizon (how long will we simulate)
#iterative process in a for loop that will update population every time
#code the equation
#eventually plot the results, so need to store results somewhere

#parameters
r=0.5
K=100
#set timestep
times <- 1:50
#place to store output (in a two dimensional matrix)
output <- matrix(data=NA, nrow=length(times), ncol=2)
output[,1]=times

##create an initial value for population size
output[1,2]=2

for(i in times[-1]){
  output[i,2]=output[(i-1),2]+r*output[(i-1),2]*(1-output[(i-1),2]/K)
}

outputDF <- data.frame(time=output[,1],pop=output[,2])
library(ggplot2)
ggplot(data=outputDF, aes(x=time, y=pop))+
       geom_line()+
      theme_bw()

#################
#challenge 1
#generate code that shows the effect of r and K on population dynamics

K <- c(50,100,150)
r <- c(0.3, 0.5, 0.7)
store_results <- matrix(data=NA, nrow=length(times), ncol=length(K))
store_results[,1]=times

for(i in 1:3){
  K=K[i]
  r=r[i]
  output <- matrix(data=NA, nrow=length(times), ncol=2)
  output[,1]=times
  output[1,2]=2
  for(i in times[-1]){
    output[i,2]=output[(i-1),2]+r*output[(i-1),2]*(1-output[(i-1),2]/K)
  }
  outputDF <- data.frame(time=output[,1],pop=output[,2])
  store_results[,i+1] <- outputDF
}
library(ggplot2)
ggplot(data=outputDF, aes(x=time, y=pop))+
  geom_line()+
  theme_bw()       

##not good
