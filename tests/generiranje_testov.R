kolokvij1$sedez <- 1:48
write.csv(kolokvij1,"C:\\Users\\bor\\kolokvij1.csv", row.names = FALSE)

test1 <- kolokvij1

colnames(test1)[1] <- "IME"

test1$IME <- 1:48

ocene <- rnorm(48, mean = 10, sd = 5) #isti vektor bo veckrat pognan za razlicne naloge
ocene <- round(ocene, digits = 0)

test1$PRVA <- ocene
test1$DRUGA <- ocene
test1$TRETJA <- ocene

test1 <- test1[-c(26:48), ]


test2 <- kolokvij1
colnames(test1)[1] <- "IME"
test2$IME <- 2:49

ocene <- rnorm(48, mean = 8, sd = 3) #isti vektor bo veckrat pognan za razlicne naloge
ocene <- round(ocene, digits = 0)

test2$PRVA <- ocene
test2$DRUGA <- ocene
test2$TRETJA <- ocene


test2 <- test2[-c(28:48), ]
test2 <- test2[ , -c(1)]
test2 <- test2[,c(ncol(test2),1:(ncol(test2)-1))]#da zadni stolpec na prvo mesto

write.csv(test1,"C:\\Users\\bor\\test1.csv", row.names = FALSE)
write.csv(test2,"C:\\Users\\bor\\test2.csv", row.names = FALSE)
