
#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")
# This is an example of MANOVA
# Ref: http://www.sthda.com/english/wiki/manova-test-in-r-multivariate-analysis-of-variance

# Load data
library(datasets)
data(iris)
summary(iris)
my_data <- iris
my_data

# Show a random sample
library(dplyr)
set.seed(1234)
dplyr::sample_n(my_data, 10)

# Compute MAOVA test now
sepl <- iris$Sepal.Length
petl <- iris$Petal.Length
res.man <- manova(cbind(Sepal.Length, Petal.Length) ~ Species, data = iris)
summary(res.man)
# Look to see which differ
summary.aov(res.man)

# From the output above, it can be seen that the two variables are highly significantly different among Species.

