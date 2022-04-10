library(tesseract)#za ocr
library(magick)#za obdelavo slik
library(imagerExtra)#za lepse slike
library(stringr)

numbers2 <- tesseract(options = list(tessedit_char_whitelist = ".0123456789"))#Definiramo da ocr bere le tocke

#preberemo izpit in naredimo sliko le rezultatov in imena

#IDEJA; S funkcijo prebrati slike skene vseh izpitov (tudi za backup ucitelju v primeru goljufanja [poprava izpita po vrednostenju]),
# izlusciti le naslovno stran s podatki in z ocr te strani ustvariti csv izpita z vsemi dijaki




test <- image_read("C:\\Users\\bor\\Downloads\\test.png")
image_browse(test)

################################################# preberemo ime kandidata
ime.priimek <- image_crop(test, "200x150+80")
ime.priimek <- ocr(ime.priimek, engine = tesseract("eng"))
ime.priimek <- str_sub(ime.priimek, 100,-2)

#################################################
#           VSAKE TOCKE POSEBEJ - Zal koda se vedno ne deluje lepo zato jo v naslednjih vrsticah povozimo
#################################################
tocke.prva <- image_crop(test, "27x25+723+50")
image_browse(tocke.prva)#TA NE BERE LEPO ceprav je isti font in ista resolucija cifre....

tocke.druga <- image_crop(test, "27.2x25+723+75")
image_browse(tocke.druga)

tocke.tretja <- image_crop(test, "27.2x25+723+100")
image_browse(tocke.tretja)

tocke.prva <- ocr(tocke.prva, engine = numbers2)
tocke.druga <- ocr(tocke.druga, engine = numbers2)
tocke.tretja <- ocr(tocke.tretja, engine = numbers2)

tocke.prva <- gsub("[\r\n]", "", tocke.prva)
tocke.druga <- gsub("[\r\n]", "", tocke.druga)
tocke.tretja <- gsub("[\r\n]", "", tocke.tretja)

str <- c(tocke.prva,tocke.druga,tocke.tretja)

#####################DODAMO PRISILNO LEP SEZNAM TOCK
test1 <- image_read("C:\\Users\\bor\\Downloads\\test1.png")
image_browse(test1)
tocke <- ocr(test1, engine = numbers2)
################################################################################Sestavimo vektor (df) s kandidatom in tockami
kandidat <- read.table(text = tocke)
kandidat <- t(kandidat)
rownames(kandidat) <- ime.priimek
