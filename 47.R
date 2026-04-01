#Step1:
# Install necessary packages
install.packages("ggplot2")
install.packages("plotly")
# Load the necessary package(s)
library(ggplot2)
library(plotly)

#Step2:
# Load the iris dataset
data(iris)
# print data
print(head(iris))

#Step3:
# 3.1. Create a static scatter plot using ggplot2
ggplot(data = iris, aes(x = Sepal.Width, y = Petal.Width, color = Species)) +
  geom_point() +
  labs(title = "Iris Data Set Visualization", x = "Sepal Width", y = "Petal Width")

#Step3:
# 3.2. Store static plot and convert to interactive using ggplotly
static_plot <- ggplot(data = iris, aes(x = Sepal.Width, y = Petal.Width, color = Species)) +
  geom_point() +
  labs(title = "Iris Data Set Visualization", x = "Sepal Width", y = "Petal Width")
ggplotly(static_plot)

#Step3:
# 3.3. Create an interactive scatter plot using plot_ly with custom layout
plot_ly(data = iris, x = ~Sepal.Width, y = ~Petal.Width, color = ~Species, type = "scatter", mode = "markers") %>%
  layout(
    title = "Iris Data Set Visualization",
    xaxis = list(title = "Sepal Width", ticksuffix = "cm"),
    yaxis = list(title = "Petal Width", ticksuffix = "cm")
  )