# a is your data vector
a = seq(1:100)
# Conditions for lower bounds
lb=c(2,20,60)
# Conditions for upper bounds
up=c(6,50,97)
# Store the results in d
d=seq(1:length(lb))
for (i in c(1:length(lb))) {
  d[i] = table(a>lb[i] & a<up[i])[2]
  cat("the", i,"th entry is", d[i],"\n")
}
d
  