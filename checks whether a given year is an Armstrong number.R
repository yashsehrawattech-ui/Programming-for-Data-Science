# Function to check whether a given number is an Armstrong number
is_armstrong <- function(number) {
  # Convert the number to a character string and extract digits
  digits <- unlist(strsplit(as.character(number), ""))
  digits <- as.integer(digits)
  
  # Calculate the number of digits
  n <- length(digits)
  
  # Calculate the sum of digits raised to the power of n
  sum_of_powers <- sum(digits^n)
  
  if (sum_of_powers == number) {
    return("The number is an Armstrong number.")
  } else {
    return("The number is not an Armstrong number.")
  }
}

# Test the function
print(is_armstrong(153))   # Three-digit Armstrong number
print(is_armstrong(123))   # Non-Armstrong number
print(is_armstrong(1634))  # Four-digit Armstrong number
print(is_armstrong(7))     # Single-digit number
