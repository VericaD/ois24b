# Load ggplot2 library
library(ggplot2)

# Generate random data for heights of men and women
set.seed(123) # For reproducibility
heights_men <- rnorm(200, mean = 175, sd = 10)  # Heights of men in cm
heights_women <- rnorm(200, mean = 165, sd = 8)  # Heights of women in cm

# Create a dataframe with the data
data <- data.frame(
  height = c(heights_men, heights_women),
  gender = factor(rep(c("Men", "Women"), each = 200))
)

# Create a more complex visualization with ggplot2
ggplot(data, aes(x = height, fill = gender)) +
  # Histogram with stacked bars
  geom_histogram(alpha = 0.6, position = "identity", bins = 30) +
  # Add density curves for each group
  geom_density(alpha = 0.4, adjust = 1.5) +
  # Faceting to separate groups into different subplots
  facet_wrap(~ gender, scales = "free_y") +
  # Add titles and labels
  labs(title = "Distribution and density of heights for men and women",
       subtitle = "Histograms and density curves",
       x = "Height (cm)",
       y = "Density") +
  # Customize colors
  scale_fill_manual(values = c("Men" = "blue", "Women" = "pink")) +
  # Minimal theme with custom adjustments
  theme_minimal(base_size = 15) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5),
    legend.position = "none",
    panel.grid.major.x = element_line(color = "gray", linetype = "dashed")
  ) +
  # Add vertical lines for mean height of each gender
  geom_vline(data = data.frame(xintercept = c(mean(heights_men), mean(heights_women)),
                               gender = factor(c("Men", "Women"))),
             aes(xintercept = xintercept, color = gender),
             linetype = "dotted", size = 1.5) +
  # Add text annotations for mean height of each gender
  annotate(geom = "text", x = mean(heights_men), y = 25, label = "Men Mean", color = "blue", size = 5, hjust = 0) +
  annotate(geom = "text", x = mean(heights_women), y = 25, label = "Women Mean", color = "pink", size = 5, hjust = 1)
