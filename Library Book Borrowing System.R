# Initialize library book borrowing list
library_books <- list(
  "The Hobbit" = c("Alice", "Bob"),
  "1984" = c("Charlie", "Alice"),
  "Moby Dick" = c("Bob")
)

# Function to add a new book with its borrowers
add_book <- function(book, borrowers) {
  library_books[[book]] <<- borrowers
}

# Function to remove a book from the system
remove_book <- function(book) {
  library_books[[book]] <<- NULL
}

# Function to calculate total borrowers for each book
calculate_borrowers <- function() {
  sapply(library_books, length)
}

# Function to find book with highest and lowest borrowers
find_extremes <- function() {
  totals <- calculate_borrowers()
  list(
    highest = names(which.max(totals)),
    lowest = names(which.min(totals))
  )
}

# Example usage
add_book("Dune", c("Alice", "David", "Bob"))
remove_book("Moby Dick")

borrower_counts <- calculate_borrowers()
extremes <- find_extremes()

print(borrower_counts)
print(extremes)
