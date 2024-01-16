
rm(list = ls())

setwd(dir = "WORKING FOLDER LOCATION HERE!!!")

#### 1) Load required packages ####

require(usmap)       # US Maps Including Alaska and Hawaii
require(ggplot2)     # Create Elegant Data Visualisations Using the Grammar of Graphics

#### 2) Create a few maps and add details ######################################

# read data file

# this example file has the locations of several state parks in Minnesota

db1 <- read.table(file = "minnesota_state_parks.csv",
                  header = T,
                  sep = ",")

db2 <- usmap_transform(data = db1)


#### 2) Create a few maps and add details ######################################

# (a) we create the base map
p1 <- plot_usmap(regions = "counties",
                 include = "MN",
                 labels = FALSE)         # TRUE to show names

# (b) add the park locations

p1 <- p1 + 
  geom_point(data = db2,
             aes(x = x, y = y,),
             color = "red", size = 8) +
  labs(title = "State of Minnesota",
       subtitle = "Add subtitle",
       caption = "add caption")

print(p1)
