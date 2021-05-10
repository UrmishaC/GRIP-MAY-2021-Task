"""
Data Science and Business Analytics Internship @The Sparks Foundation
GRIP MAY 2021 
Task 1: Prediction using Supervised ML

Author: Urmisha Chatterjee"""

"""
Problem: Predict the score of a student studying 9.25hrs/day
"""




rm(list=ls())
#Extracting the data
data=read.table("https://raw.githubusercontent.com/AdiPersonalWorks/Random/master/student_scores%20-%20student_scores.csv", header=TRUE, sep=",")
data

#Plotting the data in a scatterplot
x=data$Hours
y=data$Scores
library(ggplot2)
ggplot(data,aes(x=Hours,y=Scores))+
geom_point(color="blue")+
labs(title="Scatterplot of Hours vs Score")+theme_classic()

#Fitting a linear regression model with an intercept term
fit=lm(y~x)
k=summary(fit)
k

#Fitting a linear regression model with no-intercept
fit2=lm(y~x-1)
summary(fit2)

#Residual Plot
resi=resid(fit2)
residualplot=data.frame(resi,x)
ggplot(residualplot,aes(x=x,y=resi))+
geom_point()

#Fitted Line Plot
ggplot(data, aes(x=Hours, y=Scores)) + 
  geom_point(color="blue")+
  geom_smooth(method=lm, se=FALSE,formula=y~x-1)+theme_classic()

#Prediction
new=data.frame(x=9.25)
pred=predict(fit2,new)
cat("The prediction is",pred,"\n")

