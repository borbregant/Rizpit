#######################
# ZA POGON
#######################
library(tidyverse)
kolokvij1 <- read_csv("~/GitHub/Rizpit/tests/kolokvij1.csv")
kolokvij2 <- read_csv("~/GitHub/Rizpit/tests/kolokvij2.csv")
test1 <- read_csv("~/GitHub/Rizpit/tests/test1.csv")
test2 <- read_csv("~/GitHub/Rizpit/tests/test2.csv")

#######################
# ZA POGON TESTIRANJ
#######################
urejanjetabel(test1,test2)
urejanjetabel(test1,test2,skupnotock=80)

ocena(kolokvij1,60)

funkcijastatistika(test1,60)#generira datoteki v mapi, kjer je funkcija shranjena

funkcijagoljuf(kolokvij1)
#######################
# Koda za generiranje       ni del testiranj
# Manjkajo odseki saj delno narejena v konzoli
#######################

kolokvij1$sedez <- 1:48
kolokvij1$VPISNA <- 1:48
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

kolokvij1$VPISNA <- 1:nrow(kolokvij1)
kolokvij2$VPISNA <- 1:nrow(kolokvij2)
kolokvij2$sedez <- 1:nrow(kolokvij2)

write.csv(kolokvij2,"C:\\Users\\bor\\kolokvij2.csv", row.names = FALSE)
write.csv(kolokvij1,"C:\\Users\\bor\\kolokvij1.csv", row.names = FALSE)
