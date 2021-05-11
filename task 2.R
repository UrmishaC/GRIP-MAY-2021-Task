"""
Data Science and Business Analytics Internship @The Sparks Foundation
GRIP MAY 2021
Task 2: Prediction using Unsupervised ML
"""
"""
Problem: From the 'Iris' dataset predict the optimum number of clusters
"""


rm(list=ls())

#reading the dataset
setwd("C:/Users/Asus")
iris=read.csv("Iris.csv")
iris

#extracting the columns
names(iris)

#saving required columns in a data frame
iris_modified=data.frame(iris$SepalLengthCm,iris$SepalWidthCm,iris$PetalLengthCm,
iris$PetalWidthCm)
iris_modified

#Performing K-Means Clustering on the data
#Determining the no of clusters
wcss=array(0)
for (i in 1:15)
{
set.seed(4)
km.out=kmeans(iris_modified,i,nstart=20)
s=km.out$tot.withinss
wcss[i]=s
}
wcss

#plotting the within sum of squares v/s no of clusters in a plot
x=seq(1,15,1)
plot(x,wcss,type="line",main="The Elbow Method")

#Performing K-Means Clustering with K=3
km.out=kmeans(iris_modified,3,nstart=20)
clus=km.out$cluster
iris=data.frame(iris$SepalLengthCm,iris$SepalWidthCm)
library(cluster)
clusplot(iris,clus,main="Clusterplot",col.p = "blue",col.clus=c(2,4,6),
shade=TRUE,labels=1,color=TRUE,xlab="Sepal Length",ylab="Sepal Width")
