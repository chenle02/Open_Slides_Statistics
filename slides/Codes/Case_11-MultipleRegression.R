#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")
# This is an example of multimple regression.
# Dataset is explained here:
# https://dasl.datadescription.com/datafile/broadway-shows/?_sfm_methods=Multiple+Regression&_sfm_cases=4+59943&sort_order=title+asc

# Read data from the URL link
library(data.table)
mydat <- fread('https://dasl.datadescription.com/download/data/3087')
head(mydat)
names(mydat)

# Multiple Linear Regression Example with intercept
fit <- lm(`Gross($M)` ~ Season + Attendance + `Playing weeks` + `New Productions` + `Mean ticket` + `Pct.sold` + LogGross, data=mydat)
summary(fit) # show results


# Multiple Linear Regression Example without intercept
fit2 <- lm(`Gross($M)` ~ Season + Attendance + `Playing weeks` + `New Productions` + `Mean ticket` + `Pct.sold` + LogGross -1, data=mydat)
summary(fit2) # show results

# Compute the generalized inverse (without intercept)
# install.packages("matlib")
library(matlib)
m <-length(mydat)-1
M <- data.matrix(mydat, rownames.force = NA)
n <- nrow(M)
m <- ncol(M)
X <- M[1:n,c(1,3:m)]
Y <- M[1:n,2]
inv((t(X)%*%X)) %*% t(X) %*% Y


# Compute the coefficients using the generalized inverse (without intercept)
library(matlib)
m <-length(mydat)-1
M <- data.matrix(mydat, rownames.force = NA)
n <- nrow(M)
m <- ncol(M)
X <- M[1:n,c(1,3:m)]
Y <- M[1:n,2]
inv((t(X)%*%X)) %*% t(X) %*% Y
# Or you can compute the generalized inverse use the package pracma
# install.packages("pracma")
library(pracma)
pinv(X) %*%Y



# Compute the coefficients using the generalized inverse (with intercept)
library(matlib)
m <-length(mydat)-1
M <- data.matrix(mydat, rownames.force = NA)
n <- nrow(M)
m <- ncol(M)
X <- cbind(rep(1,n),M[1:n,c(1,3:m)])
Y <- M[1:n,2]
inv((t(X)%*%X)) %*% t(X) %*% Y
# Or you can compute the generalized inverse use the package pracma
library(pracma)
pinv(X) %*%Y
