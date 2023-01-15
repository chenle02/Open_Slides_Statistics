#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")
# http://www.sthda.com/english/wiki/unpaired-two-samples-t-test-in-r

library(ggpubr)
# Case Study 13.2.1
# install.packages("ggpubr")
DIRS <- c(112.9, 123.1, 135.2, 140.2)
STD <- c(115.1, 125.6, 132.4, 143.7) 
Wines <- c("W1", "W2", "R1", "R2")
# Create a data frame
my_data <- data.frame( 
  method = rep(c("DIRS", "STD"), each =4),
  types = c(Wines,Wines),
  concentration = c(DIRS,  STD)
)
# Show data
print(my_data)


library(dplyr)
method_by(my_data, method) %>%
  summarise(
    count = n(),
    mean = mean(concentration, na.rm = TRUE),
    sd = sd(concentration, na.rm = TRUE)
  )

# Plot concentration by method and color by method
library("ggpubr")
ggboxplot(my_data, x = "method", y = "concentration", 
          color = "method", palette = c("#00AFBB", "#E7B800"),
          ylab = "concentration", xlab = "methods")

# Compute t-test with equal variances
res <- t.test(concentration ~ method, 
              data = my_data, 
              var.equal = TRUE)
res

# Compute t-test with unequal variances
res <- t.test(concentration ~ method, 
              data = my_data, 
              var.equal = FALSE)
res


# Now let's carry out two-way ANOVA
library(car)
model = lm(concentration ~ method + types,
           data=my_data)
Anova(model)     


# install.packages("Rmisc")
library(Rmisc)
sum = summarySE(my_data,
                measurevar="concentration",
                methodvars=c("method","types"))
sum



# Now let's try one-way ANOVA
model2 = lm(concentration ~ types,
            data=my_data)
Anova(model2)   

# The following one-way ANOVA is equivalent 
# to the two-sample t test
library(car)
model3 = lm(concentration ~ method,
            data=my_data)
Anova(model3)

# summary(model)
# Anova(model, type="II")     
# Anova(model, type="III")     
# Anova(model)     


