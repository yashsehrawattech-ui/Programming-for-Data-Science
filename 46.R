#Step1:
# Install necessary package
install.packages("ggplot2")
# Load the necessary package(s)
library(ggplot2)

#Step2:
# Create a dataframe for plant growth data
data <- data.frame(
  Plant_ID = 1:10,
  Growth_Rate = c(3.2, 5.1, 2.8, 4.6, 6.3, 3.9, 7.1, 5.5, 4.2, 6.8),
  Condition_Label = LETTERS[1:10]
)
# print data
print(data)

#Step3:
# Create a scatter plot with text labels and customizations
ggplot(data = data, aes(x = Plant_ID, y = Growth_Rate)) +
  geom_point(color = "dodgerblue", size = 4) +
  geom_text(aes(label = Condition_Label), vjust = 2, color = "darkorange") +
  labs(title = "Scatter Plot of Plant Growth Data", x = "Plant ID", y = "Growth Rate")
