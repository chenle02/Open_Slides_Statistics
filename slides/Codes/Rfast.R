install.packages("RcppGSL")

install.packages("Rfast")

library(Rfast)

x <- rbeta(1000, 1, 4)
beta.mle(x)

a = beta.mle(x)
