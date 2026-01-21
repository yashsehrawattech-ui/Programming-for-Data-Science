# Initialize sports team performance list
team_scores <- list(
  "Team A" = c(90, 85, 88),
  "Team B" = c(78, 82, 79),
  "Team C" = c(88, 92, 90)
)

# Function to add a team with scores
add_team <- function(team, scores) {
  team_scores[[team]] <<- scores
}

# Function to remove a team
remove_team <- function(team) {
  team_scores[[team]] <<- NULL
}

# Function to calculate average score for each team
calculate_averages <- function() {
  sapply(team_scores, mean)
}

# Function to rank teams based on average scores
rank_teams <- function() {
  averages <- calculate_averages()
  sort(averages, decreasing = TRUE)
}

# Example usage
add_team("Team D", c(85, 87, 90))
remove_team("Team B")

average_scores <- calculate_averages()
team_ranking <- rank_teams()

print(average_scores)
print(team_ranking)
