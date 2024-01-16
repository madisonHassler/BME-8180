
##### A) Introduction ###############################################
# Date: 
# Author:  
# Subject: 
# Script/Code:  ggplot resources
# version 
# add additional comments/details as you prefer

# it's always good to clear the memory before starting your work.
#  the command below will do that 
rm(list = ls())

# set the working folder - a good practice to save all related work in one place

setwd(dir = "C:/Users/aloysiusn/OneDrive - University of Missouri/courses/Numerical_Methods/MyWork_FS23")


#### 1) Load required packages #################################################

# we will be using the package "ggplot2" for creating plots

require(ggplot2) 

# if the packages are not installed, then, you will get an error message. 
# use the function "install.packages()" 
help("install.packages") 
# This has to be done ONLY once.

# there are several arguments that can be passed/included here.
# However, the key argument is "pkgs" - character vector of the names of packages 
#        whose current versions should be downloaded from the repositories.

#install.packages(pkgs = "ggplot2")


#### 2) Read data stored in a text file (.txt, .csv etc.,) #####################

# ***********************************************************************************
# please download the file named "fluxes_at_watershed_outlet_example.csv" from 
#  the course Canvas site... \Files\05_data\
# ***********************************************************************************

# the simplest and generic function to read a text file is "read.table()"
help("read.table")
# examine the contents in the help window

# The dataset provides the estimated fluxes from a river draining into a Lake
#    in Central Northeast US.
# The file is a Comma Delimited text file. You should be able to open and 
#   review the contents using any text editors or MS Excel

#   the variables are 
#   Column 1: Year
#   Column 2: water_discharge_million_cubic_meters
#   Column 3: total_phosphorus_metric_tons
#   Column 4: reactive_phosphorus_metric_tons
#   Column 5: total_nitrogen_metric_tons
# there is also a readme file that you can refer for more details

# let us read the contents of the file into dataframe "db1"

db1 <- read.table(file = "fluxes_at_watershed_outlet_example_FS2022.csv",
                  header = TRUE,
                  sep = ",")
head(db1)   # Return the First or (tail) Last Parts of an Object
str(db1)    # Compactly display the internal structure of an R object.

# review the column names and change, if you prefer
colnames(db1)

# ******************************************************************************
# here, I want to replace the column names as follows
# ******************************************************************************

colnames(db1) <- c("Year", "Water_MCM", "TPhos_tons", "RPhos_tons", "TNitro_tons")

# this is a dataframe with 33 rows and 5 columns

#### 3) Create a scatter plot using ggplot #####################

# Note, here onward, we will be using ggplot to create our visuals

# first step, create an empty space to add plot objects
p1 <- ggplot(data = db1)

# now, add the plot using "geom_point()"
help("geom_point")

p1 <- p1 +
  geom_point( aes(x = Water_MCM,
                  y = TPhos_tons))


# we will include more details to the plot by adding additional "layers"
p1 <- p1 +
  labs(title = "Water and Pollution Runoff",
       x = "Water flux (Million cubic meters)",
       y = "Total Phosphorus runoff (Metric tons)")

# display the plot in the "Plots" window
print(p1)

#### 4) Scatter plot 2 - add best fit line / linear fit ########################

p2 <- ggplot(data = db1,
             aes(x = Water_MCM, y = RPhos_tons)) +
  geom_point(  ) +                                            # create scatter plot
  geom_smooth( method = "lm",
               se = TRUE,
               level = 0.95) +      # "level = 0.95" & "se = TRUE" add 95th per. confidence limit
  labs(title = "Water and Pollution Runoff",
       x = "Water flux (Million cubic meters)",
       y = "Total Phosphorus runoff (Metric tons)") +
  theme_bw()

print(p2)

# NOTE:  i) once you include "ggplot( data = db1 )", rest of the plot objects
#              use variables from "db1"
#       ii) objects are added in the order they are created.

#### 5) Create a line plot #####################################################


p3 <- ggplot(data = db1,
             aes(x = Year, y = Water_MCM)) +
  geom_line() +                                 # create a line plot
  geom_point() +                                # overlay the points as well
  labs(title = "Annual total Water Runoff") +
  xlab("Year") +
  ylab("Water Flux (Million cu. meters)") +
  theme_bw()

print(p3)

#### 6) Save the plot as a JPEG image  #########################################

help(jpeg)

# Let us save the file as a JPEG image
jpeg(filename = "annual_water_flux_p1.png")

print(p3)

dev.off()  # shuts down the current active display device in the current session


# we can actually make this a bit better by passing additional arguments
jpeg(filename = "annual_water_flux_p1.jpg",     # file name
     width = 5,                                 # width in inches,  
     height = 2.5,                              # height in inches
     units = "in",                              # unit in which height and width are given
     res = 300,                                 # image resolution in pixels per inch (ppi)
     pointsize = 12,                            # default point size of plotted text
     bg = "white")                              # background color

print(p3)

dev.off()  # shuts down the current active display device in the current session
