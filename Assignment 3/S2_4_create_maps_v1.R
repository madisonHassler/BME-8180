
##### A) Introduction ###############################################
# Date: 
# Author:  
# Subject: 
# Script/Code:  
# version 
# add additional comments/details as you prefer

# clear the current work space
rm(list = ls())

# set the working folder - a good practice to save all related work in one place

mywkdr <- "C:/Users/aloysiusn/OneDrive - University of Missouri/courses/Numerical_Methods/MyWork_FS23"

setwd(dir = mywkdr)


#### 1) Load required packages ####

require(rgdal)       # Bindings for the 'Geospatial' Data Abstraction Library
require(usmap)       # US Maps Including Alaska and Hawaii
require(ggplot2)     # Create Elegant Data Visualisations Using the Grammar of Graphics


# if the packages are not installed, then, you will get an error message. 
# use the function "install.packages()" 
help("install.packages") 


#### 2) Create a few maps and add details ######################################

#### i) plot US map with state abbreviations
# --- --- --- --- --- --- --- --- --- --- --- ---

# instead displaying the plot/map in the Plots windows, 
#   we can assign it to a variable "p1"
#  this "plot" object will now appear in the R Global Environment

p1 <- plot_usmap(regions = "states", labels = FALSE)

# the print function will display the US map in the "Plots" window within the RStudio IDE
print(p1)

# We could also save the plot/map as an image file (JPG, PNG, PDF etc.,)
# review the following functions
help(png)
help(jpeg)
help(bmp)


#### ii) plot selected US states
# --- --- --- --- --- --- --- --- --- --- --- ---

# here, we are going to specify selected US states

p2 <- plot_usmap(regions = "states",
                 include = c("MO","KS","NE","IA","OK","AR"),
                 labels = TRUE)
# note that "labels = TRUE" will display the state abbreviations
print(p2)


#### iii) plot state of Missouri with county boundaries
# --- --- --- --- --- --- --- --- --- --- --- ---
p3 <- plot_usmap(regions = "counties",
                 include = "MO",
                 labels = FALSE)

print(p3)

#### iv) show locations of some landmarks; 
#         here, we are going to display selected cities
# --- --- --- --- --- --- --- --- --- --- --- ---

# first, get the locations
help("usmap_transform")

# We are creating a dataframe with three variable (recall from previous work)
# variable 1 == lon: longitude value in degree decimals (numeric)
# variable 2 == lat: latitude value in degree decimals (numeric)
# variable 1 == name: city name (character)

loc1 <- data.frame(lon = c(-94.676392, -93.297256, -91.948059),
                   lat = c(39.106667, 37.210388, 38.846668),
                   name = c("Kansas City", "Springfield", "Fulton"))
# need to convert the locations to the correct coordinate system that matches with the US map
help("usmap_transform")

loc1 <- usmap_transform(data = loc1)

# now create the plot

# first, we create the base map
p4 <- plot_usmap(regions = "counties",
                 include = "MO",
                 labels = FALSE)         # TRUE to show names

# then, add the city locations we just created
# note how the points are added to the existing plot "p4"
p4 <- p4 + 
  geom_point(data = loc1,
             aes(x = x, y = y,),
             color = "red", size = 8) +
  labs(title = "State of Missouri",
       subtitle = "Add subtitle",
       caption = "add caption")

print(p4)

#### 3) create/add more details - US earthquakes ############################### 

#### 3.1 let us use the earthquake data ####
# use "data" function to load existing datasets in the current session

data("earthquakes") # comes with the package "usmap"

# need to transform map coordinates
eq1 <- usmap_transform(earthquakes)
head(eq1)

# you will see something like this
#  lon       lat      mag  x        y
#1 -117.5340 35.65950 2.79 -1575319 -872719.7
#2 -118.3455 36.31783 3.10 -1632293 -785211.8
#3 -117.8822 36.15633 2.74 -1595342 -811799.8
#4 -124.8305 40.38883 2.77 -2065325 -197614.2


# use the function "str" to compactly display the internal structure of an R object, 
#    this is a diagnostic function and an alternative to summary
help(str)
str(eq1)

# here the variable "mag" refers to the magnitude of the earthquake on the Richter scale

# as we did previously, create the base map
p5 <- plot_usmap(regions = "states", labels = F)

# add earthquake locations and magnitudes
p5 <- p5 +
  # add the earthquake locations and magnitude 
  geom_point(data = eq1, aes(x = x, y = y, size = mag),
             color = "red",
             alpha = 0.2    # add transparency; fraction between 0 and 1
             ) +
  # add titles
  labs(title = "US Earthquakes",
       subtitle = "Source: USGS",
       size = "Magnitude") +
  theme(legend.position = "bottom")

print(p5)

