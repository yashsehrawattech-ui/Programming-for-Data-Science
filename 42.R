# Step 1: Install and Load Required Packages
# (Run install.packages only the first time)

install.packages("DBI")
install.packages("dplyr")
install.packages("RSQLite")
install.packages("dbplyr")

library(DBI)
library(dplyr)
library(RSQLite)
library(dbplyr)

# Step 2: Set Working Directory (location of songs.db)
getwd()
setwd("C:/Users/abhis/Downloads")   # Change path if needed

# Step 3: Establish Connection to SQLite Database
db_connection <- dbConnect(SQLite(), dbname = "songs.db")

# Step 4: Create Reference to songs Table
songs_table <- tbl(db_connection, "songs")
print(songs_table)

# Step 5: Construct Query to Retrieve Songs by Queen (artist_id = 11)
queen_songs_query <- songs_table %>%
  filter(artist_id == 11) %>%
  select(title)

print(queen_songs_query)

# Step 6: Display SQL Query
show_query(queen_songs_query)

# Retrieve Actual Data as Tibble
queen_songs_data <- collect(queen_songs_query)
print(queen_songs_data)

# Step 7: Disconnect from Database
dbDisconnect(db_connection)

