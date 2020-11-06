#Mahalanobiis Distance uses estimates of the location 
#and scatter to identify values that are far away 
#from the main distribution of data


#Install package
install.packages("ggplot2")
install.packages("dplyr")


#Use the installed library
library(ggplot2)
library(dplyr)


#Get the diamonds dataset
data(diamonds)
df <- sample_frac(diamonds, 0.3)
head(df)


#Calculate Mahalanobis Distance with heaight and weight distribution
MD <- mahalanobis(df[,c(1,5,7)], colMeans(df[,c(1,5,7)]), cov(df[,c(1,5,7)]))


#Adding MD column in our dataframe df
df$MD <- round(MD, 3)

head(df)

MD[1:300]%>% round(2)


#Mahalanobis Outliers - Threshold set to 12
df$outlier_maha <- FALSE
df$outlier_maha[df$MD > 10] <- TRUE

head(df)

View(df)
