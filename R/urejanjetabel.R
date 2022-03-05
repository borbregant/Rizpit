#' urejanjetabel
#'
#' Funkcija iz dataframeov posameznih izpitov !najvec8! sestavi skupno tabelo, ki prikaze le kandidata in skupno tock
#' Lahko kombiniramo s funkcijo ocena
#' @param kolokvij1 input tabela ki sprejme nujno v obliki VPISNA|TOCKE1|...|TOCKEn|
#' @keywords ocena
#' @export
#' @examples
#' urejanjetabel()


library(plyr)
library(purrr)
library(dplyr)

urejanjetabel <- function(kolokvij1
                          ,kolokvij2=data.frame(VPISNA=c(0,1),PRVA=c(0,1),DRUGA=c(0,1),TRETJA=c(0,1))
                          ,kolokvij3=data.frame(VPISNA=c(0,1),PRVA=c(0,1),DRUGA=c(0,1),TRETJA=c(0,1))
                          ,kolokvij4=data.frame(VPISNA=c(0,1),PRVA=c(0,1),DRUGA=c(0,1),TRETJA=c(0,1))
                          ,kolokvij5=data.frame(VPISNA=c(0,1),PRVA=c(0,1),DRUGA=c(0,1),TRETJA=c(0,1))
                          ,kolokvij6=data.frame(VPISNA=c(0,1),PRVA=c(0,1),DRUGA=c(0,1),TRETJA=c(0,1))
                          ,kolokvij7=data.frame(VPISNA=c(0,1),PRVA=c(0,1),DRUGA=c(0,1),TRETJA=c(0,1))
                          ,kolokvij8=data.frame(VPISNA=c(0,1),PRVA=c(0,1),DRUGA=c(0,1),TRETJA=c(0,1))
){
  kolokvij1$VSOTA <- rowSums(kolokvij1[2:ncol(kolokvij1)])
  kolokvij1 <- kolokvij1[,as.vector(c("VPISNA","VSOTA"))]

  kolokvij2$VSOTA <- rowSums(kolokvij2[2:ncol(kolokvij2)])
  kolokvij2 <- kolokvij2[,as.vector(c("VPISNA","VSOTA"))]
  
  kolokvij3$VSOTA <- rowSums(kolokvij3[2:ncol(kolokvij3)])
  kolokvij3 <- kolokvij3[,as.vector(c("VPISNA","VSOTA"))]
  
  kolokvij4$VSOTA <- rowSums(kolokvij4[2:ncol(kolokvij4)])
  kolokvij4 <- kolokvij4[,as.vector(c("VPISNA","VSOTA"))]
  
  kolokvij5$VSOTA <- rowSums(kolokvij5[2:ncol(kolokvij5)])
  kolokvij5 <- kolokvij5[,as.vector(c("VPISNA","VSOTA"))]
  
  kolokvij6$VSOTA <- rowSums(kolokvij6[2:ncol(kolokvij6)])
  kolokvij6 <- kolokvij6[,as.vector(c("VPISNA","VSOTA"))]
  
  kolokvij7$VSOTA <- rowSums(kolokvij7[2:ncol(kolokvij7)])
  kolokvij7 <- kolokvij7[,as.vector(c("VPISNA","VSOTA"))]
  
  kolokvij8$VSOTA <- rowSums(kolokvij8[2:ncol(kolokvij8)])
  kolokvij8 <- kolokvij8[,as.vector(c("VPISNA","VSOTA"))]
  
  SKUPNATABELA <- purrr::reduce(list(kolokvij1,kolokvij2,kolokvij3,kolokvij4,kolokvij5,kolokvij6,kolokvij7,kolokvij8), dplyr::full_join, by = 'VPISNA')
  SKUPNATABELA[is.na(SKUPNATABELA)] <- 0
  SKUPNATABELA$VSOTA <- rowSums(SKUPNATABELA[2:ncol(SKUPNATABELA)])
  SKUPNATABELA <- SKUPNATABELA[,as.vector(c("VPISNA","VSOTA"))]
  #write.table da se zapise v novo tabelo.... se prej jo kar v funkciji uredi da bo prikazala le procent vseh... se prej uredi da vrne oceno in ne tocke
  #return(skupnatabela)
}
