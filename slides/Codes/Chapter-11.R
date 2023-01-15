#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/Homeworks")

# Case Study 11.2.4
log(2)/0.343

# HW 11.3.1
# Input data
x <- seq(1,4,1)
y <- c(12.6, 11.6, 6.8, 9.2)
#fit the linear model ...
Data <- data.frame(x = x,y = y)
linearMod <- lm(y~x, Data)
summary(linearMod)
coef <- summary(linearMod)$coefficient
cat("The t-score is equal to ", round(coef[2,3],3),"\n",
    "and the p-value is", paste(round(coef[2,4],3)),"\n",
    "Hence, we fail to reject H0.")

# HW 11.3.16
x=c(17.1,10.5,13.8,15.7,11.9,10.4,15.0,16.0,17.8,
    15.8,15.1,12.1,18.4,17.1,16.7,16.5,15.1,15.1)
y=c(16.7,10.4,13.5,15.7,11.6,10.2,14.5,15.8,17.6,
    15.2,14.8,11.9,18.3,16.7,16.6,15.9,15.1,14.5)
sum(x)
sum(y)
sum(x*x)
sum(y*y)
sum(y*x)

# HW 11.3.16
# Input data
x=c(17.1,10.5,13.8,15.7,11.9,10.4,15.0,16.0,17.8,
    15.8,15.1,12.1,18.4,17.1,16.7,16.5,15.1,15.1)
y=c(16.7,10.4,13.5,15.7,11.6,10.2,14.5,15.8,17.6,
    15.2,14.8,11.9,18.3,16.7,16.6,15.9,15.1,14.5)
#fit the linear model ...
Data <- data.frame(x = x,y = y)
linearMod <- lm(y~x, Data)
summary(linearMod)
s <- summary(linearMod)$sigma
beta <- linearMod$coefficients
z <- 14.0 
hatY <- beta[1]+beta[2]*z
n <- length(x)
df <- linearMod$df.residual

# Compute 95% C.I. for E(Y|14.0)
alpha <- 0.05
w <- qt(1-alpha/2,df) * s * sqrt(1/n+(z-mean(x))^2/(sum((x-mean(x))^2)))
print(paste("The 95% C.I. for E(Y|14.0) is (", round(hatY-w,3),",",  round(hatY+w,3),")."))

# Compute 95% prediction C.I. for E(Y|14.0)
alpha <- 0.05
w <- qt(1-alpha/2,df) * s * sqrt(1+1/n+(z-mean(x))^2/(sum((x-mean(x))^2)))
print(paste("The 95% prediction C.I. for E(Y|14.0) is (", round(hatY-w,3),",",  round(hatY+w,3),")."))
