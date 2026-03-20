# --- Parameters ---
n <- 500  # Change this one value to update the entire dataset

# --- ID Generation ---
# Using %03d works for 500, but %0.0f or dynamic padding is safer for large N
patient_id <- sprintf("p%0*d", nchar(n), 1:n)

# Quick validation
length(patient_id)
head(patient_id)

# --- Age Simulation ---
# 1. Generate the random normal values using n
raw_ages <- rnorm(n, mean = 50, sd = 10)

# 2. Round to the nearest whole number
rounded_ages <- round(raw_ages)

# 3. Constrain to the hard range 20-80
final_ages <- pmin(pmax(rounded_ages, 20), 80)

# --- Verification ---
mean(final_ages)
range(final_ages)

