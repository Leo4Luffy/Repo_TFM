#### Función que permite obtener la matriz H del GBLUP de un solo paso (ssGBLUP) ----

pacman::p_load(tibble, dplyr, pedigreemm)

# 1. Datos a usar de ejemplo

Animal <- seq(from = 1, to = 17, by = 1)
Padre <- c(0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 5, 7, 9, 11, 11, 13, 13)
Madre <- c(0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 6, 8, 10, 12, 4, 15, 14)

Datos <- tibble(Animal, Padre, Madre) %>%
  na_if(0) %>% # Para usar la función para calcular la matriz A y su inversa, todos los padres y madres faltantes (en este caso 0), deben estar como NA.
  mutate(
    Genotipado = case_when( # Se debe indicar que individuos estan genotipados, en este caso los individuos del 9 al 12.
      Animal %in% (9:12) ~ TRUE,
      TRUE ~ FALSE
    )
  )

# 2. Se calcula la matriz de relaciones aditivas con base en el pedigrí (A) y su inversa

ped_edit <- editPed( # Esta función ordena el pedigrí. Luego la salida se usa posteriormente para crear un objeto "ped".
  sire = Datos$Padre,
  dam = Datos$Madre,
  label = Datos$Animal
  )

pedigri <- pedigree(
  sire = ped_edit$sire,
  dam = ped_edit$dam,
  label = ped_edit$label
  )

Matriz_A <- getA(ped = pedigri) # El argumento debe ser un objeto de clase pedigree (el anteriormente creado).
print(Matriz_A)

Matriz_A_inv <- getAInv(ped = pedigri)
print(Matriz_A_inv)

# 3. De lo anterior (Matriz_A) se extraen las partes correspondientes a individuos no genotipados (1) y genotipados (2)

# Individuos no genotipados (todos excepto del 9 al 12)
A_11 <- Matriz_A[Datos$Genotipado != 1, Datos$Genotipado != 1] # Recordar que el R identifica a TRUE como 1 (de valor logico a número) y a FALSE como 0 (en este caso distinto de 1).
# Individuos genotipados (del 9 al 12)
A_22 <- Matriz_A[Datos$Genotipado == 1, Datos$Genotipado == 1]
# Individuos no genotipados (en filas) y genotipados (en columnas)
A_12 <- Matriz_A[Datos$Genotipado != 1, Datos$Genotipado == 1]
# Transpuesta de la anterior (individuos no genotipados en columnas y genotipados en filas)
A_21 <- t(A_12)

# Nota: recordar que la ecuación de la matriz H es la siguiente:
#
#    H = |A_11 - A_12 A_22_inv A_21 + A_12 A_22_inv A_21        A_12 A_22_inv G|
#        |              G A_22_inv A_21                                G       |
#
# Por lo tanto de lo anterior, faltaria construir la matriz G e invertir A_22 (lo que se hara con la función solve()).

# 4. Se construye la matriz de relaciones genómicas (G)

Matriz_G <- Matrix(matrix(c(1.0, 0.7, 0.7, 0.7,
                            0.7, 1.0, 0.7, 0.7,
                            0.7, 0.7, 1.0, 0.7,
                            0.7, 0.7, 0.7, 1.0), 
                          nrow = 4)) # Aquí, la matriz G tiene 1s en la diagonal y 0,7 fuera de ella (es decir, todos los animales están relacionados aunque sus fundadores supuestamente no están relacionados). Esto del ejemplo de Legarra et al. 2009.

rownames(Matriz_G) <- Datos$Animal[Datos$Genotipado == 1]
colnames(Matriz_G) <- Datos$Animal[Datos$Genotipado == 1]

# 5. Finalmente teniendo todos los componentes de la matriz H, se procede a su construcción

H_11 <- A_11 - (A_12 %*% solve(A_22) %*% A_21) + (A_12 %*% solve(A_22) %*% Matriz_G %*% solve(A_22) %*% A_21)
H_12 <- A_12 %*% solve(A_22) %*% Matriz_G
H_21 <- t(H_12)
H_22 <- Matriz_G

H_11_H_12 <- cbind(H_11, H_12)
H_21_H_22 <- cbind(H_21, H_22)
Matriz_H <- rbind(H_11_H_12, H_21_H_22)

Matriz_H <- Matriz_H[order(as.numeric(rownames(Matriz_H))), order(as.numeric(colnames(Matriz_H)))]

# 6. En base a cada uno de los pasos anteriores, se contruye la función

