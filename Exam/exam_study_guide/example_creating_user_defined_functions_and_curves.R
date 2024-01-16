
rm(list = ls())

# ****************************************************
# 1) User defined functions ####
# ****************************************************

# example 1 - rating curve for river flow
# ************************

# The height-discharge relationship at a river location is given as follows

# Q = A x H ^ b

# Q <- discharge, in m^3/s 
# H <- gage height, in m
# A and b are constants. values are given below
A <- 8.26
b <- 4.35


# define the function
Discharge <- function( x, A = 8.26, b = 4.35 ) {
  
  # define the function
  A * x ^ b 
  
}


# evaluate the function

Q1 <- Discharge(x = 1.2)

# answer is 18.25654

# ****************************************************
# 2) Create a plot with the functions ####
# ****************************************************

# for a height range of 0.8 and 1.6 meters,
# let's create the rating curve
help(curve)

curve(expr = Discharge,
      from = 0.8,                  # "from" and "to" defines the range over which the function will be plotted
      to = 1.6,
      n = 100,                     # integer; the number of x values within the defined range at which to evaluate
      add = FALSE,                 # if FALSE add to an already existing plot
      col = "red",                 # set plot color
      lwd = 2,                     # set plot line thickness
      xlab = "Gage height (m)",    # x axis title
      ylab = "Discharge (m^3/s)")  # y axis title
# We can add some details to the plot
grid()



