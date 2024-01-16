
##### Introduction ###############################################
# Date: 
# Author:  
# Subject: 
# Script/Code: Read data from files
# version 
# add additional comments/details as you prefer

# clear current session / remove objects from current R session
rm(list = ls())    # rm - remove

# if you are not sure about how to use a function use help("function name")

# set the working folder 
#    - a good practice to save all related work in one place
help(setwd)

setwd(dir = "")

# example: this is how I have set up my working folder 
setwd(dir = "C:/Users/aloysiusn/OneDrive - University of Missouri/courses/Numerical_Methods/MyWork_FS23")


##### (I) Read dopamine trace data #############################################

# the data from the file "dopamine_trace.csv" are read and stored in df1
# open the file in Excel or a text editor (e.g., Notepad) and examine first.

df1 <- read.table(file = "dopamine_trace.csv",
                  header = TRUE,
                  sep = ",")

##### (II) Read EP data ########################################################

# the data from the file "epdata.csv" are read and stored in df2
# open the file in Excel or a text editor (e.g., Notepad) and examine first.

df2 <- read.table(file = "epdata.csv",
                  header = TRUE,
                  sep = ",")

##### (III) Read watershed fluxes data #########################################

# the data from the file "fluxes_at_watershed_outlet_example.csv" are read
#    and stored in df3
# open the file in Excel or a text editor (e.g., Notepad) and examine first.

df3 <- read.table(file = "fluxes_at_watershed_outlet_example.csv",
                  header = TRUE,
                  sep = ",")

