# Time vector (minutes)
time <- 1:60

# Sensor readings
temperature <- c(
  28, 29, 30, 31, 32, 33, 29, 28, 27, 30,
  31, 32, 33, 34, 35, 30, 29, 28, 27, 26,
  31, 32, 33, 34, 35, 36, 30, 29, 28, 27,
  31, 32, 33, 34, 35, 36, 30, 29, 28, 27,
  31, 32, 33, 34, 35, 36, 30, 29, 28, 27,
  31, 32, 33, 34, 35, 36, 30, 29, 28, 27
)

humidity <- c(
  45, 44, 43, 42, 41, 39, 38, 37, 36, 40,
  39, 38, 37, 36, 35, 42, 43, 44, 45, 46,
  39, 38, 37, 36, 35, 34, 42, 43, 44, 45,
  39, 38, 37, 36, 35, 34, 42, 43, 44, 45,
  39, 38, 37, 36, 35, 34, 42, 43, 44, 45,
  39, 38, 37, 36, 35, 34, 42, 43, 44, 45
)

pressure <- c(
  1010, 1011, 1012, 1013, 1014, 1015, 1011, 1010, 1009, 1012,
  1013, 1014, 1015, 1016, 1017, 1012, 1011, 1010, 1009, 1008,
  1013, 1014, 1015, 1016, 1017, 1018, 1012, 1011, 1010, 1009,
  1013, 1014, 1015, 1016, 1017, 1018, 1012, 1011, 1010, 1009,
  1013, 1014, 1015, 1016, 1017, 1018, 1012, 1011, 1010, 1009,
  1013, 1014, 1015, 1016, 1017, 1018, 1012, 1011, 1010, 1009
)

# 1. Calculate average readings
avg_temperature <- mean(temperature)
avg_humidity <- mean(humidity)
avg_pressure <- mean(pressure)

# 2. Identify critical time intervals
critical_intervals <- which(temperature > 30 & humidity < 40)

# Print results
cat("Average temperature:", avg_temperature, "°C\n")
cat("Average humidity:", avg_humidity, "%\n")
cat("Average pressure:", avg_pressure, "hPa\n")
cat("Time intervals with temperature > 30°C and humidity < 40%:",
    critical_intervals, "\n")

# 3. Plot sensor readings
plot(time, temperature, type = "l", col = "red",
     ylim = c(25, 150),
     xlab = "Time (minutes)",
     ylab = "Sensor readings",
     main = "Sensor Readings Over Time")
lines(time, humidity, col = "blue")
lines(time, pressure / 10, col = "green")  # scaled for plotting
legend("topright",
       legend = c("Temperature (°C)", "Humidity (%)", "Pressure (scaled)"),
       col = c("red", "blue", "green"),
       lty = 1)