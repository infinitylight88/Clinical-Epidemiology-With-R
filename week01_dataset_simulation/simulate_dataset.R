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
# --- Sex Variable ---
# 1. Define the possible outcomes
sex_options <- c("Male", "Female")

# 2. Sample from options n times with a 50/50 probability
# replace = TRUE allows "Male" or "Female" to be picked more than once
raw_sex <- sample(sex_options, size = n, replace = TRUE, prob = c(0.5, 0.5))

# 3. Convert to a factor (essential for statistical modeling in R)
sex <- factor(raw_sex)

# --- Validation ---
table(sex)  # Shows counts of each
str(sex)    # Shows the internal structure (Factor w/ 2 levels)
# --- BMI Variable (Biological Relationship) ---
# We assume a base BMI of 20, then add 0.1 for every year of age
# plus some random variation (noise) so everyone isn't a perfect line
bmi_mean <- 20 + (0.1 * final_ages)

# Generate BMI using the age-dependent mean
# n is already defined as 500
bmi <- rnorm(n, mean = bmi_mean, sd = 3)

# Round to 1 decimal place (standard for clinical data)
bmi <- round(bmi, 1)

# --- Validation ---
summary(bmi)
# Correlation check: Should be positive (~0.3 to 0.5)
cor(final_ages, bmi) 

# Visualize the relationship
plot(final_ages, bmi, 
     main="Relationship between Age and BMI",
     xlab="Age", ylab="BMI", 
     col="steelblue", pch=16)

