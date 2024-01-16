##### 0) Introduction ###############################################
# ****************************************************
# Date: 13DEC2023 
# Author:  Madison Hassler
# Subject: Exam support script
# Script/Code:  Exam
# version 
# add additional comments/details as you prefer

# it's always good to clear the memory before starting your work.
rm(list = ls())

# ****************************************************


# set the working folder - a good practice to save all related work in one place
#   Please make sure to follow/develop a reasonable naming convention for files

# setwd("LOCATION OF YOUR WORKING FOLDER")

setwd(dir = "/Users/madi/Documents/GitHub/BME-8180/Exam")

# 1) Load required packages ####
# ****************************************************
# --- you may need the following packages


require(matlib)  # to solve system of linear equations
require(ggplot2) # for creating plots
require(rgdal)   #
require(usmap)   # US maps

# I have created a section for each question.

# PLEASE include your codes/scripts in each section

# ****************************************************
# Q1) Creating maps !! ####
# ****************************************************

# the csv file "MO_weather_stations.csv" contains locations of
#   weather station locations within the state of Missouri
# create a map of the State of Missouri showing the locations.
# Your map should include (i) county boundaries,
#   (ii) locations of the weather stations and 
#   (iii) proper title and subtitle

db1 <- read.table(file = "MO_weather_stations.csv",
                  header = TRUE,
                  sep = ",")

db2 <- usmap_transform(
  data = db1,
  input_names = c("LON", "LAT"),
  output_names = c("x", "y"))
 
p1 <- plot_usmap(regions = "counties",
                 include = c("MO"),
                 labels = FALSE)

p1 <- p1 + 
  geom_point(data = db2, aes(x = x, y = y), 
            color = "red", size = 3) +
  labs(title = "State of Missouri",
       subtitle = "Locations of Weather Stations")

print (p1)

pdf(file = "Missouri.pdf",
    width = 6,          # units are in inches
    height = 4,
    paper = "letter")     # logical: if true (the default) allow multiple figures in one file.

print(p1)


dev.off()



# ****************************************************
# Q2) Create user-defined functions !! ####
# ****************************************************

# Equation 1
f1 <- function(x) {
  exp(-x/50) * cos(12 * x)
}

# Equation 2
f2 <- function(x) {
  x^3 * exp(-x)
}

# Equation 3
f3 <- function(x) {
  1.2 * (1/sqrt(x) - tanh(1.3 * sqrt(x)))
}

# Equation 4
f4 <- function(x) {
  8 * x^3 + x^2 + 8 * x - 3
}

# Define x values for each range
x_range_1 <- seq(0, 20, length.out = 100)
x_range_2 <- seq(0, 20, length.out = 100)
x_range_3 <- seq(0, 10, length.out = 100)
x_range_4 <- seq(-10, 10, length.out = 100)

# Create data frames for each range
data_1 <- data.frame(x = x_range_1, y = f1(x_range_1))
data_2 <- data.frame(x = x_range_2, y = f2(x_range_2))
data_3 <- data.frame(x = x_range_3, y = f3(x_range_3))
data_4 <- data.frame(x = x_range_4, y = f4(x_range_4))

# Plot the functions
plot_1 <- ggplot(data_1, aes(x, y)) +
  geom_line() +
  labs(title = "Equation 1", x = "x", y = "f(x)")

plot_2 <- ggplot(data_2, aes(x, y)) +
  geom_line() +
  labs(title = "Equation 2", x = "x", y = "f(x)")

plot_3 <- ggplot(data_3, aes(x, y)) +
  geom_line() +
  labs(title = "Equation 3", x = "x", y = "f(x)")

plot_4 <- ggplot(data_4, aes(x, y)) +
  geom_line() +
  labs(title = "Equation 4", x = "x", y = "f(x)")

# Print the plots
print(plot_1)
print(plot_2)
print(plot_3)
print(plot_4)

pdf(file = "Q2-curves.pdf",
    width = 6,          # units are in inches
    height = 4,
    paper = "letter",   # target paper size, here, we are using "letter" size
    onefile = TRUE)     # logical: if true (the default) allow multiple figures in one file.

print(plot_1)
print(plot_2)
print(plot_3)
print(plot_4)

dev.off()

# ****************************************************
# Q3) Solving nonlinear equations - Cannon problem ####
# ****************************************************

# Given values
v <- 5.2   # recoil velocity in m/s
x <- 0.2   # recoil distance in meters
omega <- 4.5   # natural frequency in rad/s


