# Vector of daily closing prices
closing_prices <- c(120, 122, 118, 121, 119, 117, 123, 125, 126, 124,
                    128, 130, 129, 131, 135, 134, 136, 137, 140, 138,
                    139, 141, 142, 144, 143, 145, 146, 148, 147, 149)

# 1. Calculate daily returns (percentage change)
daily_returns <- diff(closing_prices) / closing_prices[-length(closing_prices)] * 100

# 2. Identify days with highest and lowest returns
highest_return_day <- which.max(daily_returns) + 1
lowest_return_day <- which.min(daily_returns) + 1

# 3. Calculate cumulative return over the month
cumulative_return <- (closing_prices[length(closing_prices)] /
                        closing_prices[1] - 1) * 100

# Print results
cat("Daily returns (%):", daily_returns, "\n")
cat("Day with highest return:", highest_return_day, "\n")
cat("Day with lowest return:", lowest_return_day, "\n")
cat("Cumulative return over the month (%):", cumulative_return, "\n")
