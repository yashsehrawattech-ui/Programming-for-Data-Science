# Step 1: Install and load the required package
install.packages("dplyr")
library(dplyr)

# Load the built-in starwars dataset
data("starwars", package = "dplyr")

# Step 2: Extract the necessary columns
sw_data <- starwars %>%
  select(name, species, height, mass, homeworld, gender)

# Step 3: Keep only species that appear more than two times
species_filtered <- sw_data %>%
  group_by(species) %>%
  filter(n() > 2)

# Step 4: Generate new columns
species_filtered <- species_filtered %>%
  mutate(
    height_meters = height / 100,
    weight_group = case_when(
      mass < 60 ~ "Light",
      mass >= 60 & mass < 90 ~ "Moderate",
      mass >= 90 ~ "Heavy",
      TRUE ~ "Unknown"
    )
  )

# Step 5: Compute average height for each species and gender
avg_height_group <- species_filtered %>%
  group_by(species, gender) %>%
  summarise(mean_height = mean(height, na.rm = TRUE))

# Step 6: Identify the top three species with the highest average height
top3_species <- species_filtered %>%
  group_by(species) %>%
  summarise(mean_height = mean(height, na.rm = TRUE)) %>%
  arrange(desc(mean_height)) %>%
  slice(1:3)

# Display results
View(avg_height_group)
View(top3_species)