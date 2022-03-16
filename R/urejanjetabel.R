#' urejanjetabel
#'
#' Funkcija iz dataframeov posameznih izpitov !najvec8! sestavi skupno tabelo, ki prikaze le kandidata in skupno tock
#' Lahko podamo argument skupnotock=, ki namesto skupnega stevila tock priredi oceno vsakemu kandidatu
#' @param kolokviji input tabela ki sprejme nujno v obliki IME|TOCKE1|...|TOCKEn|
#' @param skupnotock skupno stevilo tock kolokvijev, da namesto tock v skupno tabelo vpise procent
#' @param zapisi skupno tabelo zapise v obliki dataframe-a. zaenkrat deluje le na mojem lokalnem racunalniku
#' @keywords ocena
#' @export
#' @examples
#' urejanjetabel()


library(plyr)
library(purrr)
library(dplyr)

urejanjetabel <- function(kolokvij1# brez dodanih praznih "ucencev" ne deluje pravilno
                          ,kolokvij2=data.frame(IME=c(0),PRVA=c(0),DRUGA=c(0),TRETJA=c(0))
                          ,kolokvij3=data.frame(IME=c(0),PRVA=c(0),DRUGA=c(0),TRETJA=c(0))
                          ,kolokvij4=data.frame(IME=c(0),PRVA=c(0),DRUGA=c(0),TRETJA=c(0))
                          ,kolokvij5=data.frame(IME=c(0),PRVA=c(0),DRUGA=c(0),TRETJA=c(0))
                          ,kolokvij6=data.frame(IME=c(0),PRVA=c(0),DRUGA=c(0),TRETJA=c(0))
                          ,kolokvij7=data.frame(IME=c(0),PRVA=c(0),DRUGA=c(0),TRETJA=c(0))
                          ,kolokvij8=data.frame(IME=c(0),PRVA=c(0),DRUGA=c(0),TRETJA=c(0))
                          ,skupnotock
                          ,zapisi=FALSE
){
  kolokvij1$VSOTA <- rowSums(kolokvij1[2:ncol(kolokvij1)])
  kolokvij1 <- kolokvij1[,as.vector(c("IME","VSOTA"))]

  kolokvij2$VSOTA <- rowSums(kolokvij2[2:ncol(kolokvij2)])
  kolokvij2 <- kolokvij2[,as.vector(c("IME","VSOTA"))]
  
  kolokvij3$VSOTA <- rowSums(kolokvij3[2:ncol(kolokvij3)])
  kolokvij3 <- kolokvij3[,as.vector(c("IME","VSOTA"))]
  
  kolokvij4$VSOTA <- rowSums(kolokvij4[2:ncol(kolokvij4)])
  kolokvij4 <- kolokvij4[,as.vector(c("IME","VSOTA"))]
  
  kolokvij5$VSOTA <- rowSums(kolokvij5[2:ncol(kolokvij5)])
  kolokvij5 <- kolokvij5[,as.vector(c("IME","VSOTA"))]
  
  kolokvij6$VSOTA <- rowSums(kolokvij6[2:ncol(kolokvij6)])
  kolokvij6 <- kolokvij6[,as.vector(c("IME","VSOTA"))]
  
  kolokvij7$VSOTA <- rowSums(kolokvij7[2:ncol(kolokvij7)])
  kolokvij7 <- kolokvij7[,as.vector(c("IME","VSOTA"))]
  
  kolokvij8$VSOTA <- rowSums(kolokvij8[2:ncol(kolokvij8)])
  kolokvij8 <- kolokvij8[,as.vector(c("IME","VSOTA"))]
  
  SKUPNATABELA <- purrr::reduce(list(kolokvij1,kolokvij2,kolokvij3,kolokvij4,kolokvij5,kolokvij6,kolokvij7,kolokvij8), dplyr::full_join, by = 'IME')
  SKUPNATABELA[is.na(SKUPNATABELA)] <- 0
  SKUPNATABELA$VSOTA <- rowSums(SKUPNATABELA[2:ncol(SKUPNATABELA)])
  SKUPNATABELA <- SKUPNATABELA[,as.vector(c("IME","VSOTA"))]
  #write.table da se zapise v novo tabelo
  if(missing(skupnotock)){return(SKUPNATABELA)}#  ce ne podamo max tock vrne le ime in vsoto
  else{#                                          ce podamo max tocke vrne ime in procent
    SKUPNATABELA$VSOTA <- SKUPNATABELA$VSOTA / skupnotock
    names(SKUPNATABELA)[names(SKUPNATABELA) == 'VSOTA'] <- 'PROCENT'
    
    ocena = rep(0, nrow(SKUPNATABELA))#vektor ocen (R deluje hitreje ce ne rabi sproti generirati)
    for(i in 1:nrow(SKUPNATABELA)){
      r = if (SKUPNATABELA$PROCENT[i] > 0.9) {
        "odlicno"
      } else if (SKUPNATABELA$PROCENT[i] > 0.76) {
        "prav dobro"
      } else if (SKUPNATABELA$PROCENT[i] > 0.63) {
        "dobro"
      } else if (SKUPNATABELA$PROCENT[i] > 0.5) {
        "zadostno"
      } else {
        "nezadostno"
      }
      ocena[i] = r
    }
    SKUPNATABELA$OCENA <- ocena
    SKUPNATABELA <- SKUPNATABELA[,as.vector(c("IME","OCENA"))]
    
    if (zapisi==TRUE) {write.table(SKUPNATABELA,"C:\\Users\\bor\\SKUPNATABELA.csv", row.names = FALSE)}
    
    return(SKUPNATABELA)}
}
