# ==========================================================
# CafeHub Loyalty Program Analysis
# Module 5 - Final Project
# ==========================================================

# ==========================================================
# Graded Challenge 1: Data Import & Cleaning
# ==========================================================
# Import both datasets into objects named customer_data and loyalty_data
customer_data <- read.csv("customer_data.csv", stringsAsFactors = FALSE)
loyalty_data  <- read.csv("loyalty_data.csv", stringsAsFactors = FALSE)

# Print data to verify import
print(customer_data)
print(loyalty_data)

# Check structure
str(customer_data)

# ==========================================================
# Graded Challenge 2: Customer Analysis
# ==========================================================
library(dplyr)

# Customers older than 30
Above_30 <- customer_data %>%
  filter(Age > 30)
print(Above_30)

# Female customers who bought Smoothies
df_filtered <- customer_data %>%
  filter(Gender == "Female" & Product == "Smoothies")
print(df_filtered)

# ==========================================================
# Graded Challenge 3: Loyalty Program Analysis
# ==========================================================
# Add Tier column directly to loyalty_data
loyalty_data <- loyalty_data %>%
  mutate(
    Tier = case_when(
      LoyaltyPoints >= 500 ~ "Gold",
      LoyaltyPoints >= 200 ~ "Silver",
      TRUE ~ "Bronze"
    )
  )
print(loyalty_data)

# ==========================================================
# Graded Challenge 4: Report Generation
# ==========================================================
# Save revised datasets
write.csv(customer_data, "revised_customer_data.csv", row.names = FALSE)
write.csv(loyalty_data,  "revised_loyalty_data.csv", row.names = FALSE)
