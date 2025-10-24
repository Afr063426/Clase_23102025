#Nos piden hacer graficos

# ============================
# ------ Carga paquetes ------
# ============================
library(tidyverse)


iris %>%
  ggplot(aes(fill = Species, x = Petal.Width)) +
  geom_density() +
  theme_minimal()



iris %>%
  ggplot(aes(fill = Species, x = Petal.Length)) +
  geom_density() +
  theme_minimal()

iris %>%
  ggplot(aes(fill = Species, x = Sepal.Length)) +
  geom_density() +
  theme_minimal()

