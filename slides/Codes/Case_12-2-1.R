#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")


Input <- c("
non light moderate heavy
69  55  66  91
52  60  81  72
71  78  70  81
58  58  77  67
59  62  57  95
65  66  79  84
")
Data = read.table(textConnection(Input),
                  header=TRUE)
Data


Input <-c("
rates group
69  non 
52  non
71  non
58  non
59  non
65  non
55  light 
60  light
78  light
58  light
62  light
66  light
66  moderate 
81  moderate
70  moderate
77  moderate
57  moderate
79  moderate
91  heavy 
72  heavy
81  heavy
67  heavy
95  heavy
84  heavy
")
Data = read.table(textConnection(Input),
                  header=TRUE)
Data

# Check the levels 
levels(Data$group)
# Order the groups
Data$group <- ordered(Data$group, levels = c("non", "light","moderate", "heavy"))
levels(Data$group)

# Compute summary statistics by groups 
# including count, mean, sd:
library(dplyr) # a grammar of data manipulation
group_by(Data, group) %>%
  summarise(
    count = n(),
    mean = mean(rates, na.rm = TRUE),
    sd = sd(rates, na.rm = TRUE)
  )


# Box plots
# ++++++++++++++++++++
# Plot rates by group and color by group
library(ggpubr)
png("Case_12-2-1-ggboxplot.png")
ggboxplot(Data, x = "group", y = "rates", 
          color = "group", palette = c("#00AFBB", "#E7B800", "#FC4E07", "blue"),
          order = c("non", "light", "moderate","heavy"),
          ylab = "Rates", xlab = "Treatment")
dev.off()

# Mean plots
# ++++++++++++++++++++
# Plot rates by group
# Add error bars: mean_se
# (other values include: mean_sd, mean_ci, median_iqr, ....)
png("Case_12-2-1-ggline.png")
ggline(Data, x = "group", y = "rates", 
       add = c("mean_se", "jitter"), 
       order =  c("non", "light", "moderate","heavy"),
       ylab = "Rates", xlab = "Treatment")
dev.off()

# Box plot
boxplot(rates ~ group, data = Data,
        xlab = "Treatment", ylab = "Rates",
        frame = FALSE, col = c("#00AFBB", "#E7B800", "#FC4E07","blue"))
# # plotmeans
# library("gplots")
# plotmeans(weight ~ group, data = Data, frame = FALSE,
#           xlab = "Treatment", ylab = "Weight",
#           main="Mean Plot with 95% CI") 

# Compute one-way ANOVA test
res.aov <- aov(rates ~ group, data = Data)
# Summary of the analysis
summary(res.aov)

# Tukey multiple pairwise-comparisons
# 
# As the ANOVA test is significant, we can compute Tukey HSD 
# (Tukey Honest Significant Differences, R function: TukeyHSD()) 
# for performing multiple pairwise-comparison between the means of groups
TukeyResult = TukeyHSD(res.aov)
names(TukeyResult$group)
TukeyResult$group
a <- round(TukeyResult$group,2)


# Or one may use multcomp package or multiple comparisons
library(multcomp)
summary(glht(res.aov, linfct = mcp(group = "Tukey")))

# Check ANOVA assumptions: test validity?
png("Case_12-2-1-diagnostic_plots.png")
# diagnostic plots
layout(matrix(c(1,2),1,2)) # optional 1x2 graphs/page
plot(res.aov,c(1,2))
dev.off()

png("Case_12-2-1-diagnostic_plots1.png")
plot(res.aov,1)
dev.off()
png("Case_12-2-1-diagnostic_plots2.png")
plot(res.aov,2)
dev.off()


# 1. Homogeneity of variances
plot(res.aov, 1)
# 2. Normality
plot(res.aov)

# Use Levene’s test to gest homogeneity of variances
library(car)
leveneTest(rates ~ group, data = Data)

# Extract the residuals
aov_residuals <- residuals(object = res.aov )
# Run Shapiro-Wilk test
shapiro.test(x = aov_residuals )
  
# Non-parametric alternative to one-way ANOVA test
# a non-parametric alternative to one-way ANOVA 
# is Kruskal-Wallis rank sum test, which can be 
# used when ANNOVA assumptions are not met.
kruskal.test(rates ~ group, data = Data)

