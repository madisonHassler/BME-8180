


# Load the necessary library for data manipulation
library(dplyr)

# Load your dataset
data <- read.csv("Sanborn-annual-precipitation-2000-2021.csv")  # Replace "your_data_file.csv" with the actual file path

# Calculate the statistics
mean_precipitation <- mean(data$Precipitation)
median_precipitation <- median(data$Precipitation)
std_deviation <- sd(data$Precipitation)
percentiles <- quantile(data$Precipitation, probs = c(0.05, 0.25, 0.75, 0.90, 0.95))

# Print the results
cat("Mean Precipitation:", mean_precipitation, "mm/year\n")
cat("Median Precipitation:", median_precipitation, "mm/year\n")
cat("Standard Deviation:", std_deviation, "mm/year\n")
cat("5th Percentile:", percentiles[1], "mm/year\n")
cat("25th Percentile:", percentiles[2], "mm/year\n")
cat("75th Percentile:", percentiles[3], "mm/year\n")
cat("90th Percentile:", percentiles[4], "mm/year\n")
cat("95th Percentile:", percentiles[5], "mm/year\n")

