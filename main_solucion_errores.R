# Script problemático: errores_a_solucionar.R

datos <- data.frame(
  Nombre = c("A", "B", "C", "D", "E"),
  Valor1 = c(10, 20, NA, 40, 50), # Error 1: Valor Faltante (NA)
  Valor2 = c(2, 5, 0, 10, 2)     # Error 2: Cero que causa división por cero
)

# 1. Intentar calcular la media sin manejar NAs
media_valor1 <- mean(datos$Valor1)
print(paste("Media calculada (con NA):", media_valor1))

# 2. Intentar una división que incluye un cero
resultado_division <- datos$Valor1 / datos$Valor2
print("Resultado de la división:")
print(resultado_division)

# 3. Intentar realizar una operación que podría fallar
# (Usaremos tryCatch en la solución, pero aquí se muestra la operación problemática)
logaritmo_negativo <- log(-1) # Este produce un Warning o NaN, dependiendo de la función
print(paste("Logaritmo de -1:", logaritmo_negativo))