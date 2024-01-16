
rm(list = ls())

# ****************************************************
# 1) Curve fitting ####
# ****************************************************

# values of river depth and discharge measurements for 
#   a location are given in the dataframe below

db1 <- data.frame(x = c(0.5, 0.7, 1.0, 1.1, 1.4, 1.5, 1.7, 2.0),
                  y = c(0.42, 1.74, 8.22, 12.45, 35.66, 48.19, 83.11, 168.46))

# x <- height in meters
# y <- discharge in cubic meters per second (m3/s)

# A) create a polynomial fit
# ***************************************
#        create second order polynomial fit model using "lm()"
Q_poly2 <- lm(formula = y ~ 1 + x + I(x ^ 2),
              data = db1)

# OR

Q_poly2 <- lm(formula = y ~ poly(x = x, degree = 2, raw = TRUE),
              data = db1)

# summary of the fit, goodness of fit measures are shown here
summary(object = Q_poly2)


# B) create a polynomial fit
# ***************************************
#        create third order polynomial fit model using "lm()"
Q_poly3 <- lm(formula = y ~ 1 + x + I(x ^ 2) + I(x ^ 3),
              data = db1)

# OR

Q_poly3 <- lm(formula = y ~ poly(x = x, degree = 3, raw = TRUE),
              data = db1)

# summary of the fit, goodness of fit measures are shown here
summary(object = Q_poly3)

# ****************************************************
# 2) creata plot showing the data and the plot ####
# ****************************************************
# 

with(data = db1, plot(x = x,
                      y = y,
                      pch = 16,    # try values between 1 and 18
                      col = "blue")
     )

# add the fit line | here, we will use the "predict()" function
with(data = db1,
     points(x = x,
            y = predict(object = Q_poly2),
            type = "l",
            col = "red",
            lwd = 1.5))


# add the fit line | here, we will use the "predict()" function
with(data = db1,
     points(x = x,
            y = predict(object = Q_poly3),
            type = "l",
            col = "darkgreen",
            lwd = 1.5))



# in this example, the third order polynomial is a better fit!!!