# Load necessary packages
library(dplyr)

# Load data
table1 <- read.csv("EC1-dataset1.csv")
table2 <- read.csv("EC1-dataset2.csv")


merged_table <- right_join(table1, table2, by = "PID")

tidy_table <- merged_table %>%
  select(PID, Openess, Class1, Class2)

# View the tidy table
View(tidy_table)
