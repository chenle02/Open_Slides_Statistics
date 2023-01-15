# library("ggpubr")
# Case Study 14.3.1

x <- c(13.32, 13.06, 14.02, 11.86, 13.58, 13,77, 13.51, 14.42, 14.44, 15.43)

wilcox.test(x, mu = 14.60, alternative = "two.sided")
