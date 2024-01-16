##### 0) Introduction ###############################################
# ****************************************************
# Date: 10DEC2023
# Author:  Madison Hassler
# Subject: Scaffolding problem
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

# We will be using the package "matlib" in R that is developed for
#    "Teaching and Learning Linear Algebra and Multivariate Statistics"

# We have already learned about vectors, matrices and dataframes
# ****************************************************


# set the working folder - a good practice to save all related work in one place
#   Please make sure to follow/develop a reasonable naming convention for files

# setwd("LOCATION OF YOUR WORKING FOLDER")

setwd(dir = "C:/Users/PhotonUser/My Files/Temporary Files")


# 1) Load required packages ####
# ****************************************************

# we will be using a new package called "matlib"
require(matlib)      # you might have to install this package 
require(rgl)

require(ggplot2) 


# ****************************************************
# 2) Crane Truss problem - define the linear system of equations !! ####
# ****************************************************

# review the presentation "S5_example-II-crane-truss_v1.pptx" for additional details
# the 12 equations can be presented in the standard form (A*x=b) as follows

# the "Coefficient Matrix" A is given below

A_truss <- matrix(data = c(cos(30/180*pi), 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                           cos(60/180*pi), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                           cos(30/180*pi), 0, 0, 0, 0, -1, -cos(45/180*pi), 0, 0, 0, 0, 0,
                           cos(60/180*pi), 0, 1, 0, 0, 0, -cos(45/180*pi), 0, 0, 0, 0, 0,
                           0, 1, 0, cos(30/180*pi), cos(30/180*pi), 0, 0, 0, 0, 0, 0, 0,
                           0, 0, -1, cos(60/180*pi), cos(60/180*pi), 0, 0, 0, 0, 0, 0, 0,
                           0, 0, 0, 0, 0, 0, cos(45/180*pi), 0, -cos(45/180*pi), 0, 0, -cos(30/180*pi),
                           0, 0, 0, 0, 0, 0, cos(45/180*pi), 0, cos(45/180*pi), 0, 0, -cos(60/180*pi),
                           0, 0, 0, 0, cos(30/180*pi), 1, 0, 0, cos(45/180*pi), 0, -cos(30/180*pi), 0,
                           0, 0, 0, 0, cos(60/180*pi), 0, 0, 1, -cos(45/180*pi), 0, cos(60/180*pi), 0,
                           0, 0, 0, cos(30/180*pi), 0, 0, 0, 0, 0, cos(45/180*pi), 0, 0,
                           0, 0, 0, cos(60/180*pi), 0, 0, 0, -1, 0, cos(45/180*pi), 0, 0),
                  nrow = 12, ncol = 12, byrow = TRUE)

# the variables to be determined (x) or the unknown forces are given
F_truss <- paste0("F", c(1:12))
# "F1"  "F2"  "F3"  "F4"  "F5"  "F6"  "F7"  "F8"  "F9"  "F10" "F11" "F12"

