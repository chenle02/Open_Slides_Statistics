#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/Homeworks")

# HW 12.2.1
# Read data first
Input <- c("
MPG Model
22 A
26 A
28 B
24 B
29 B
29 C
32 C
28 C
23 D
24 D
")
Data = read.table(textConnection(Input),
                  header=TRUE)
# Compute one-way ANOVA test
res.aov <- aov(MPG ~ Model, data = Data)
# Summary of the analysis
summary(res.aov)



# HW 12.2.2
# Read data first
Input <- c("
rates group
57.8 Y1669
60.2 Y1669
60.3 Y1669
57.9 Y1780
55.2 Y1780
54.8 Y1780
52.7 Y1865
53.0 Y1865
49.4 Y1865
")
Data = read.table(textConnection(Input),
                  header=TRUE)
# Compute summary statistics by groups
# including count, mean, sd:
library(dplyr) # a grammar of data manipulation
group_by(Data, group) %>%
  summarise(
    count = n(),
    mean = mean(rates, na.rm = TRUE),
    sd = sd(rates, na.rm = TRUE)
  )
# Compute one-way ANOVA test
res.aov <- aov(rates ~ group, data = Data)
# Summary of the analysis
summary(res.aov)


# Example 12.2.4
# Read data first
Input <- c("
bushels group
46.2 V1
51.9 V1
48.7 V1
49.2 V2
58.6 V2
57.4 V2
60.3 V3
58.7 V3
60.4 V3
48.9 V4
51.4 V4
44.6 V4
52.5 V5
54.0 V5
49.3 V5
")
Data = read.table(textConnection(Input),
                  header=TRUE)
# Compute summary statistics by groups
# including count, mean, sd:
library(dplyr) # a grammar of data manipulation
group_by(Data, group) %>%
  summarise(
    count = n(),
    mean = mean(bushels, na.rm = TRUE),
    sd = sd(bushels, na.rm = TRUE)
  )
# Compute one-way ANOVA test
res.aov <- aov(bushels ~ group, data = Data)
# Summary of the analysis
summary(res.aov)

# HW 12.3.1
# Read data first
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
# Order the groups
Data$group <- ordered(Data$group, levels = c("non", "light","moderate", "heavy"))
# Compute one-way ANOVA test first
res.aov <- aov(rates ~ group, data = Data)
# Summary of the analysis
summary(res.aov)
# Now compute the Tukey's multiple comparisons
TukeyHSD(res.aov)
# Or one may use multcomp package or multiple comparisons
library(multcomp)
summary(glht(res.aov, linfct = mcp(group = "Tukey")))


# Example 12.3.4
# Read data first
Input <- c("
bushels group
46.2 V1
51.9 V1
48.7 V1
49.2 V2
58.6 V2
57.4 V2
60.3 V3
58.7 V3
60.4 V3
48.9 V4
51.4 V4
44.6 V4
52.5 V5
54.0 V5
49.3 V5
")
Data = read.table(textConnection(Input),
                  header=TRUE)
# Compute one-way ANOVA test first
res.aov <- aov(bushels ~ group, data = Data)
# Summary of the analysis
summary(res.aov)
# Now compute the Tukey's multiple comparisons
TukeyHSD(res.aov)
# Or one may use multcomp package or multiple comparisons
library(multcomp)
summary(glht(res.aov, linfct = mcp(group = "Tukey")))

