#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")
# https://rcompanion.org/rcompanion/d_08.html


Input = ("
 id Sex     Genotype  Activity
  1 male    ff        1.884
  2 male    ff        2.283
  3 male    fs        2.396
  4 female  ff        2.838
  5 male    fs        2.956
  6 female  ff        4.216
  7 female  ss        3.620
  8 female  ff        2.889
  9 female  fs        3.550
 10 male    fs        3.105
 11 female  fs        4.556
 12 female  fs        3.087
 13 male    ff        4.939
 14 male    ff        3.486
 15 female  ss        3.079
 16 male    fs        2.649
 17 female  fs        1.943
 19 female  ff        4.198
 20 female  ff        2.473
 22 female  ff        2.033
 24 female  fs        2.200
 25 female  fs        2.157
 26 male    ss        2.801
 28 male    ss        3.421
 29 female  ff        1.811
 30 female  fs        4.281
 32 female  fs        4.772
 34 female  ss        3.586
 36 female  ff        3.944
 38 female  ss        2.669
 39 female  ss        3.050
 41 male    ss        4.275
 43 female  ss        2.963
 46 female  ss        3.236
 48 female  ss        3.673
 49 male    ss        3.110
")
Data = read.table(textConnection(Input),header=TRUE)
Data
install.packages("car")
library(car)

# Two-way ANOVA
model = lm(Activity ~ Sex + Genotype,
           data=Data)
Anova(model, type="II")

# -- Tukey's pairwise comparison (Two-way ANOVA)
model2 = aov(Activity ~ Sex + Genotype,
           data=Data)
TukeyHSD(model2, "Genotype", ordered = TRUE)

# One-way ANOVA
model_Sex = lm(Activity ~ Sex,
               data=Data)
Anova(model_Sex, type="II")

# One-way ANOVA
model_Genotype = lm(Activity ~ Genotype,
               data=Data)
Anova(model_Genotype, type="II")


# Tukey's pairwise comparison (One-way)
model1 = aov(Activity ~ Genotype,
                      data=Data)
TukeyHSD(model1, "Genotype", ordered = TRUE)G:q



# Modify data


Input = ("
 id Sex     Genotype  Activity
  1 male    ff        10.884
  2 male    ff        10.283
  3 male    fs        2.396
  4 female  ff        10.838
  5 male    fs        2.956
  6 female  ff        10.216
  7 female  ss        3.620
  8 female  ff        11.889
  9 female  fs        3.550
 10 male    fs        3.105
 11 female  fs        15.556
 12 female  fs        3.087
 13 male    ff        10.939
 14 male    ff        10.486
 15 female  ss        3.079
 16 male    fs        2.649
 17 female  fs        10.943
 19 female  ff        10.198
 20 female  ff        12.473
 22 female  ff        10.033
 24 female  fs        2.200
 25 female  fs        2.157
 26 male    ss        2.801
 28 male    ss        1.421
 29 female  ff        10.811
 30 female  fs        5.281
 32 female  fs        14.772
 34 female  ss        3.586
 36 female  ff        11.944
 38 female  ss        1.669
 39 female  ss        3.050
 41 male    ss        1.275
 43 female  ss        2.963
 46 female  ss        1.236
 48 female  ss        1.673
 49 male    ss        1.110
")

Data = read.table(textConnection(Input),header=TRUE)


# Two-way ANOVA
model = lm(Activity ~ Sex + Genotype,
           data=Data)

library(car)

Anova(model, type="II")

# One-way ANOVA
model_Sex = lm(Activity ~ Sex,
               data=Data)
Anova(model_Sex, type="II")

# One-way ANOVA
model_Genotype = lm(Activity ~ Genotype,
                    data=Data)
Anova(model_Genotype, type="II")


# --------------------------end ---------
# Means and summary statistics by group
library(Rmisc)

sum = summarySE(Data,
                measurevar="Activity",
                groupvars=c("Sex","Genotype"))
sum

# Interaction plot using summary statistics
library(ggplot2)

pd = position_dodge(.2)

ggplot(sum, aes(x=Genotype,
                y=Activity,
                color=Sex)) +
  geom_errorbar(aes(ymin=Activity-se,
                    ymax=Activity+se),
                width=.2, size=0.7, position=pd) +
  geom_point(shape=15, size=4, position=pd) +
  theme_bw() +
  theme(
    axis.title.y = element_text(vjust= 1.8),
    axis.title.x = element_text(vjust= -0.5),
    axis.title = element_text(face = "bold")) +
  scale_color_manual(values = c("black", "blue"))




