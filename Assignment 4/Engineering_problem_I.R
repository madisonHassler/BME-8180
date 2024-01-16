##### 1) Introduction ###############################################
# ****************************************************
# Date: 07DEC2023
# Author: Madison Hassler
# Subject: BE 8180
# Script/Code:
# version
# add additional comments/details as you prefer

# clear all objects in the current R session.
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

# (A) Engineering Application I - Water Discharge from a Reservoir
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

# review the note "Equations-of-Single-Variable".
# Equation 9 is deduced to two equations based on the initial conditions provided

# we can define the following two functions - please refer the relevant section
#     in the handout "Engineering-example-I.docx"

# Function 1 (equation 4 in "Engineering-example-I")

WaterFunction1 <- function(h) {
  # first expression
  2.2576 / sqrt(h)
}

# Function 2 (equation 5 in "Engineering-example-I")

WaterFunction2 <- function(h) {
  # second expression
  tanh(2.2147 * sqrt(h))
}


# Function 3 - combine both;

WaterFunction3 <- function(h) {
  # combine both
  2.2576 / sqrt(h) - tanh(2.2147 * sqrt(h))
}


# 3) View the solution graphically !! ####
# ****************************************************

# we need to define the range for "h" and for the response

# h range
hr1 <- 0 # minimum value
hr2 <- 10 # maximum value

# response function range
vr1 <- -1
vr2 <- 5

# first curve - using "WaterFunction1")
curve(
  expr = WaterFunction1,
  from = 0,
  to = 10,
  n = 100,
  add = FALSE,
  xname = "height, h (m)",
  ylab = "velocity (m/sec)",
  col = "black",
  lty = "solid",
  lwd = 3,
  ylim = c(-1, 5)
)

# second curve - using "WaterFunction2"
curve(
  expr = WaterFunction2,
  from = 0,
  to = 10,
  n = 100,
  add = TRUE,
  col = "darkgreen",
  lty = "solid",
  lwd = 2
)

# third curve - using "WaterFunction3"
curve(
  expr = WaterFunction3,
  from = 0,
  to = 10,
  n = 100,
  add = TRUE,
  col = "red",
  lty = "solid",
  lwd = 2
)

# add grid to the plot
grid()

# add horizontal and vertical lines through the origin
abline(h = 0, v = 0, lty = "solid")
ggsave("Water_Discharge_Plot.pdf", plot = last_plot())

# 4) Find the roots within the solution range !! ####
# ****************************************************

# based on the plot above, we know the solution lies somewhere between 4 and 6

# we can use the following basic R functions to find the exact solution

help("uniroot") # available in the "stats" package. This is loaded by default.

uniroot(f = WaterFunction3, lower = 4, upper = 6)



# 5) Turn in the following !! ####
# ****************************************************

# (A) Create a single plot with all the three functions
#      i) Add a main title for the plot
#     ii) Add your name as "sub title"

title(main = "Water Discharge from a Reservoir", sub = "Madison Hassler")


# (B) Include the exact solution:
#     "What is the value of "h" to for achieving a velocity of 10 m/sec?"
root_result <- uniroot(f = WaterFunction3, lower = 4, upper = 6)

# Extract the value of "h" from the result
h_value <- root_result$root

# Print the result
cat("The value of h for achieving a velocity of 10 m/sec is:", h_value, "m\n")

# (C) Upload your document as a single PDF file to Canvas
answer_text <- paste("The value of h for achieving a velocity of 10 m/sec is:", h_value, "m")
writeLines(answer_text, "answer.txt")

# Save the plot to a PDF
pdf_filename <- "Engineering_problem_I.pdf"
save(filename = pdf_filename, plot = last_plot(), width = 8, height = 6)

# Print a message indicating successful file creation
cat("Plot and answer saved to:", pdf_filename, "\n")






pdf("Water_Discharge_Plot.pdf")  # Open a PDF file for plotting
title(main = "Water Discharge from a Reservoir", sub = "Madison Hassler")

# (B) Include the exact solution:
#     "What is the value of "h" to for achieving a velocity of 10 m/sec?"
root_result <- uniroot(f = WaterFunction3, lower = 4, upper = 6)

# Extract the value of "h" from the result
h_value <- root_result$root

# Print the result
cat("The value of h for achieving a velocity of 10 m/sec is:", h_value, "m\n")

# Save the current plot to the PDF file
dev.copy(pdf, "Water_Discharge_Plot.pdf")
dev.off()  # Close the PDF file