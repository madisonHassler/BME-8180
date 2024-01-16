
##### 0) Introduction ###############################################
# ****************************************************
# Date: 10 DEC2023 
# Author:  Madison Hassler
# Subject: Scaffolding problem
# Script/Code:  
# version 
# add additional comments/details as you prefer

# it's always good to clear the memory before starting your work.
rm(list = ls())

# ****************************************************
# In this script, you will be using multiple datasets to 
#   fit linear and nonlinear curve fitting
#   
# About the datasets:
# --- --- --- --- ---
# the National Institute of Standards and Technology (NIST) 
#   has published a Standard Reference Database
#   (DOI: http://dx.doi.org/10.18434/T43G6C) in response to industrial concerns
#   about numerical accuracy of computations from statistical software.
#   They have also provided certified values for a variety of 
#   statistical methods. Some example problems in this module use
#   datasets from the Standard Reference Database.
#   
#
# Linear form is defined as " y = a * x + b ", where
#      a and b are coefficients to be determined. 
# 
# Nonlinear form can be a polynomial, exponential, trgonometric 
#   or a combination 

# We will be using functions in the "base" package in R for most of the
#    calculations. 

# ****************************************************


# set the working folder - a good practice to save all related work in one place
#   Please make sure to follow/develop a reasonable naming convention for files

# setwd("LOCATION OF YOUR WORKING FOLDER")

setwd(dir = "/Users/madi/Documents/GitHub/BME-8180/Assignment 6")


# 1) Load required packages ####
# ****************************************************

require(ggplot2) # for creating plots

# all the required functions for this session are available in
#  "base" and "stats" packages, and are loaded by default.

# ****************************************************
# 2) Linear curve fitting examples - using "lm" !! ####
# ****************************************************
help(lm)

# 2.1) Linear fit using the NIST dataset "Norris" ####
# --- --- --- --- --- --- --- --- --- --- --- --- ---
norris <- read.table(file = "NIST_norris_dataset.txt", header = TRUE, sep = "")

# apply the linear fit
# --- --- --- --- --- --- --- --- --- --- --- --- ---
lm_norr <- with(data = norris, 
                lm( formula = y ~ x,
                    data = norris ) )

# the function "summary()" returns details about the fitted model
# --- --- --- --- --- --- --- --- --- --- --- --- ---
summary(object = lm_norr)

# "coefficients() will return the values needed to fit the linear curve
# --- --- --- --- --- --- --- --- --- --- --- --- ---
coefficients(object = lm_norr)

# (Intercept)           x 
# 0.2643889   0.9978814 

# "predict()" <- function for predictions from the 
#                results of various model fits
# --- --- --- --- --- --- --- --- --- --- --- --- ---
help("predict")

predict(object = lm_norr, )  # model object for which prediction is desired

# additional arguments...
#  if "newdata=" is provided, then, the new independent values are used
#          to predict. If omitted, the fitted values are used.


# create a plot an inlclude the data points and the fitted curve
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# first, create an output object
png(filename = "linear_fit_norris_v1.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 10,
    res = 300)

# add the data points
with(norris,
     plot(x = x,
          y = y,
          col = "red"))

# insert the fitted curve using "abline" plot function
# help("abline")
abline(reg = lm_norr,  # provide the name of the "lm" object
       col = "black")

dev.off()

# include the plot the output from "summary()" in you report
#  the outputs for this, plot and summary, are included as example in
#    --- --- --- --- --- --- --- --- --- ---
#    "S6_curve_fitting_report_template.docx"
#    --- --- --- --- --- --- --- --- --- ---

# 
# 2.2) Linear fit using the dataset "fluxes_FS2022.csv" ####
# --- --- --- --- --- --- --- --- --- --- --- --- ---
fluxes <- read.table(file = "fluxes_at_watershed_outlet_example.csv",
                     header = TRUE,
                     sep = ",")
# Columns
# water - water flow (milliom cubic meters)
# TP    - total phosphorus in water (metric tons)
# ReP   - reactive or soluble phosphorus in water (metric tons)
# TN    - total nitrogen in water (metric tons)

# these data are for river in northwestern Ohio

