#' funkcijagoljuf
#'
#' Funkcija preveri kandidate za goljufe na podlagi sedeznega reda, ki je privzeta za ucilnico
#'                                        oo oooo oo  sedezi 8-16 iz leve proti desni
#'                                        oo oooo oo  sedezi 1-8 iz leve proti desni
#'                                           |==|     kateder
#' Opazuje le kandidate, ki sedijo na sosednjih mestih in direktno za njimi
#' Problem: Vcasih izpostavi prvo in zadnjo vrsto kot sosednji... daj v if stavek
#' @param myData input tabela ki sprejme nujno v obliki VPISNA|TOCKE1|...|TOCKEn|sedez
#' @keywords goljuf
#' @export
#' @examples     #kolokvij 1 ima dodaten stolpec sedezni red za testiranje
#' funkcijagoljuf()

funkcijagoljuf <- function(myData){
  
  #myData$VSOTA <- rowSums(myData[2:ncol(myData)])
 # myData <- myData[,as.vector(c("VPISNA","VSOTA"))]
  
  tabelagoljuf <- data.frame(matrix(vector(), nrow(myData), nrow(myData)))
  colnames(tabelagoljuf) <- myData$VPISNA
  row.names(tabelagoljuf) <- myData$VPISNA
  
  #DIST MATRIKA
  
  #dovolj je gledati le lower matriko ker simetricna
  #+1 za desne sosede, +8 za zgornje sosede
  
  for(i in 1:nrow(myData)){
    for(j in 1:nrow(myData)){
      if (myData$sedez[i] == myData$sedez[j]+1 | myData$sedez[i] == myData$sedez[j]+8) {
        tabelagoljuf[i, j] = sqrt((myData$PRVA[i] - myData$PRVA[j])^2+
                                    (myData$DRUGA[i] - myData$DRUGA[j])^2+
                                    (myData$TRETJA[i] - myData$TRETJA[j])^2)
      }
    }
  }
  
  #BARVANJE MATRIKE GLEDE VREDNOSTI
  library(tidyverse)
  library(DT)
  
  
  breaks <- quantile(tabelagoljuf, probs = seq(.05, .95, .05), na.rm = TRUE)
  colors <- round(seq(255, 40, length.out = length(breaks) + 1), 0) %>% 
    {paste0("rgb(255,", ., ",", ., ")")}
  datatable(tabelagoljuf) %>% formatStyle(names(tabelagoljuf), backgroundColor = styleInterval(breaks, colors))
  
  #Izpis kandidatov za goljufe
  tabelagoljuf[is.na(tabelagoljuf)] <- 0
  #tabelagoljuf <- tabelagoljuf + t(tabelagoljuf) #niti ne potrebujemo ce imamo 0 namesto Na
  
  for(i in 1:nrow(tabelagoljuf)){
    for(j in 1:nrow(tabelagoljuf)){
      if (tabelagoljuf[i,j] < breaks[1] & tabelagoljuf[i,j]!=0) {
        print(names(tabelagoljuf)[which(tabelagoljuf == tabelagoljuf[i,j], arr.ind=T)[, "col"]])
      }
    }
  }
}