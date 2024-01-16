
##### Introduction ###############################################
# Date: 
# Author:  
# Subject: 
# Script/Code: graphs/plots using base "Graphics" package 
# version 
# add additional comments/details as you prefer

rm(list = ls())    # rm - remove

# if you are not sure about how to use a function use help("function name")

# set the working folder - a good practice to save all related work in one place
help(setwd)

setwd(dir = "")

# example: this is how I have set up my working folder 
setwd(dir = "C:/Users/aloysiusn/OneDrive - University of Missouri/courses/Numerical_Methods/MyWork_FS23")


##### (I) plot.default function ################################################

# first we need some data to plot. 
# let's create some random numbers

lx <- seq.int(from = 1, to = 20, length.out = 20)  # we used this last time.

ly <- rnorm(n = 20, mean = 50, sd = 10)

plot.default(x = lx,                    # x argument provides the x coordinates for the plot
             y = ly,                    # x argument provides the x coordinates for the plot
             type = "p",                # 1-character string giving the type of plot desired; "p" for points
             col = "red",               # color of the points or line
             main = "Scatter Plot",     # main title for the plot
             xlab = "Sequence",         # x-axis label
             ylab = "Random numbers")   # y-axis label

##### (II) barplot function ####################################################

# first we need some data to plot. 
# let's create some random numbers

# example data: the vector ht gives heights of 20 students in grade 1 class at a public school
# the values are in centimeters, rounded to the nearest 10

ht <- c(120,90,110,110,70,100,90,80,90,60,110,100,120,90,120,80,140,100,110,80)

# you will notice that there are several students with same height
# the function "table" will help summarise the frequency
help(table) # Cross Tabulation and Table Creation

# use "table" to create the cross tabulation
ht1 <- table(ht)

# now, create the plot
barplot(height = ht1,                     # table with counts and heights
        main = "Height of Students",      # main title
        xlab = "Height (cm)",             # x-axis label
        ylab = "Count",                   # y-axis label
        border = "black",                 # bar border color
        col = "yellow")                   # bar fill color
box()


##### (III) barplot function ####################################################

# first we need some data to plot. 

# We will use "rnorm" function to create some random numners.

rnd1 <- rnorm(n = 2000, mean = 500, sd = 100)

# now, create the plot
boxplot(x = rnd1,                         # values
        main = "Height of Students",      # main title
        xlab = "",                        # x-axis label
        ylab = "Value",                   # y-axis label
        border = "black",                 # bar border color
        col = "yellow")                   # bar fill color
box()


