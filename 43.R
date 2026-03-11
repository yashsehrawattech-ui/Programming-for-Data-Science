# Step 1: Install required package 
install.packages("jsonlite") 

# Step 2: Load package 
library(jsonlite) 

# Step 3: Set working directory 
setwd("your_directory_path") 

# Step 4: Read existing JSON file 
inventory <- fromJSON("inventory.json") 

# Display current inventory 
print(inventory) 

# Step 5: Add new product 
new_product <- data.frame( 
  product_id = 103, 
  name = "Tablet", 
  category = "Electronics", 
  price = 300, 
  stock = 15 
) 

# Append new product to inventory 
updated_inventory <- rbind(inventory, new_product) 

# Step 6: Write updated inventory to new JSON file 
write_json(updated_inventory, "updated_inventory.json", pretty = 
             TRUE) 

# Step 7: Verify updated inventory 
verified_inventory <- fromJSON("updated_inventory.json") 

print(verified_inventory)