# apply the linear fit: TP ~ water
# --- --- --- --- --- --- --- --- --- --- --- --- ---
lm_flux1 <- with(data = fluxes,
                lm( formula = total_phosphorus_metric_tons ~ water_discharge_million_cubic_meters,
                    data = fluxes ) )

# the function "summary()" returns details about the fitted model
# --- --- --- --- --- --- --- --- --- --- --- --- ---
summary(object = lm_flux1)

# "coefficients() will return the values needed to fit the linear curve
# --- --- --- --- --- --- --- --- --- --- --- --- ---
coefficients(object = lm_flux1)

# (Intercept)        water 
# -531.0178253    0.5067875 

# "predict()" <- function for predictions from the 
#                results of various model fits
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# create a plot an inlclude the data points and the fitted curve
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# first, create an output object
png(filename = "linear_fit_fluxes_TP_water_v1.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 10,
    res = 300)

# add the data points
with(fluxes,
     plot(x = water_discharge_million_cubic_meters,
          y = total_phosphorus_metric_tons,
          col = "red",
          xlab = "Water Discharged (Million Cubic Meters)",
          ylab = "Total Phosphorus (Metric Tons)"))

# insert the fitted curve using "abline"
#help("abline")
abline(reg = lm_flux1,  # provide the name of the "lm" object
       col = "black")

dev.off()

# 2.3) Linear fit using "fluxes": TN ~ water ####
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# apply the linear fit: TN ~ water
# --- --- --- --- --- --- --- --- --- --- --- --- ---
lm_flux2 <- with(data = fluxes,
                lm( formula = total_nitrogen_metric_tons ~ water_discharge_million_cubic_meters,,          # include the formula
                    data = fluxes ))          # include the data frame

# the function "summary()" returns details about the fitted model
# --- --- --- --- --- --- --- --- --- --- --- --- ---
summary(object = lm_flux2)

# "coefficients() will return the values needed to fit the linear curve
# --- --- --- --- --- --- --- --- --- --- --- --- ---
coefficients(object = lm_flux2)

# "predict()" <- function for predictions from the 
#                results of various model fits
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# create a plot an inlclude the data points and the fitted curve
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# first, create an output object
png(filename = "linear_fit_fluxes_TN_water_v1.png",       # include file name
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 10,
    res = 300)

# add the plot
with(fluxes,
     plot(x = water_discharge_million_cubic_meters,
          y = total_nitrogen_metric_tons,
          col = "red",
          xlab = "Water Discharged (Million Cubic Meters)",
          ylab = "Total Nitrogen (Metric Tons)"))

# insert the fitted curve using "abline"
abline(reg = lm_flux2,  # provide the name of the "lm" object
       col = "black")

dev.off()




# ****************************************************
# 3) Nonlinear curve fitting examples - using "lm" !! ####
# ****************************************************

# 3.1) nonlinear fit using NIST dataset "wampler2" ####
# --- --- --- --- --- --- --- --- --- --- --- --- ---
wampler2 <- read.table(file = "NIST_wampler2_dataset.txt",
                       header = TRUE,
                       sep = "")

# create second order polynomial fit model using "lm()"
# --- --- --- --- --- --- --- --- --- --- --- --- ---
nlm_wamp1 <- lm(formula = y ~ 1 + x + I(x ^ 2),
                data = wampler2)

# note how the way the second order variable is defined -> "I(x ^ 2)"
# this way, one could add third, fourth order variables

# --- --- --- --- --- --- --- --- --- --- --- --- ---
# instead, the above can be implemented as follows:
# both formats will provide the same answers
# nlm_wamp1 <- lm(formula = y ~ poly(x = x, degree = 2, raw = TRUE),
#                 data = wampler2)
# --- --- --- --- --- --- --- --- --- --- --- --- ---


# display the summary
summary(object = nlm_wamp1)


# create a plot an inlclude the data points and the fitted curve
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# here, we will use the "predict" function 
# "predict()" <- function for predictions from the 
#                results of various model fits
# --- --- --- --- --- --- --- --- --- --- --- --- ---


png(filename = "nonlinear_poly2_wampler_v1.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 10,
    res = 300)

# create the points
with(data = wampler2, plot(x = x, y = y))

# add the fit line | here, we will use the "predict()" function
with(data = wampler2,
     points(x = x,
            y = predict(object = nlm_wamp1),
            type = "l",
            col = "red"))