# A) Write the function in terms of time (t) by substituting values for v, x and ω.

# Recoil distance formula in terms of time (t)
recoil_function <- function(t) {
  v * exp(-omega * t) - x / t
}


# B) Create the graphical representation of the function in terms of t 
#      within the range of -1 and +5.
# Generate a sequence of time values
time_range <- seq(-1, 5, length.out = 100)

# Create a data frame for plotting
data_plot <- data.frame(time = time_range, recoil_distance = recoil_time(time_range))

# Plot the recoil distance as a function of time
curve <- ggplot(data_plot, aes(x = time, y = recoil_distance)) +
  geom_line(color = "blue", size = 1) +
  ggtitle("Recoil Distance vs Time") +
  xlab("Time (s)") +
  ylab("Recoil Distance (m)") +
  theme_minimal()



# C) C)	Find the time corresponding to the recoil distance of 0.2 m
# Use a numerical solver to find the root (time) for the given recoil distance
solution <- uniroot(function(t) recoil_time(t) - x, interval = c(-1, 5))

# Extract the time value from the solution
time_solution <- solution$root

# Print the result
cat("\nTime corresponding to the recoil distance of 0.2 m:", time_solution, "seconds\n")

pdf(file = "Q3-cannon-curve.pdf",
    width = 6,          # units are in inches
    height = 4,
    paper = "letter")     # logical: if true (the default) allow multiple figures in one file.

print(curve)


dev.off()


# ****************************************************
# Q4) Curve fitting: Density of Water as a Function of Temperature ####
# ****************************************************

# you ma use this, or create your own!!!
q4 <- data.frame(
  temperature = c(4, 10, 15, 20, 25, 30, 35, 40),
  density = c(999.972, 999.699, 999.100, 998.205, 997.045, 995.649, 994.033, 992.215)
)

# A) Create a dot plot and add a first-order polynomial fit (y ~ x) 
#        that can be used to predict density of water based on its temperature.
#        Your plot must include axes and main titles.
plot_a <- ggplot(q4, aes(x = temperature, y = density)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE, color = "blue") +
  ggtitle("Density of Water vs Temperature (First-order Polynomial Fit)") +
  xlab("Temperature (deg. C)") +
  ylab("Water Density (kg/m^3)")

print(plot_a)


# B) Create a dot plot and add a second order polynomial fit ( y ~ (x + x2) ) 
#        that can be used to predict density of water based on its temperature. 
#        Your plot must include axes and main titles.
plot_b <- ggplot(q4, aes(x = temperature, y = density)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ 1 + x + I(x ^ 2), se = FALSE, color = "red") +
  ggtitle("Density of Water vs Temperature (Second-order Polynomial Fit)") +
  xlab("Temperature (deg. C)") +
  ylab("Water Density (kg/m^3)")

# Print the plot
print(plot_b)


pdf(file = "Q4-curves.pdf",
    width = 6,          # units are in inches
    height = 4,
    paper = "letter",   # target paper size, here, we are using "letter" size
    onefile = TRUE)

print(plot_a)
print(plot_b)

dev.off()
# C) Which one of the fitted curved (A or B) would you recommend for predicting
#        the density of water, and why?

'''
Plot B, with the second-order polynomial fit, 
aligns more closely with the plot points and 
exhibits better visual alignment with the data, 
that is a strong indication of a good fit
'''


# ****************************************************
# Q5) Curve fitting: Rating curve ####
# ****************************************************

# you may use this !!!
db5 <- read.table(file = "gage_height_and_discharge_relationship.csv",
                  header = T, 
                  sep = ",")
colnames(db5) <- c("height", "discharge")


# A) Use the data to create a first order polynomial to predict
#      flow rate based on gage height.
model_1 <- lm(discharge ~ height, data = db5)

png(filename = "Q5_A.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 3,
    res = 300)

with(data = db5, plot(x = height, y = discharge, pch = 20))
with(data = db5,
     points(x = height,
            y = predict(object = model_1),
            type = "l",
            col = "red"))

dev.off()

# B) Use the data to create a second order polynomial to predict
#      flow rate based on gage height.
model_2 <- lm(discharge ~ poly(height, 2), data = db5)

png(filename = "Q5_B.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 3,
    res = 300)

with(data = db5, plot(x = height, y = discharge, pch = 20))
with(data = db5,
     points(x = height,
            y = predict(object = model_2),
            type = "l",
            col = "red"))

