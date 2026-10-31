# =============================================================================
# Determinants of Life Satisfaction — SOEP Panel Data
# Author: Muhammad Arhum Butt
# Original course project analysis (see README for known limitations)
# =============================================================================

library(tidyverse)
library(haven)

# Load dataset (SOEP data is licensed and not included in this repository)
pl_small <- read_dta("data/pl_small.dta")

# Convert labelled variables to numeric to avoid warnings
pl_small <- pl_small %>%
  mutate(across(everything(), ~as.numeric(.)))

# Rename columns for clarity
pl_small <- pl_small %>%
  select(
    syear,
    happiness          = plh0182,
    blood_donation     = plh0131_v1,
    german_citizenship = plj0014_v3,
    citizenship        = plj0014_v2,
    employment_status  = plb0037_h,
    month_married      = pld0135,
    divorce_status     = pld0140,
    health_status      = ple0008
  )

# Summary statistics for the selected variables
summary(pl_small)

# Histogram of happiness
ggplot(pl_small, aes(x = happiness)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "white") +
  labs(title = "Distribution of Happiness", x = "Happiness", y = "Frequency")

# Scatter plot of happiness vs health status
ggplot(pl_small, aes(x = health_status, y = happiness)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", color = "green") +
  labs(title = "Relationship between Health Status and Happiness",
       x = "Health Status", y = "Happiness")

# Boxplot of happiness by employment status
ggplot(pl_small, aes(x = factor(employment_status), y = happiness)) +
  geom_boxplot(fill = "purple") +
  labs(title = "Happiness by Employment Status",
       x = "Employment Status", y = "Happiness")

# Correlation between happiness and blood donation
cor(pl_small$happiness, pl_small$blood_donation, use = "complete.obs")

# Linear regression model: happiness on blood donation and other factors
model <- lm(happiness ~ blood_donation + german_citizenship +
              employment_status + health_status, data = pl_small)
summary(model)

# Visualization of the regression results
ggplot(pl_small, aes(x = factor(blood_donation), y = happiness)) +
  geom_jitter(alpha = 0.5) +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Regression of Happiness on Blood Donation",
       x = "Blood Donation", y = "Happiness")
