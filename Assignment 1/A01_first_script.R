
##### Introduction ###############################################
# Date:19SEP2023 
# Author: Madison Hassler
# Subject: BE 8180
# Script/Code: Matrix operations | how to organize scripts 
# version: 1

# add additional comments/details as you prefer
# it's always good to clear the memory before starting your work.
#  the command below will do that 

rm(list = ls())    # rm - remove

# if you are not sure about how to use a function use help("function name")

# set the working folder - a good practice to save all related work in one place
help(setwd)

setwd(dir = "/Users/madi/Documents/GitHub/BME-8180")

# example: this is how I have set up my working folder 
setwd(dir = "C:/Users/aloysiusn/OneDrive - University of Missouri/courses/Numerical_Methods/MyWork_FS23")


##### (I) Vector operations ###############################################

# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# please clearly identify the R functions you use for each question
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

# *** 1) create an integer vector with 300 elements starting 301

aa <- seq.int(length=300, from=301)
print(aa)



# *** 2) create a numeric vector of length 200 between values 500 and 550

bb <- seq(length=200, from=500, to=550)
print(bb)




# *** 3) create an integer vector of length 100 between 3000 and 10000 with increments of 15

#ignored the by 15 requirement as it was not possible
cc <- seq.int(length=100, from=3000, to=10000)
print(cc)



# *** 4) average height and standard deviation of a group of students at an elementary school
#           are 1.4 meters and 0.35 meters respectively
#        based on these values, generate a sample population of 300 students
#        state your assumptions

height <- rnorm(300, 1.4, 0.35)
print(height)

# assumptions:
# This is a normal distribution



# do some calculations

sum(height)
mean(height)
sd(height)
var(height)

# *** 5) calculate logarithmic value of vector created in (2) above based on
#          base (i) 10, (ii) 2 and (iii) exponent

log10 <- log10(bb)
log2 <- log2(bb)
log_exp <- log(bb)


print(log10)
print(log2)
print(log_exp)
 

##### (II) Matrix operations ###############################################

# *** 5) create a 10 by 15 matrix filled with 1s

matrix(1, nrow = 10, ncol = 15)


# *** 6) create FOUR numeric vectors of length 8, combine them to create a 4 by 8 matrix
#           and add the row and column names

vec1 <- c(1:8)
vec2 <- c(9:16)
vec3 <- c(17:24)
vec4 <- c(25:32)

matx <- rbind(vec1, vec2, vec3, vec4)

rownames(matx) <- c("R1", "R2", "R3", "R4")
colnames(matx) <- c("C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8")

print(matx)

##### (III) Data frames ###############################################

# Speed Endurance: 100-meter Sprint events of top athletes
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- 

#  The dataframe below shows the (i) reaction time (RT), and
#                               (ii) 10-meter segment splits of 
#  six sprinters who ran the 100-m dash in the finals (Olympic Games and World Championships)
#  data is available here: https://speedendurance.com/2008/08/22/usain-bolt-100m-10-meter-splits-and-speed-endurance/

# vector RT gives the reaction times

# The dataframe below contains data from the 100-meter dash final at the Olympic Games in Beijing in 2008 [8]. 
#    The times belong to the gold medal winner Usain Bolt and represent a world record of 9:69 seconds, 
#    which he lowered in 2009 to 9:58 seconds. The data are in the form of (time, distance) pairs, 
#    where distance is measured in meters, horizontally along the track from the starting line, 
#    and time is measured in seconds elapsed from the firing of the starting gun.
#    The initial (0:165;0) data point indicates that Bolt had a reaction time of 0:165 seconds after the gun
#    was fired before he started running and crossed the starting line.
# Credit: Differential Equations - A Toolbox for Modeling the World by Kurt Bryan (ISBN 978-1-63877-937-7, page 1)

# reaction times - athlet's response to the starting gunshot
RT <- c(0.132, 0.136, 0.162, 0.104, 0.150, 0.165)

# 10m segment split: 
# the first column "Position" refers to the 10m segment, and
#  the rest of the columns gives the time it took for each athlete to run the
#  respective 10m segment in seconds.
# for example, Ben took 1.83 seconds to run the first 10 meters
#              Tim took 0.88 seconds to run the last 10 meters

# full names of the athletes and the year they ran the sprints are:  
#   (i) Ben Johnson (1988), (ii) Carl Lewis (1988), (iii) Maurice (Mo) Greent,
#  (iv)  Tim Montgomery (2002) and (v) Asafa Powell (2005), and (vi) Usain Bolt (2008)

dash100m <- data.frame(Position = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                       Ben      = c(1.83,1.04,0.93,0.86,0.84,0.83,0.84,0.85,0.87,0.90),
                       Carl     = c(1.89,1.07,0.94,0.89,0.86,0.83,0.85,0.85,0.86,0.88),
                       Mo       = c(1.86,1.03,0.92,0.88,0.88,0.83,0.83,0.86,0.85,0.85),
                       Tim      = c(1.89,1.03,0.91,0.87,0.84,0.83,0.84,0.84,0.85,0.88),
                       Asafa    = c(1.89,1.02,0.92,0.86,0.85,0.85,0.84,0.84,0.85,0.85),
                       Bolt     = c(1.85,1.02,0.91,0.87,0.85,0.82,0.82,0.82,0.83,0.90))