#' Matrix H
#' 
#' Create from ssGBLUP matrix H
#' 
#' @param ped corresponds to the data (pedigree) that will be used to calculate the matrix of additive relationships (A). This must consist of the identification of the individual, the father and the mother, as well as whether said individual is genotyped or not (TRUE / FALSE).
#' @param mG corresponds to the matrix of genomic relationships (G).
#' 
#' @return a relationship matrix including full pedigree and genomic information (H).
#' 
#' @example 
#' fn.mH(ped = Data, mG = Matrix_G)
#' 
#' @importFrom pedigreemm editPed
#' @importFrom pedigreemm pedigree
#' @importFrom pedigreemm getA

fn.mH <- function(ped, mG) { # Esta función recibe como argumentos los datos con estructura (id | sire | dam | Gen (TRUE/FALSE)) y la matriz de relaciones genómicas.
  
  # 1. Se calcula la matriz de relaciones aditivas con base en el pedigrí (A)
  
  ped_edit <- pedigreemm::editPed( # Esta función ordena el pedigrí. Luego la salida se usa posteriormente para crear un objeto "ped".
    sire = ped$sire,
    dam = ped$dam,
    label = ped$id
    )
  pedi <- pedigreemm::pedigree(
    sire = ped_edit$sire,
    dam = ped_edit$dam,
    label = ped_edit$label
  )
  Matrix_A <- pedigreemm::getA(ped = pedi) # El argumento debe ser un objeto de clase pedigree (el anteriormente creado). Esto dara la matriz de relaciones aditivas A.
 
  # 2. De lo anterior (Matriz_A) se extraen las partes correspondientes a individuos no genotipados (1) y genotipados (2)
  
  # Individuos no genotipados:
  A_11 <- Matrix_A[ped$Genotiped != 1, ped$Genotiped != 1] # Recordar que el R identifica a TRUE como 1 (de valor logico a número) y a FALSE como 0 (en este caso distinto de 1).
  # Individuos genotipados:
  A_22 <- Matrix_A[ped$Genotiped == 1, ped$Genotiped == 1]
  # Individuos no genotipados (en filas) y genotipados (en columnas):
  A_12 <- Matrix_A[ped$Genotiped != 1, ped$Genotiped == 1]
  # Transpuesta de la anterior (individuos no genotipados en columnas y genotipados en filas):
  A_21 <- t(A_12)
  
  # 3. Se coloca el nombre de las filas y y de las columnas de la matriz G según los individuos genotipados
  
  rownames(mG) <- ped$id[ped$Genotiped == 1]
  colnames(mG) <- ped$id[ped$Genotiped == 1]
  
  # 4. Teniendo todos los componentes de la matriz H, se procede a su construcción
  
  H_11 <- A_11 - (A_12 %*% solve(A_22) %*% A_21) + (A_12 %*% solve(A_22) %*% mG %*% solve(A_22) %*% A_21)
  H_12 <- A_12 %*% solve(A_22) %*% mG
  H_21 <- t(H_12)
  H_22 <- mG
  
  H_11_H_12 <- cbind(H_11, H_12)
  H_21_H_22 <- cbind(H_21, H_22)
  mH <- rbind(H_11_H_12, H_21_H_22)
  
  mH <- mH[order(as.numeric(rownames(mH))), order(as.numeric(colnames(mH)))]
  
  # 5. Finalmente se indica retornar la matriz H
  
  return(mH)
  }

# Se crean unos datos y se prueba la función

id <- seq(from = 1, to = 17, by = 1)
sire <- c(0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 5, 7, 9, 11, 11, 13, 13)
dam <- c(0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 6, 8, 10, 12, 4, 15, 14)

Datos <- tibble(id, sire, dam) %>%
  na_if(0) %>% # Para usar la función para calcular la matriz A y su inversa, todos los padres y madres faltantes (en este caso 0), deben estar como NA.
  mutate(
    Genotiped = case_when( # Se debe indicar que individuos estan genotipados, en este caso los individuos del 9 al 12.
      id %in% (9:12) ~ TRUE,
      TRUE ~ FALSE
    )
  )

Matriz_G <- Matrix(matrix(c(1.0, 0.7, 0.7, 0.7,
                            0.7, 1.0, 0.7, 0.7,
                            0.7, 0.7, 1.0, 0.7,
                            0.7, 0.7, 0.7, 1.0), 
                          nrow = 4)) # Aquí, la matriz G tiene 1s en la diagonal y 0,7 fuera de ella (es decir, todos los animales están relacionados aunque sus fundadores supuestamente no están relacionados). Esto del ejemplo de Legarra et al. 2009.

fn.mH(ped = Datos, mG = Matriz_G)
