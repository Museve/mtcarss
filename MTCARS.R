# the data for this simple project is mtcars. The data is inbuild in r
#load/install the following libraries
library(ggplot2)
library(caret)
library(dplyr)
attach(mtcars)
library(ggthemes)
head(mtcars,3)
#mtcar description
str(mtcars)
#[, 1]	 mpg	 Miles/(US) gallon
#[, 2]	 cyl	 Number of cylinders
#[, 3]	 disp	 Displacement (cu.in.)
#[, 4]	 hp	 Gross horsepower
#[, 5]	 drat	 Rear axle ratio
#[, 6]	 wt	 Weight (1000 lbs)
#[, 7]	 qsec	 1/4 mile time
#[, 8]	 vs	 Engine (0 = V-shaped, 1 = straight)
#[, 9]	 am	 Transmission (0 = automatic, 1 = manual)
#[,10]	 gear	 Number of forward gears
#[,11]	 carb	 Number of carburetors
# we look at the summary by calling the command below
summary(mtcars)
# Visualization of the mtcars data set
library(esquisse)  
esquisse::esquisser(mtcars)
library(ggplot2)

ggplot(data = mtcars) +
  aes(x = mpg, y = disp) +
  geom_point(color = "#0c4c8a") +
  labs(title = "Scatterplot: mpg vs disp",
    caption = "mtcars",
    subtitle = "scatterplot") +
  theme_wsj()
# We check the correlation of variables (mtcars)
#load the package ggcorrplot
library(ggcorrplot)

# Correlation matrix
corr <- round(cor(mtcars), 1)

# Plot the matrix
ggcorrplot(corr, hc.order = TRUE, 
           type = "lower", 
           lab = TRUE, 
           lab_size = 3, 
           method="circle", 
           colors = c("tomato2", "white", "springgreen3"), 
           title="Correlogram of mtcars", 
           ggtheme=theme_bw)
# 1 indicates strong positive linear correlation (greeen)
#-1 indicates strong negative collinearity

# Analysis am transmission vs mpg (efficiency)
ggplot(mtcars,aes(x=factor(am),y=mpg,fill=am))+
  geom_boxplot()+ggtitle('Boxplot')
# From the plot cars which are automatic have low efficieny than manual
# we run a t-test for am and mpg
t.test(mtcars$mpg~mtcars$am)
#Welch Two Sample t-test

#data:  mtcars$mpg by mtcars$am
#t = -3.7671, df = 18.332, p-value =
#  0.001374
#alternative hypothesis: true difference in means is not equal to 0
#95 percent confidence interval:
#  -11.280194  -3.209684
#sample estimates:
#  mean in group 0 mean in group 1 
#17.14737        24.39231 
#the p value (0.001)<0.05 this indicates a significance between
#manual and automatic transmission in fuel efficiency.

#Building Classissification model