print(dash100m)
# *** 7) create a matrix with the following information for all six sprinters
#         (i)    average time each athlete took for the first 40 meters
#         (ii)   average time each athlete took for their 50m-90m
#         (iii)  average speed of each athlete in (i)
#         (iv)   average speed of each athlete in (ii)

# **** your matrix should include names of columns and rows as appropriate


# (i)
ben_4 <- mean(dash100m[1:4, 2])
carl_4 <- mean(dash100m[1:4, 3])
mo_4 <- mean(dash100m[1:4, 4])
tim_4 <- mean(dash100m[1:4, 5])
asafa_4 <- mean(dash100m[1:4, 6])
bolt_4 <- mean(dash100m[1:4, 7])

# (ii)
ben_5_9 <- mean(dash100m[5:9, 2])
carl_5_9 <- mean(dash100m[5:9, 3])
mo_5_9 <- mean(dash100m[5:9, 4])
tim_5_9 <- mean(dash100m[5:9, 5])
asafa_5_9 <- mean(dash100m[5:9, 6])
bolt_5_9 <- mean(dash100m[5:9, 7])


time_40 <- cbind(ben_4, carl_4, mo_4, tim_4, asafa_4, bolt_4)
time50_90 <- cbind(ben_5_9, carl_5_9, mo_5_9, tim_5_9, asafa_5_9, bolt_5_9)
speed_40 <- 40 / time_40   # (iii)
speed50_90 <- 40 / time50_90   # (iv)
matrix <- rbind(time_40, time50_90, speed_40, speed50_90)
rownames(matrix) <- c("Avg Time 40m", "Avg Time 50-90m", "Avg Speed 40m", "Avg speed 50-90m")
colnames(matrix) <- c("Ben", "Carl", "Mo", "Tim", "Adafa", "Bolt")
print(matrix)


# *** 8) create another matrix with the following quantities
#          (i)   the mean and standard deviation of reaction time
#          (ii)  the mean and standard deviation each athlete took to run their first 10 meters
#          (iii) the mean and standard deviation each athlete took to run last 10 meters

# **** your matrix should include names of columns and rows as appropriate

# (i)
mean_rt <- mean(RT)
sd_rt <- sd(RT)

# (ii)
ben_1 <- dash100m[1, 2]
carl_1 <- dash100m[1, 3]
mo_1 <- dash100m[1, 4]
tim_1 <- dash100m[1, 5]
asafa_1 <- dash100m[1, 6]
bolt_1 <- dash100m[1, 7]

time_1 <- cbind(ben_1, carl_1, mo_1, tim_1, asafa_1, bolt_1)


time_1_mean <- mean(time_1)
time_1_sd <- sd(time_1)



#(iii)
ben_10 <- dash100m[10, 2]
carl_10 <- dash100m[10, 3]
mo_10 <- dash100m[10, 4]
tim_10 <- dash100m[10, 5]
asafa_10 <- dash100m[10, 6]
bolt_10 <- dash100m[10, 7]

time_10 <- cbind(ben_10, carl_10, mo_10, tim_10, asafa_10, bolt_10)

time_10_mean <- mean(time_10)
time_10_sd <- sd(time_10)



meancol <- rbind(mean_rt, time_1_mean, time_10_mean)
sdcol <- rbind(sd_rt, time_1_sd, time_10_sd)

man_sd_mat <- cbind(meancol, sdcol)

rownames(man_sd_mat) <- c("RT", "First 10", "Last 10")
colnames(man_sd_mat) <- c("Mean", "SD")
print(man_sd_mat)


# *** 9) if the reaction time (RT) is ignored, What is the average speed of each athlete?
ben_sp <- 100/sum(dash100m[1:10, 2])
carl_sp <- 100/sum(dash100m[1:10, 3])
mo_sp <- 100/sum(dash100m[1:10, 4])
tim_sp <- 100/sum(dash100m[1:10, 5])
asafa_sp <- 100/sum(dash100m[1:10, 6])
bolt_sp <- 100/sum(dash100m[1:10, 7])

tot_sp <- cbind(ben_sp, carl_sp, mo_sp, tim_sp, asafa_sp, bolt_sp)
colnames(tot_sp) <- c("Ben", "Carl", "Mo", "Tim", "Adafa", "Bolt")
rownames(tot_sp) <- c("Avg Spd")

print(tot_sp)

# *** 10) if the reaction time (RT) is NOT ignored, What is the average speed of each athlete?
ben_sp <- 100/sum(dash100m[1:10, 2], RT[1])
carl_sp <- 100/sum(dash100m[1:10, 3], RT[2])
mo_sp <- 100/sum(dash100m[1:10, 4], RT[3])
tim_sp <- 100/sum(dash100m[1:10, 5], RT[4])
asafa_sp <- 100/sum(dash100m[1:10, 6], RT[5])
bolt_sp <- 100/sum(dash100m[1:10, 7], RT[6])

RT_tot_sp <- cbind(ben_sp, carl_sp, mo_sp, tim_sp, asafa_sp, bolt_sp)
colnames(RT_tot_sp) <- c("Ben", "Carl", "Mo", "Tim", "Adafa", "Bolt")
rownames(RT_tot_sp) <- c("Avg Spd w/ RT")

print(RT_tot_sp)

##### (IV) Save your work ###############################################

# **** save your workspace using the function save.image()
save.image("A01.RData")

# **** You must upload the following:
#     (i) updated R script 
#    (ii) Workspace to Canvas

