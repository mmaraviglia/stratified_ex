  library(splitstackshape)

# Creamos un DF de ejemplo
DF <- data.frame(
  ID = 1:100,
  A = sample(c("AA", "BB", "CC", "DD", "EE"), 1000, replace = TRUE),
  B = rnorm(1000), C = abs(round(rnorm(100), digits=1)),
  D = sample(c("CA", "NY", "TX"), 1000, replace = TRUE),
  E = sample(c("M", "F"), 1000, replace = TRUE))

View(DF)

# Extraer una muestra del 20% de todos los grupos a partir de la columna "A" 
DF1 = stratified(DF, "A", .2)

table(DF$A) # Las clases de la columna A estan balanceadas.
table(DF1$A)


# Tomar una muestra del 10% basadas en dos de las clases de una columna.
View(stratified(DF, "A", .1, select = list(A = c("AA", "BB"))))


# Tomar 5 muestras de cada grupo de una columna (indicandola por numero de columna)
View(stratified(DF, group = 5, size = 5))



# Tomar una muestra aleatoria del 10% basandonos en los estratos de dos columnas
## Recomendacion: ingresar las columnas de menor cantidad de estratos a mayor.

View(stratified(DF, c("E", "D"), size = .10))
table(DF$E, DF$D) # --> se balancean los pesos de las clases (Ver F-TX y F-CA)



