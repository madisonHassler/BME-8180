
##### 0) Introduction ###############################################
# ****************************************************
# Date: 
# Author:  
# Subject: 
# Script/Code:  
# version 
# add additional comments/details as you prefer

# it's always good to clear the memory before starting your work.
rm(list = ls())

# ****************************************************
# In this script, we will learn ideas behind solving systems of
#   linear equations (SLE). The introduction handout provide the form of SLE.
#   The basics shown/evaluated here can be used to solve practical problems 
#   given in the Introductory Handout
#
# The form is defines as " A * x = b ", where
#      A is a "m * n" matrix with "m" equations and "n" unknowns. 
#      (note that when m = n, the it is called a square matrix)
# Here, we also assume that a solution exist for the SLE
#   i.e., "Direct" methods can be used to find exact solutions
# We will also look at situations where an exact solution is not available

#                             ----------
# We will be using the package "matlib" in R that is developed for
#                             ----------
#    "Teaching and Learning Linear Algebra and Multivariate Statistics"

# We have already learned about vectors, matrices and dataframes
# ****************************************************


# set the working folder - a good practice to save all related work in one place
#   Please make sure to follow/develop a reasonable naming convention for files

# setwd("LOCATION OF YOUR WORKING FOLDER")

setwd(dir = ".../MyWork")


# 1) Load required packages ####
# ****************************************************

# we will be using a new package called "matlib"
require(matlib)      # you might have to install this package 
require(rgl)

require(ggplot2) 

# ****************************************************
# 2) User defined functions!! ####
# ****************************************************

# ***********
#  we are not defining any user-defined functions in this session
# ***********



# ****************************************************
# 3) Equations with two unknowns !! ####
# ****************************************************

# equations with two unknowns are of the form

#  a11 * x1 + a12 * x2 = b1     ... eq. 1
#  a21 * x1 + a22 * x2 = b2     ... eq. 2

# Here, we can define the matrix "A" as

#  A = matrix(data = c(a11, a12, a21, a22), nrow = 2, ncol = 2, byrow = T)

# if you recall from the previous sessions that each equation
#   with two unknowns corresponds to a straight line
# e.g., "y = m * x + c" can be written as
#   " a11* y + a12 * x = b1 ", where "a11 = 1", "a12 = m", and "b1 = c"

# consider the following example
# ****************************************************

# 4 * x1  + 3 * x2 = 8       ... eg. 1
# -4 * x1 + 2 * x2 = 2       ... eg. 2

# based on the information above, we can define the matrix "A" as follows
A <- matrix(data = c(4, 3, -4, 2),
            nrow = 2,
            ncol = 2,
            byrow = T)

# and matrix "b" as follows
b <- c(8,2)

# now, use the "showEqn" function available in "matlib" package to display the equation
showEqn(A, b)

# output:
# 4*x1 + 3*x2  =  8 
#-4*x1 + 2*x2  =  2 

# we can also display the equations graphically,
# use the function "plotEqn"
plotEqn(A,b)

# add grid lines
grid(nx = 8, ny = 8, col = "blue")

# if you recall from the previous session that the intersection of the 
# two plots provides the solution for this "system of two linear equations"


# we can verify this by using the function "Solve" the package "matlib"
help("Solve")

Solve(A = A, b = b, fractions = TRUE)

# answer
# x1    =  1/2 
# x2  =    2 

# add this lines to the plot
plotEqn(A,b)

# add grid lines
grid(nx = 8, ny = 8, col = "blue")

# add solution
abline(h = 2, v = 1/2, col = "grey40", lwd = 1.5)


# ****************************************************
# 4) Equations with three unknowns !! ####
# ****************************************************

# assume that an exact solution exists

A2 <- matrix(data = c(6, 3, -3,
                      -9, -3, 6,
                      -6,  3, 6),
             nrow = 3,
             ncol = 3,
             byrow = TRUE)

colnames(A2) <- paste0('x', 1:3)  # add column names

b2 <- c(8, -11, -3)

# use "showEqn" to display the systems of three equations
showEqn(A = A2, b = b2)

# answer
#  6*x1 + 3*x2 - 3*x3  =    8 
# -9*x1 - 3*x2 + 6*x3  =  -11 
# -6*x1 + 3*x2 + 6*x3  =   -3 


# use the "Solve" function to find the exact solutions
Solve(A = A2, b = b2, fractions = TRUE)

# answer
# x1    =   2/3 
# x2    =     1 
# x3    =  -1/3

# plot the solutions in 3D plot 

plotEqn3d(A = A2,
          b = b2,
          alpha = 0.5,          # set transparency, 50%
          solution = T,
          labels = T,
          axes = T)

# rotate the plot and check how the three planes intesect.

# we can extend to n-dimensional equations.

# challenge: find out if you can print the 3D plot !!!

