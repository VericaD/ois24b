# Installer le package si ce n'est pas déjà fait
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}

# Charger la bibliothèque ggplot2
library(ggplot2)

# Générer des données aléatoires pour deux groupes
set.seed(123) # Pour la reproductibilité
group1 <- rnorm(100, mean = 10, sd = 2)
group2 <- rnorm(100, mean = 12, sd = 2)

# Créer un dataframe avec les données
data <- data.frame(
  value = c(group1, group2),
  group = factor(rep(c("Group 1", "Group 2"), each = 100))
)

# Créer une visualisation non triviale avec ggplot2
ggplot(data, aes(x = group, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Comparaison entre deux groupes",
       x = "Group",
       y = "Value") +
  theme_minimal()
