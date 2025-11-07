# Create two data frames with information about people
A <- data.frame(Ident = c(1, 2, 3, 4, 5), Sexe = c("H", "F", "F", "H", "H"), Poids = c(75, 68, 48, 72, 83))
B <- data.frame(Ident = c(1, 2, 3, 4, 5), Sexe = c("H", "F", "F", "H", "H"), Taille = c(182, 165, 160, 178, 183))

# Merge the two data frames by Ident and Sexe
C <- merge(A, B, by = c("Ident", "Sexe"))
print(C)