
##### 0) Introduction ###############################################
# ****************************************************
# Date: 07DEC2023
# Author: Madison Hassler
# Subject: BE 8180
# Script/Code:  
# version 
# add additional comments/details as you prefer

# it's always good to clear the memory before starting your work.
rm(list = ls())

# set the working folder - a good practice to save all related work in one place
#   Please make sure to follow/develop a reasonable naming convention for files

# setwd("LOCATION OF YOUR WORKING FOLDER")

setwd(dir = "/Users/madi/Documents/GitHub/BME-8180/Assignment 4")

# 1) Load required packages ####
# ****************************************************

require(ggplot2)

# 2) User defined functions!! ####
# ****************************************************

# (A) Engineering Application II - Maintain the Required Flush Volume in a Tank/Cistern
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

# define the function

# Function 1 (Equation 5)
FlushFunction1 <- function( d ) {
  
  # first expression
  # DEFINE the function using Equation 5 in the handout "Engineering-example-II.docx"
  # check example 3 in "Functions.R"
  d^3 - 30 * d^2 + 1600  
}


# 3) View the solution graphically !! ####
# ****************************************************

# we need to define the range for "d" and for the response 
# Suggested values are given below

# d range
d1 <- 0     # minimum value, cm
d2 <- 20    # maximum value, cm

# response function range
f1 <- -3000
f2 <- 3000

# first curve
curve(
  expr = FlushFunction1,
  from = d1,
  to = d2,
  n = 200,
  add = FALSE,
  xname = "Depth (cm)",
  ylab = "Gallon per Flush",
  col = "blue",
  lty = "solid",
  lwd = 3,
  ylim = c(f1, f2)
)


grid()
abline(h = 0, v = 0,lty = "solid")

# 4) Find the roots within the solution range !! ####
# ****************************************************

# based on the plot above, we know the solution lies somewhere between 4 and 6

# we can use the following basic R functions to find the exact solution

help("uniroot")  # available in the "stats" package. This is loaded by default. 

uniroot(f = FlushFunction1, lower = 5, upper = 10)

# 8.658622

# 5) Turn in the following !! ####
# ****************************************************

# (A) Create a plot for the function defined in Equation 4
#      i) Add a main title for the plot
#     ii) Add your name as "sub title"
title(main = "Flush Function Plot", sub = "Madison Hassler")

# (B) Include the exact solution: 
#       "How deep the float ball in Figure 1 should be immersed so that a required flush volume can be maintained?" 
# Find the root using uniroot
root_result <- uniroot(f = FlushFunction1, interval = c(5, 10))

# Extract the value of d from the result
depth_of_float_ball <- root_result$root

# Print the result
cat("The depth of the float ball to maintain the required flush volume is:", depth_of_float_ball, "cm\n")


# (C) Upload your document as a single PDF file to Canvas