# and the constants or external forces are given
b_truss1 <- c(0, -800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

# try the the following progressively increasing weight (W) and
#     record the maximum tensile force (negative values), and 
#                maximum compression force (positive values)
b_truss2 <- c(0, -1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
b_truss3 <- c(0, -1200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
b_truss4 <- c(0, -1400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
b_truss5 <- c(0, -1600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
b_truss6 <- c(0, -1800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
b_truss7 <- c(0, -2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)


# ****************************************************
# 3) Solve the equations one at a time !! ####
# ****************************************************

help("showEqn")
help("Solve")

# 3.1) W = 800 kg
# ****************************************************
sol1 <- Solve(A = A_truss,     # the matrix of coefficients of a system of linear equations
              b = b_truss1,    # the vector of constants on the right hand side of the equations
              vars = F_truss)  # a numeric or character vector of names of the variables

# the result would show 12 values for F1, F2, ...., F12
# the positive values are compressive forces
# and the negative values are tensile forces

# Now, repeat the same for other weights (W)

# 3.2) W = 1000 kg
# ****************************************************

sol2 <- Solve(A = A_truss,     # the matrix of coefficients of a system of linear equations
              b = b_truss2,    # the vector of constants on the right hand side of the equations
              vars = F_truss)  # a numeric or character vector of names of the variables


# 3.3) W = 1200 kg
# ****************************************************

sol3 <- Solve(A = A_truss,     # the matrix of coefficients of a system of linear equations
              b = b_truss3,    # the vector of constants on the right hand side of the equations
              vars = F_truss)  # a numeric or character vector of names of the variables

# 3.4) W = 1400 kg
# ****************************************************

sol4 <- Solve(A = A_truss,     # the matrix of coefficients of a system of linear equations
              b = b_truss4,    # the vector of constants on the right hand side of the equations
              vars = F_truss)  # a numeric or character vector of names of the variables

# 3.5) W = 1600 kg
# ****************************************************

sol5 <- Solve(A = A_truss,     # the matrix of coefficients of a system of linear equations
              b = b_truss5,    # the vector of constants on the right hand side of the equations
              vars = F_truss)  # a numeric or character vector of names of the variables

# 3.6) W = 1800 kg
# ****************************************************

sol6 <- Solve(A = A_truss,     # the matrix of coefficients of a system of linear equations
              b = b_truss6,    # the vector of constants on the right hand side of the equations
              vars = F_truss)  # a numeric or character vector of names of the variables

# 3.7) W = 2000 kg
# ****************************************************

sol7 <- Solve(A = A_truss,     # the matrix of coefficients of a system of linear equations
              b = b_truss7,    # the vector of constants on the right hand side of the equations
              vars = F_truss)  # a numeric or character vector of names of the variables

# ****************************************************
# 4) Compile maximum tensile and compression forces for each weight W !! ####
# ****************************************************

#     record the maximum tensile force (negative values), and 
#                maximum compression force (positive values)
# 

forces1 <- data.frame(Weight = c(800, 1000, 1200, 1400, 1600, 1800, 2000),
                      Tensile = c(-2342.56258422, -2928.20323028, -3513.843876, -4099.48452239, -4685.125168, -5270.765815, -5856.406461),
                      Compress = c(1486.01773364, 1857.52216705, 2229.0266, 2600.531034, 2972.035467, 3343.539901, 3715.044334))



# ****************************************************
# 5) Create a plot  !! ####
# ****************************************************

# Create a plot showing weights on the x-axis and
#    tensile and compression forces on the x axis
# your plot should include proper axis titles, legend and units

p1 <- ggplot(data = forces1) +
  geom_line(mapping = aes(x = Weight, y = Tensile), color = "red") +
  geom_point(mapping = aes(x = Weight, y = Tensile), color = "red") +
  geom_line(mapping = aes(x = Weight, y = Compress), color = "blue") +
  geom_point(mapping = aes(x = Weight, y = Compress), color = "blue") +
  labs(title = "Crane Truss Forces Estimation",
       x = "Weight (kg)",
       y = "Force",
       color = "Legend",) +
  theme_bw()
p1
# ****************************************************
# 6) Answer the following questions  !! ####
# ****************************************************

# 6.1) What is maximum tensile force on the rods?
#       include the corresponding weight W
max_tensile <- min(forces1$Tensile)
max_tensile_weight <- forces1$Weight[which.min(forces1$Tensile)]
cat("6.1) Maximum Tensile Force:", max_tensile, "N at Weight:", max_tensile_weight, "kg\n")
# 6.1) Maximum Tensile Force: -5856.406 N at Weight: 2000 kg


# 6.2) What is maximum compression force on the rods?
#       include the corresponding weight W

max_compress <- max(forces1$Compress)
max_compress_weight <- forces1$Weight[which.max(forces1$Compress)]
cat("6.2) Maximum Compression Force:", max_compress, "N at Weight:", max_compress_weight, "kg\n")
# 6.2) Maximum Compression Force: 3715.044 N at Weight: 2000 kg


# 6.3) If the allowable tensile and compression loads on the truss bars are
#          1600 kg and 1800 kg, respectively,
#       What is the maximum safe weight the truss can handle?

allowable_tensile <- 1600
allowable_compress <- 1800
max_safe_weight <- min(forces1$Weight[forces1$Tensile <= allowable_tensile & forces1$Compress >= allowable_compress])
cat("6.3) Maximum Safe Weight:", max_safe_weight, "kg\n")
# 6.3) Maximum Safe Weight: 1000 kg

# ****************************************************
# 7) Upload your script with answers and "RData" file to canvas  !! ####
# ****************************************************
save.image("A05.RData")



# ****************************************************

rm(list = ls())

