#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")

# Case Study 13.2.1
install.packages("ggpubr")
DIRS <- c(112.9, 123.1, 135.2, 140.2)
STD <- c(115.1, 125.6, 132.4, 143.7) 
# Create a data frame
my_data <- data.frame( 
  group = rep(c("DIRS", "STD"), each =4),
  weight = c(DIRS,  STD)
)
# Show data
print(my_data)


install.packages("dplyr")