dev.off()

# C) Use the data to create a third order polynomial to predict
#      flow rate based on gage height.
model_3 <- lm(discharge ~ poly(height, 3), data = db5)

png(filename = "Q5_C.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 3,
    res = 300)

with(data = db5, plot(x = height, y = discharge, pch = 20))
with(data = db5,
     points(x = height,
            y = predict(object = model_3),
            type = "l",
            col = "red"))

dev.off()


# D) Predict the discharge rate at gage heights 4.5 ft, 5.5 ft and 6.5 ft 
#      using the functions developed in (A), (B) and (C). 
new_data <- data.frame(height = c(4.5, 5.5, 6.5))

predictions_1 <- predict(model_1, newdata = new_data)
predictions_2 <- predict(model_2, newdata = new_data)
predictions_3 <- predict(model_3, newdata = new_data)


predictions <- data.frame(
  Gage_Height = new_data$height,
  Model_1 = predictions_1,
  Model_2 = predictions_2,
  Model_3 = predictions_3
)

print(predictions)

# E) Which rating curve would you recommend to US Geological Survey, and why? 
#      Please include a table comparing the observation and predicted values.
observed_values <- c(15.63, 124.09, 360.49)

# Table comparing observation and predicted values
comparison_table <- data.frame(
  Gage_Height = predictions$Gage_Height,
  Observation = observed_values,
  Model_1 = predictions$Model_1,
  Model_2 = predictions$Model_2,
  Model_3 = predictions$Model_3
)

print(comparison_table)

'''
The second order and third order appear to give 
an equal effectiveness in predicting the data trend. 
Both appear to be a good fit and the predicted values 
are equally as close to the observed values
'''

# ****************************************************
# Q6) Solving system of linear equations ####
# ****************************************************




# ****************************************************
# Q7) Curve fitting: Atmospheric CO2 ####
# ****************************************************
co2_data <- read.table(file = "mona_loa_CO2_measurements.csv",
                  header = T, 
                  sep = ",")


# A) Create a line plot using the ggplot package to show the annual 
#       concentration of CO2 for the period 1963-2022. 
#       You plot must include proper axes and main plot titles.
png(filename = "Q7_A.png",
    width = 100,
    height = 100,
    units = "mm",
    pointsize = 3,
    res = 300)

Q7_A <- ggplot(data = co2_data, aes(x = year, y = mean)) +
  geom_line() +
  labs(title = "Annual Concentration of CO2 (1963-2022)",
       x = "Year",
       y = "CO2 Concentration (ppm)")
print(Q7_A)

dev.off()

# B) Fit a linear model to using the data for the period 1963-1982
model_1963_1982 <- lm(mean ~ year, 
        data = subset(co2_data, year >= 1963 & year <= 1982))


# B) Fit a linear model to using the data for the period 1963-1982
model_1963_1982 <- lm(mean ~ year, 
        data = subset(co2_data, year >= 1963 & year <= 1982))

# C) Fit a linear model to using the data for the period 1983-2002
model_1983_2002 <- lm(mean ~ year, 
        data = subset(co2_data, year >= 1983 & year <= 2002))

# D) Fit a linear model to using the data for the period 2003-2022
model_2003_2022 <- lm(mean ~ year, 
        data = subset(co2_data, year >= 2003 & year <= 2022))

# E) Fit a linear model to using the data for the period 1963-2022
model_1963_2022 <- lm(mean ~ year, data = co2_data)

# F) Fill out the table
table_data <- data.frame(
  Period = c("1963-1982", "1983-2002", "2003-2022", "1963-2022"),
  Mean_concentration = c(
    mean(co2_data$mean[co2_data$year >= 1963 & co2_data$year <= 1982]),
    mean(co2_data$mean[co2_data$year >= 1983 & co2_data$year <= 2002]),
    mean(co2_data$mean[co2_data$year >= 2003 & co2_data$year <= 2022]),
    mean(co2_data$mean)
  ),
  Slope_of_linear_trend = c(
    coef(model_1963_1982)[2],
    coef(model_1983_2002)[2],
    coef(model_2003_2022)[2],
    coef(model_1963_2022)[2]
  )
)

# Print the table
print(table_data)

# G) Describe the rate of change and discuss the results



# ****************************************************
# Upload your script, word document with answers,
#       PDFs of plots, and
#       the "RData" file with your submission  !! ####
# ****************************************************
save.image("Exam.RData")