# Vamos a ver algunos ejemplos donde el codigo puede ser 
# mejor mediante vectorizacion

# Se encuentra que apply sirve para data.frames o matrices
# Mientras sapply espera sapply espera un vecto
# y lapply espera una lista

# Canasta de compras
basket <- data.frame("Food" = c("Apples", "Bananas", "Carrots"),
                     "PricePerUnit" = c(.99, .19, .49),
                     "Quantity" = c(12, 6, 2))

#Se estima el total de las compras


total <- sum(basket$PricePerUnit * basket$Quantity)
total

# create a vector of the possible hex code values (0-9 and A-F)
hex <- c(0:9, LETTERS[1:6])

# set the seed
set.seed(2022)
# pick the number of rows
rows <- 10^4
# create a data.frame of rgb values
df <- data.frame("red" = sample(0:255, rows, replace = TRUE), 
                 "green" = sample(0:255, rows, replace = TRUE),
                 "blue" = sample(0:255, rows, replace = TRUE))


#Veamo otro ejemplo 
for(r in 1:nrow(df)) {
  # get a value for each position in the hex code
  # first pair
  h1 <- hex[floor(df$red[r] / 16) + 1]
  h2 <- hex[df$red[r] %% 16 + 1]
  
  # second pair
  h3 <- hex[floor(df$green[r] / 16) + 1]
  h4 <- hex[df$green[r] %% 16 + 1]

  # third pair
  h5 <- hex[floor(df$blue[r] / 16) + 1]
  h6 <- hex[df$blue[r] %% 16 + 1]
  
  # assemble the values using `paste0` and assign it to the `hex` column for 
  # the corresponding row
  df$hex[r] <- paste0("#", h1, h2, h3, h4, h5, h6)
}


ows <- 10^4
hex <- c(0:9, LETTERS[1:6])

set.seed(2022)
dt <- data.frame("red" = sample(0:255, rows, replace = TRUE), 
                 "green" = sample(0:255, rows, replace = TRUE),
                 "blue" = sample(0:255, rows, replace = TRUE))


#Benchmarks tenemos que programar las funciones
rbenchmark::benchmark(
  "for loop" = {
    df <- dt
    for (r in 1:nrow(df)) {
      df$hexFor[r] <- paste0("#", 
                             hex[floor(df$red[r] / 16) + 1],
                             hex[df$red[r] %% 16 + 1],
                             hex[floor(df$green[r] / 16) + 1],
                             hex[df$green[r] %% 16 + 1],
                             hex[floor(df$blue[r] / 16) + 1],
                             hex[df$blue[r] %% 16 + 1]
                             )
    }
  },
  "apply" = {
    df <- dt
    rgbToHex <- function(x) {
      paste0("#",
             hex[floor(x["red"] / 16) + 1],
             hex[x["red"] %% 16 + 1],
             hex[floor(x["green"] / 16) + 1],
             hex[x["green"] %% 16 + 1],
             hex[floor(x["blue"] / 16) + 1],
             hex[x["blue"] %% 16 + 1]
             )
    }
    df$hexApply <- apply(df, 1, rgbToHex)
  },
  "vector" = {
    df <- dt
    df$hexVector <- paste0("#",
                           hex[floor(df$red / 16) + 1],
                           hex[df$red %% 16 + 1],
                           hex[floor(df$green / 16) + 1],
                           hex[df$green %% 16 + 1],
                           hex[floor(df$blue / 16) + 1],
                           hex[df$blue %% 16 + 1]
                           )
  },
  replications = 10, order = "relative"
)