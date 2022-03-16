#' ocena
#'
#' Funkcija iz dataframea izpita izlusci ocene posameznih kandidatov
#' @param myData input tabela ki sprejme nujno v obliki VPISNA|TOCKE1|...|TOCKEn|
#' @param skupnotock stevilo max tock, ki jih je bilo mozno doseci na izpitu
#' @keywords ocena
#' @export
#' @examples
#' ocena()

ocena = function(izpit,skupnotock) {
  izpit$VSOTA <- rowSums(izpit[2:ncol(izpit)])
  izpit <- izpit[,as.vector(c("VPISNA","VSOTA"))]
  
  ocena = rep(0, nrow(izpit))#vektor ocen (R deluje hitreje ce ne rabi sproti generirati)
  
  for(i in 1:nrow(izpit)){
    r = if (izpit$VSOTA[i]/skupnotock > 0.9) {
      "odlicno"
    } else if (izpit$VSOTA[i]/skupnotock > 0.76) {
      "prav dobro"
    } else if (izpit$VSOTA[i]/skupnotock > 0.65) {
      "dobro"
    } else if (izpit$VSOTA[i]/skupnotock > 0.5) {
      "zadostno"
    } else {
      "nezadostno"
    }
    ocena[i] = r
  }
  izpit$OCENA <- ocena
  izpit <- izpit[,as.vector(c("VPISNA","OCENA"))]
  return(izpit)
}