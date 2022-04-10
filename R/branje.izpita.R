#' branje.izpita
#'
#' Funkcija izvozi ime kandidata in njegove tocke na skeniranem izpitu
#' @param test skeniran izpit v obliki pnd
#' @keywords sken, ocr, branje
#' @export kandidat ime, priimek in stevilo tock na posamezni nalogi
#' @examples
#' branje.izpita()

branje.izpita <- function(test = image_read("https://raw.githubusercontent.com/borbregant/Rizpit/master/tests/test.png")){

  library(tesseract)#za ocr
  library(magick)#za obdelavo slik
  library(imagerExtra)#za lepse slike
  library(stringr)

  numbers2 <- tesseract(options = list(tessedit_char_whitelist = ".0123456789"))#Definiramo da ocr bere le tocke
  ##############################################################################
  ime.priimek <- image_crop(test, "200x150+80")
  ime.priimek <- ocr(ime.priimek, engine = tesseract("eng"))
  ime.priimek <- str_sub(ime.priimek, 100,-2)
  ##############################################################################
  tocke.prva <- image_crop(test, "27x25+723+50")
  tocke.druga <- image_crop(test, "27.2x25+723+75")
  tocke.tretja <- image_crop(test, "27.2x25+723+100")

  tocke.prva <- ocr(tocke.prva, engine = numbers2)
  tocke.druga <- ocr(tocke.druga, engine = numbers2)
  tocke.tretja <- ocr(tocke.tretja, engine = numbers2)

  tocke.prva <- gsub("[\r\n]", "", tocke.prva)
  tocke.druga <- gsub("[\r\n]", "", tocke.druga)
  tocke.tretja <- gsub("[\r\n]", "", tocke.tretja)

  vektor.tock <- c(tocke.prva,tocke.druga,tocke.tretja)

  kandidat <- data.frame(vektor.tock)
  kandidat <- t(kandidat)
  rownames(kandidat) <- ime.priimek

  return(kandidat)
}
