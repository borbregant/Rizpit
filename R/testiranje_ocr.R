library(tesseract)#za ocr
library(magick)#za obdelavo slik
library(imagerExtra)#za lepse slike
library(stringr)



#preberemo izpit in naredimo sliko le rezultatov in imena

#IDEJA; S funkcijo prebrati slike skene vseh izpitov (tudi za backup ucitelju v primeru goljufanja [poprava izpita po vrednostenju]),
# izlusciti le naslovno stran s podatki in z ocr te strani ustvariti csv izpita z vsemi dijaki




test <- image_read("C:\\Users\\bor\\Downloads\\test.png")
image_browse(test)

ime.priimek <- image_crop(test, "200x150+80")
image_browse(ime.priimek)

tocke <- image_crop(test, "28x200+722")
image_browse(tocke)



numbers2 <- tesseract(options = list(tessedit_char_whitelist = ".0123456789"))

ime.priimek <- ocr(ime.priimek, engine = tesseract("eng"))
ime.priimek <- str_sub(ime.priimek, 100,-2)

tocke <- ocr(tocke, engine = numbers2)# TEGA NE ZNA DOBRO PREBRATI OCR

#####################DODAMO PRISILNO LEP SEZNAM TOCK
test1 <- image_read("C:\\Users\\bor\\Downloads\\test1.png")
image_browse(test1)
tocke <- ocr(test1, engine = numbers2)
################################################################################Sestavimo vektor (df) s kandidatom in tockami
kandidat <- read.table(text = tocke)
kandidat <- t(kandidat)
rownames(kandidat) <- ime.priimek



