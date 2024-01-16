
##### A) Introduction ###############################################
# Date: 22OCT2023 
# Author:  Madison Hassler
# Subject: BE 8180
# Script/Code:  ggplot resources
# version: 1

# it's always good to clear the memory before starting your work.
#  the command below will do that 
rm(list = ls())

# set the working folder - a good practice to save all related work in one place


setwd(dir = "/Users/madi/Documents/GitHub/BME-8180/Assignment 3")

#### 1) Load required packages #################################################

# we will be using the package "ggplot2" for creating plots

require(ggplot2)


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
require("xlsx")

db1 <- read.xlsx(file = "fluxes_at_watershed_outlet_example.xlsx", sheetIndex = "fluxes", header=TRUE)

db1 <- read.table(file = "fluxes_at_watershed_outlet_example_FS2022.csv",
                  header = TRUE,
                  sep = ",")
head(db1)   # Return the First or (tail) Last Parts of an Object
str(db1)    # Compactly display the internal structure of an R object.

# review the column names and change, if you prefer
colnames(db1)

# ******************************************************************************
# here, we will replace the column names as follows
# ******************************************************************************

colnames(db1) <- c("Year", "Water_MCM", "TPhos_tons", "RPhos_tons", "TNitro_tons")

# this is a dataframe with 33 rows and 5 columns

#### 3) Create a scatter plot using ggplot #####################################

## Plot 1: Water v. Total Phosphorus flux
## --- --- --- --- --- --- --- --- --- --- --- --

p1 <- ggplot(data = db1,
             aes(x = Water_MCM, y = RPhos_tons)) +
  geom_point(  ) +                                            # create scatter plot
  labs(title = "Water and Phosphorous Runoff",
       x = "Water flux (Million cubic meters)",
       y = "Total Phosphorus runoff (Metric tons)") +
  theme_bw()

print(p1)

## Plot 2: Water v. Total Nitrogen Flux
## --- --- --- --- --- --- --- --- --- --- --- --

p2 <- ggplot(data = db1,
             aes(x = Water_MCM, y = TNitro_tons)) +
  geom_point(  ) +                                            # create scatter plot
  labs(title = "Water and Nitrogen Runoff",
       x = "Water flux (Million cubic meters)",
       y = "Total Nitrogen runoff (Metric tons)") +
  theme_bw()

print(p2)

## Plot 3: Total Phosphorus v. Reactive Phosphorus Flux
## --- --- --- --- --- --- --- --- --- --- --- --

p3 <- ggplot(data = db1,
             aes(x = TPhos_tons, y = RPhos_tons)) +
  geom_point(  ) +                                            # create scatter plot
  labs(title = "Phosphorous and Reactive Phosphorous Flux",
       x = "Total Phosphorus (Metric tons)",
       y = "Reactive Phosphorus Flux(Metric tons)") +
  theme_bw()

print(p3)


#### 5) Save the three plots in Section 4 as JPEG or PNG #######################

help(jpeg)
help(png)

# Plot 1

jpeg(filename = "p1.jpg",     # file name
     width = 5,                                 # width in inches,  
     height = 2.5,                              # height in inches
     units = "in",                              # unit in which height and width are given
     res = 300,                                 # image resolution in pixels per inch (ppi)
     pointsize = 12,                            # default point size of plotted text
     bg = "white")                              # background color

print(p1)

dev.off()

# Plot 2

jpeg(filename = "p2.jpg",     # file name
     width = 5,                                 # width in inches,  
     height = 2.5,                              # height in inches
     units = "in",                              # unit in which height and width are given
     res = 300,                                 # image resolution in pixels per inch (ppi)
     pointsize = 12,                            # default point size of plotted text
     bg = "white")                              # background color

print(p2)

dev.off()

# Plot 3

jpeg(filename = "p3.jpg",     # file name
     width = 5,                                 # width in inches,  
     height = 2.5,                              # height in inches
     units = "in",                              # unit in which height and width are given
     res = 300,                                 # image resolution in pixels per inch (ppi)
     pointsize = 12,                            # default point size of plotted text
     bg = "white")                              # background color

print(p3)

dev.off()


#### 6) Save your work  ########################################################

# i) save your R session work using save.image()
save.image("A03.RData")


# ii) save your updated R script

# iii) your submission include i), ii) and the three plots in Section 5

