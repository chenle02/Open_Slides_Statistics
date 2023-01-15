# Case Study 10.3.2
# Read data from the URL link
library(data.table)
mydat <- fread('http://math.emory.edu/~lchen41/teaching/2020_Spring/Case_10-3-2.data')
head(mydat)
pi = mydat[,3]
oi = mydat[,2]
n =sum(oi)
ei = n*pi
di = (ei-oi)^2/ei
gi =  2*oi*log(oi/ei)
print(paste("Using Pearson's test, D value is equal to ", round(sum(di),3)))
print(paste("Using the G-test, G value is equal to ", round(sum(gi),3)))

