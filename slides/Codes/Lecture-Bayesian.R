#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")



# Plot Beta distributions
x = seq(0,1,0.01)
a = 13
b = 2
plot(x,dbeta(x,a,b),
     type="l",
     col="red")


# Plot gamma distributions
x = seq(0,20,0.01)
k= 3 # Shape parameter
theta = 0.5 # Scale parameter
plot(x,dgamma(x, k, scale = theta),
     type="l",
     col="red")
