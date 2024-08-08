# **Two-Way ANOVA in R**

#### Overview
This guide explains how to perform a Two-Way ANOVA in R. Two-Way ANOVA is used to evaluate the influence of two different categorical independent variables on one continuous dependent variable. Additionally, it helps in understanding if there is an interaction between the two factors affecting the dependent variable.

### Prerequisites
-R installed on your system.

-Basic understanding of R programming.

-Basic understanding of ANOVA and statistical concepts.

### Installation
If you haven't already, install the necessary packages:

```
install.packages("ggplot2")
install.packages("dplyr")
install.packages("car")
```
### Steps to Perform a Two-Way ANOVA
1. Load the Data:
   
First, load the data you want to analyze. It can be a built-in dataset or your own dataset.

```
# Load required libraries
library(ggplot2)
library(dplyr)

# Example dataset
data <- read.csv("path_to_your_dataset.csv")

# View the first few rows
head(data)
```
2. Check Data Structure:
   
Ensure your independent variables are factors and the dependent variable is continuous.

```
str(data)
```

Convert variables to factors if necessary:

```
data$Factor1 <- as.factor(data$Factor1)
data$Factor2 <- as.factor(data$Factor2)
```

3. Perform Two-Way ANOVA
   
Use the aov() function to perform the Two-Way ANOVA:

```
# Perform Two-Way ANOVA
anova_result <- aov(DependentVariable ~ Factor1 * Factor2, data = data)

# View summary of the ANOVA
summary(anova_result)
```

4. Check Assumptions:
   
a. Homogeneity of Variances

Use the leveneTest() from the car package to check for homogeneity of variances:

```
library(car)

leveneTest(DependentVariable ~ Factor1 * Factor2, data = data)
```

b. Normality of Residuals

Check the normality of residuals with a Q-Q plot:

```
# Q-Q plot
qqnorm(anova_result$residuals)
qqline(anova_result$residuals)
```

Alternatively, perform the Shapiro-Wilk test:

```
shapiro.test(anova_result$residuals)
```

5. Interpret the Results
   
Interpret the ANOVA table:

* Factor1: P-value indicates whether Factor1 has a significant effect.
  
* Factor2: P-value indicates whether Factor2 has a significant effect.
  
* Factor1:Factor2: Interaction term indicating whether there is a significant interaction between Factor1 and Factor2.
  
6. Post-Hoc Tests (if necessary)
   
If significant effects are found, perform post-hoc tests using TukeyHSD():

```
# Post-hoc test
TukeyHSD(anova_result)
```

7. Visualize the Interaction
   
Visualize the interaction effect using ggplot2:

```
ggplot(data, aes(x = Factor1, y = DependentVariable, color = Factor2)) +
  geom_point(position = position_jitterdodge()) +
  geom_line(stat = "summary", fun.y = "mean", aes(group = Factor2)) +
  labs(title = "Interaction Plot", x = "Factor1", y = "Dependent Variable")
```

### Example

Here's an example using a sample dataset:

```
# Example dataset
data <- data.frame(
  Factor1 = factor(rep(c("A", "B"), each = 10)),
  Factor2 = factor(rep(c("X", "Y"), 10)),
  DependentVariable = c(23, 21, 19, 30, 29, 31, 23, 22, 24, 26, 30, 28, 25, 27, 29, 22, 24, 21, 23, 20)
)

# Perform Two-Way ANOVA
anova_result <- aov(DependentVariable ~ Factor1 * Factor2, data = data)
summary(anova_result)
```







