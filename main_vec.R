# Vamos a ver algunos ejemplos donde el codigo puede ser 
# mejor mediante vectorizacion


# Canasta de compras
basket <- data.frame("Food" = c("Apples", "Bananas", "Carrots"),
                     "PricePerUnit" = c(.99, .19, .49),
                     "Quantity" = c(12, 6, 2))

#Se estima el total de las compras
# create the total
total <- 0
# loop over the data.frame and add the running total
for(row in 1:nrow(basket))
  total <- total + (basket$PricePerUnit[row] * basket$Quantity[row])
total

# Se encuentra que apply sirve para data.frames o matrices
# Mientras sapply espera sapply espera un vecto
# y lapply espera una lista

