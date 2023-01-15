# EX 10.3.1
# Read data from the URL link
library(data.table)
mydat <- fread('http://math.emory.edu/~lchen41/teaching/2020_Spring/EX_10-3-1.data')
head(mydat)
# Conditions for lower bounds
lb=c(0,0.40,0.60)
# Conditions for upper bounds
up=c(0.40,0.60,1.00)
# Store the results in d
oi <- seq(1:length(lb))
pi <- seq(1:length(lb))
integrand <- function(y) {6*y*(1-y)}
for (i in c(1:length(lb))) {
  oi[i] <- table(mydat>=lb[i] & mydat<up[i])[2]
  pi[i] <- integrate(integrand,  lb[i], up[i])$value[1]
  print(paste("the", i,"th bin has", oi[i], 
      "entries and pi is equal to", pi[i]))
}
pi <- unlist(pi)
n <- sum(oi)
ei <- n*pi
di = (ei-oi)^2/ei
gi =  2*oi*log(oi/ei)
rbind(oi,pi,ei,di,gi)
print(paste("Using Pearson's test, D value is equal to ",round(sum(di),3)))
print(paste("Using the G-test, G value is equal to ", round(sum(gi),3)))

