# Function to check whether a number is odd or even
check_odd_even <- function(number) {
  if (number %% 2 == 0) {
    return("The number is even")
  } else {
    return("The number is odd")
  }
}

# Test the function with different sets of inputs
result1 <- check_odd_even(10)    # Positive even number
result2 <- check_odd_even(7)     # Positive odd number
result3 <- check_odd_even(0)     # Zero
result4 <- check_odd_even(-8)    # Negative even number
result5 <- check_odd_even(-5)    # Negative odd number

# Print the test results
cat("Input: 10 ->", result1, "\n")
cat("Input: 7 ->", result2, "\n")
cat("Input: 0 ->", result3, "\n")
cat("Input: -8 ->", result4, "\n")
cat("Input: -5 ->", result5, "\n")