dev.off()

# 3.2) nonlinear fit using NIST dataset "wampler2" - 3rd order polynomial ####
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# fit a 3rd order polynomial to "wampler2"
nlm_wamp2 <- lm(formula = y ~ 1 + x + I(x ^ 2) + I(x ^ 3),
                data = wampler2)

# include the (i) plot and (ii) summary() output in the report
summary(object = nlm_wamp2)

png(filename = "nonlinear_poly3_wampler_v1.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 10,
    res = 300)

# create the points
with(data = wampler2, plot(x = x, y = y))

# add the fit line | here, we will use the "predict()" function
with(data = wampler2,
     points(x = x,
            y = predict(object = nlm_wamp2),
            type = "l",
            col = "red"))

dev.off()




# 3.3) nonlinear fit using NIST dataset "wampler2" - 5th order polynomial ####
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# fit a 5th order polynomial to "wampler2"
nlm_wamp3 <- lm(formula = y ~ 1 + x + I(x ^ 2) + I(x ^ 3) + I(x ^ 4) + I(x ^ 5),
                data = wampler2)

# include the (i) plot and (ii) summary() output in the report
summary(object = nlm_wamp3)

png(filename = "nonlinear_poly5_wampler_v1.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 10,
    res = 300)

# create the points
with(data = wampler2, plot(x = x, y = y))

# add the fit line | here, we will use the "predict()" function
with(data = wampler2,
     points(x = x,
            y = predict(object = nlm_wamp3),
            type = "l",
            col = "red"))

dev.off()

# include the (i) plot and (ii) summary() output in the report


# 3.4) nonlinear fit using "fluxes": TP ~ water | second order polynomial ####
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# fit a 2nd order polynomial to TP v. water in the "fuxes" dataset
#   use "water" as the independent variable (x)
x <- fluxes$water_discharge_million_cubic_meters
y <- fluxes$total_phosphorus_metric_tons


nlm_flux1 <- lm(formula = y ~ 1 + x + I(x ^ 2),           # add the formula
                data = fluxes)


summary(nlm_flux1)
# include the (i) plot and (ii) summary() output in the report

png(filename = "nonlinear_poly2_flux_TP_water_v1.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 10,
    res = 300)

# create the plot
with(data = fluxes, plot(x = water_discharge_million_cubic_meters, y = total_phosphorus_metric_tons))

# add the fit line | here, we will use the "predict()" function
with(data = fluxes,
     points(x = water_discharge_million_cubic_meters,
            y = predict(object = nlm_flux1),
            type = "l",
            col = "red"))

dev.off()


# include the (i) plot and (ii) summary() output in the report

# 3.5) nonlinear fit using "fluxes": ReP ~ water | second order polynomial ####
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# fit a 2nd order polynomial to ReP v. water in the "fuxes" dataset
#       --- --- ---
#   use "water" as the independent variable (x)

x <- fluxes$water_discharge_million_cubic_meters
y <- fluxes$reactive_phosphorus_metric_tons


nlm_flux2 <- lm(formula = y ~ 1 + x + I(x ^ 2),           # add the formula
                data = fluxes)


summary(nlm_flux2)
# include the (i) plot and (ii) summary() output in the report

png(filename = "nonlinear_poly2_flux_ReP_water_v1.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 10,
    res = 300)

# create the plot
with(data = fluxes, plot(x = water_discharge_million_cubic_meters, y = reactive_phosphorus_metric_tons))

# add the fit line | here, we will use the "predict()" function
with(data = fluxes,
     points(x = water_discharge_million_cubic_meters,
            y = predict(object = nlm_flux2),
            type = "l",
            col = "red"))

dev.off()


# include the (i) plot and (ii) summary() output in the report


# ****************************************************
# 4) Nonlinear curve fitting examples - using "nls" !! ####
# ****************************************************
help(nls)

# 4.1) Use "wampler2" data to fit a second order polynomial ####
# --- --- --- --- --- --- --- --- --- --- --- --- ---

wampler2 <- data.frame(x = c(0,1,2,3,4,5,6,7,8,9,10,11,12),
                       y = c(1, 1.11111, 1.24992, 1.42753, 1.65984,
                             1.96875, 2.38336, 2.94117, 3.68928,
                             4.68559, 6, 7.71561, 9.92992))

