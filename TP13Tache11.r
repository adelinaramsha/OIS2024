# Charger le jeu de données iris
data("iris")

# Définir les couleurs pour chaque espèce
colors <- c("setosa" = "red", "versicolor" = "green", "virginica" = "blue")

# Définir les symboles pour chaque espèce
symbols <- c("setosa" = 16, "versicolor" = 17, "virginica" = 18)

# Créer un graphique vide avec les bonnes limites
plot(iris$Petal.Length, iris$Petal.Width, type = "n",
     xlab = "Longueur des pétales (cm)", ylab = "Largeur des pétales (cm)",
     main = "Relation entre la longueur et la largeur des pétales selon l'espèce")

# Ajouter des points pour chaque espèce
for (species in unique(iris$Species)) {
  species_data <- subset(iris, Species == species)
  points(species_data$Petal.Length, species_data$Petal.Width,
         col = colors[species], pch = symbols[species])
}

# Ajouter une régression linéaire pour chaque espèce
for (species in unique(iris$Species)) {
  species_data <- subset(iris, Species == species)
  model <- lm(Petal.Width ~ Petal.Length, data = species_data)
  abline(model, col = colors[species], lwd = 2)
}

# Ajouter une légende
legend("topleft", legend = unique(iris$Species), col = colors, pch = symbols, title = "Espèce")
