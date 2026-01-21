# Initialize customer purchase list
customer_purchases <- list(
  Alice = c(200, 150, 300),
  Bob = c(100, 80, 150),
  Charlie = c(250, 300, 100)
)

# Function to add a new customer and their purchases
add_customer <- function(name, purchases) {
  customer_purchases[[name]] <<- purchases
}

# Function to remove a customer
remove_customer <- function(name) {
  customer_purchases[[name]] <<- NULL
}

# Function to calculate total purchase for each customer
calculate_totals <- function() {
  sapply(customer_purchases, sum)
}

# Function to find highest and lowest total purchase
find_extremes <- function() {
  totals <- calculate_totals()
  list(
    highest = names(which.max(totals)),
    lowest = names(which.min(totals))
  )
}

# Example usage
add_customer("David", c(400, 200))
remove_customer("Bob")

totals <- calculate_totals()
extremes <- find_extremes()

print(totals)
print(extremes)