# fit a second order polynomial
nls_wamp1 <- nls(formula = y ~ a * x ^ 2 + b * x + c,      # provide a nonlinear model formula including variables and parameters
                data = wampler2,                           # data frame in which to evaluate the variables in formula
                start = list(a = 0.5, b = 0.5, c = 0.5))   # a named list or named numeric vector of starting estimates of coefficients

summary(object = nls_wamp1)

# create the plot

png(filename = "nonlinear_poly2_wampler_v1.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 10,
    res = 300)

# create the points
with(data = wampler2, plot(x = x, y = y))

# add the fit line | here, we will use the "predict()" function
with(data = wampler2,
     points(x = x,
            y = predict(object = nls_wamp1),
            type = "l",
            col = "red"))

dev.off()


# 4.2) Use "fluxes" data to fit a second order polynomial: TN ~ water ####
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# fit a second order polynomial
nls_flux1 <- nls(formula = total_nitrogen_metric_tons ~ a * water_discharge_million_cubic_meters ^ 2 + b * water_discharge_million_cubic_meters + c,      # provide a nonlinear model formula including variables and parameters
                 data = fluxes,                           # data frame in which to evaluate the variables in formula
                 start = list(a = 0.5, b = 0.5, c = 0.5))   # a named list or named numeric vector of starting estimates of coefficients

summary(nls_flux1)

# create a plot
png(filename = "nonlinear_poly2_TN_water_v2.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 10,
    res = 300)

# create the points
with(data = fluxes, plot(x = water_discharge_million_cubic_meters, y = total_nitrogen_metric_tons))

# add the fit line | here, we will use the "predict()" function
with(data = fluxes,
     points(x = water_discharge_million_cubic_meters,
            y = predict(object = nls_flux1),
            type = "l",
            col = "red"))

dev.off()


# 4.3) Use "fluxes" data to fit an exponential function: ReP ~ water ####
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# fit an exponential function
nls_flux2 <- nls(formula = reactive_phosphorus_metric_tons ~ a1 * exp( -b1 * water_discharge_million_cubic_meters ),   # provide a nonlinear model formula including variables and parameters
                 data = fluxes,                             # data frame in which to evaluate the variables in formula
                 start = list(a1 = 200, b1 = 0.0002))   # a named list or named numeric vector of starting estimates of coefficients

# --- --- --- --- --- --- --- --- --- --- --- --- ---
# NOTE: try different initial values for a1 and b1
# --- --- --- --- --- --- --- --- --- --- --- --- ---

summary(nls_flux2)

# create a plot
png(filename = "nonlinear_expon_ReP_water_v1.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 10,
    res = 300)

# create the plot
with(data = fluxes, plot(x = water_discharge_million_cubic_meters, y = reactive_phosphorus_metric_tons))

# add the fit line | here, we will use the "predict()" function
with(data = fluxes,
     points(x = water_discharge_million_cubic_meters,
            y = predict(object = nls_flux2),
            type = "l",
            col = "red"))

dev.off()


# 4.4) Use "fluxes" data to fit an exponential function: TP ~ water ####
# --- --- --- --- --- --- --- --- --- --- --- --- ---

# fit an exponential function
nls_flux3 <- nls(formula = total_phosphorus_metric_tons ~ a1 * exp( -b1 * water_discharge_million_cubic_meters ),   # provide a nonlinear model formula including variables and parameters
                 data = fluxes,                             # data frame in which to evaluate the variables in formula
                 start = list(a1 = 200, b1 = 0.0003))   # a named list or named numeric vector of starting estimates of coefficients

summary(nls_flux3)


# create a plot
png(filename = "nonlinear_expon_TP_water_v1.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 10,
    res = 300)

# create the plot
with(data = fluxes, plot(x = water_discharge_million_cubic_meters, y = total_phosphorus_metric_tons))

# add the fit line | here, we will use the "predict()" function
with(data = fluxes,
     points(x = water_discharge_million_cubic_meters,
            y = predict(object = nls_flux3),
            type = "l",
            col = "red"))

dev.off()



# ****************************************************
# 5) Upload your script, word document with plots and curve fit summaries 
#       and "RData" file to canvas  !! ####
# ****************************************************
save.image("A05.RData")

