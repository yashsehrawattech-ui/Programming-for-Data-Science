# Function that computes the sum of two values
add_numbers <- function(a, b) {
  return(a + b)
}

# Evaluate the function using various input values
output1 <- add_numbers(5, 10)
output2 <- add_numbers(-3, 7)
output3 <- add_numbers(0, 0)
output4 <- add_numbers(3.5, 2.1)

# Display the outcomes of each calculation
cat("Sum of 5 and 10 is:", output1, "\n")
cat("Sum of -3 and 7 is:", output2, "\n")
cat("Sum of 0 and 0 is:", output3, "\n")
cat("Sum of 3.5 and 2.1 is:", output4, "\n")
