# Question 1 #
#mean
aa <- c(9.5, 2.5, 50, 36, 15.5, 25, 40, 21, 9.5, 11)
bb <- c(0.65, 0.75, 0.96, 0.76, 0.46, 0.75, 0.96, 0.42, 0.25, 0.54, 0.32, 0.19)

sum(aa)/length(aa)
sum(bb)/length(bb)


mean(aa)
mean(bb)

# Question 2 #
# variance
x <- sum((aa-mean(aa))^2)/(length(aa)-1)  #Question 4 formula
y <- sum((bb-mean(bb))^2)/(length(bb)-1)

var(aa)
var(bb)

# Question 3 #
# standard deviation is the square root of the variance
sqrt(sum((aa-mean(aa))^2)/(length(aa)-1))  # Question 5 formula
sqrt(sum((bb-mean(bb))^2)/(length(bb)-1))

sqrt(x)
sqrt(y)

sd(aa)
sd(bb)


# Question 6 #
# index subscription select elements 5 to 10
cc <- c (4.45, 5.6, 5.29, 5.16, 5.34, 5.51, 5.51, 5.04, 3.85, 4.7, 4.88, 4.4, 4.88, 4.23, 5.66, 4.78, 4.57, 4.92, 5.11,5.34)


cc[5:10]


# Question 7 #
# index subscription select elements 4,11,12,15 and 17
cc[c(4, 11, 12, 15, 17)]


# Question 8 #
# index subscription to exclude elements 15 to 20
cc[-(15:20)]



# Question 9 #
# index expression to assign all element values less than 4.5 to NA
cc[cc < 4.5] <- NA
print(cc)



# Question 10 #
# compute the sum of all element values in Question 9
cc[is.na(cc)] <- 0
print(cc)
sum(cc)



# Question 11 #
# length of the vector a1
a1 <- numeric()
length(a1)


# Question 12 #
# length of the vector a1 if a new element is added
a1[20] <- 500
print(a1)
length(a1)

# Question 13 #
# length of the vector a1 if another new element is added

a1[200] <- 150
length(a1)


# Question 15 #
# unique state IDs
STATE_ID <- c ("IN", "CO", "MN", "IA", "AL", "AL", "KS", "KS", "IN", "KY", "IN", "KY", "NE", 
                "MO", "CO", "IN", "KS", "MN", "AR", "MO", "IN", "MN", "MO", "AR", "KY", "KY", 
                "NE", "AL", "IA", "CO", "MO", "KS", "IA", "IA", "NE", "MN", "MO", "CO", "AL", "NE")
WAGE <- c(94250, 77500, 97830, 95580, 108770, 80610, 83920, 91030, 86020, 89320,
                      97060, 99910, 90340, 98230, 110310, 89850, 95370, 95320, 86490, 79430,
                      94530, 95930, 69330, 98070, 86270, 86220, 85580, 92490, 90290, 103730,
                      85490, 96700, 73730, 103880, 99460, 114890, 91950, 101720, 96920, 96700)

unique(STATE_ID)

state <- factor(STATE_ID)
levels(state)

levels(STATE_ID)

# Question 16 #
# average wage

mean(WAGE)


# Question 17 #
# average income of engineers in each state.

tapply(WAGE, STATE_ID, mean)



# Question 18 #
# standard deviation of income of engineers
stDv <- function(x) sqrt(sum((x-mean(x))^2)/(length(x)-1))

tapply(WAGE, STATE_ID, stDv)


tapply(WAGE, STATE_ID, sd)



# Question 20 #
# highest salary 
max_wage_index <- which.max(WAGE)

# Get the corresponding state abbreviation
state_with_highest_salary <- STATE_ID[max_wage_index]

# Print the state with the highest salary
print(state_with_highest_salary)



# Question 21 #

data <- data.frame(STATE_ID, WAGE)

# Calculate the standard deviation of wages for each state
standard_deviations <- aggregate(WAGE ~ STATE_ID, data, sd)

# Find the state with the largest standard deviation using which.max()
state_with_largest_variability <- standard_deviations$STATE_ID[which.max(standard_deviations$WAGE)]

# Print the state with the largest variability
print(state_with_largest_variability)


# Question 22 #
# Create a data frame with STATE_ID and WAGE
data <- data.frame(STATE_ID, WAGE)

# Calculate the standard deviation of wages for each state
standard_deviations <- aggregate(WAGE ~ STATE_ID, data, sd)

# Find the state with the smallest standard deviation using which.min()
state_with_smallest_variability <- standard_deviations$STATE_ID[which.min(standard_deviations$WAGE)]

# Print the state with the smallest variability
print(state_with_smallest_variability)


average_wage <- mean(WAGE)

# Round the average wage to the nearest 1000
rounded_average_wage <- round(average_wage, -3)

# Print the rounded average wage
print(rounded_average_wage)