
##### A) Introduction ###############################################
# Date: 22OCT2023 
# Author:  Madison Hassler
# Subject: BE 8180
# Script/Code:  maps
# version 1


# clear the current work space
rm(list = ls())

# set the working folder - a good practice to save all related work in one place

setwd(dir = "/Users/madi/Documents/GitHub/BME-8180/Assignment 3")


#### 1) Load required packages ####

require(rgdal)       # Bindings for the 'Geospatial' Data Abstraction Library
require(usmap)       # US Maps Including Alaska and Hawaii
require(ggplot2)     # Create Elegant Data Visualisations Using the Grammar of Graphics

#### 2) Create Maps - A ########################################################

# follow the examples in "S2_4_create_maps_v1.R" to create the following maps

#### 2.1) Select 10 US states of your choice and create a map ######

# Your map must include 
#  i) state abbreviations
# ii) title

p1 <- plot_usmap(regions = "states",
                 include = c("MO","IL","KS","NE","IA","OK","AR","KY","TN","IN"),
                 labels = TRUE,) +
                 labs(title = "10 US States")

print(p1)

#### 2.2) Use the same 10 US states and add 5 landmarks of your choice #########

# follow the example Section 2) (iv) in "S2_4_create_maps_v1.R"

# Your map must include 
#   i) state abbreviations
#  ii) title
# iii) sub title
#  iv) caption

loc1 <- data.frame(lon = c(-92.172935, -89.654961, -95.677956, -92.288986, -93.603729),
                   lat = c(38.579201, 39.798363, 39.048191, 34.746613, 41.591087),
                   name = c("Jefferson City", "Springfield", "Topeka", "Little Rock", "Des Moines"))
loc1 <- usmap_transform(data = loc1)

p2 <- p1 +
  geom_point(data = loc1,
             aes(x = x, y = y,),
             color = "red", size = 8) +
  labs(title = "10 US States",
       subtitle = "State Capitals",
       caption = "Red = State Capital")

print(p2)

#### 2.3) use the US city population data to create another map ################

# the city population data comes with the package "usmap"
data("citypop") 

head(citypop)
# dataset provides details about the most populous cities in each state
# Now, as we did with the Earthquake data, we need to transform map coordinates

# here are the steps to produce the map with city poulation
# (i) first, transform map coordinates as we did in "S2_4_create_maps_v1.R"
cp1 <- usmap_transform(citypop)
head(cp1)

# (ii) as we did earlier, create the base map
p3 <- plot_usmap(regions = "states", labels = F)

# (iii) add city population data 


# Your map must include 
#   i) state abbreviations
#  ii) title
# iii) sub title
#  iv) caption

p3 <- p3 +
  geom_point(data = cp1, aes(x = x, y = y, size = city_pop),
             color = "red",
             alpha = 0.3    # add transparency; fraction between 0 and 1
             ) +
  labs(title = "US City Population",
       subtitle = "Source: Census",
       caption = "The most populous city in each US state, as of the 2010 US Census.",
       size = "Population") +
  theme(legend.position = "bottom")

print(p3)

#### 3) Create a single PDF file with all the plots ############################

# review at the Global Environment window...
# So far, we have created THREE plots/maps
# here, we will learn how to create a single PDF with all the maps

help(pdf)

pdf(file = "usmap_allplots.pdf",
    width = 6,          # units are in inches
    height = 4,
    paper = "letter",   # target paper size, here, we are using "letter" size
    onefile = TRUE)     # logical: if true (the default) allow multiple figures in one file.

# assuming you named the plots p1, p2 and p3
print(p1)
print(p2)
print(p3)

dev.off()


##### 4) Save your work ########################################################

# **** save your work using the function save.image()
# **** upload your script and the workspace to Canvas

# upload th following to Canvas

# 1) R script
# 2) .RData image file
save.image("A03-2.RData")
# 3) a PDF file containing all the maps. You are free to add additional maps of you choice.

# remove all objects in the current session
rm(list = ls())

# Once you complete all your work, you can quit the current session using the option below
#quit("no")

