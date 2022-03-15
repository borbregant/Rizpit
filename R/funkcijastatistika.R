#' funkcijastatistika
#'
#' Funkcija izvozi txt in pdf statistike izpita myData
#' @param myData input tabela ki sprejme nujno v obliki IME|TOCKE1|...|TOCKEn|
#' @param maxtock maksimalno mozno stevilo dosezenih tock
#' @keywords statistika
#' @export
#' @examples
#' funkcijastatistika()

funkcijastatistika <- function(myData,maxtock){
  
  myData$VSOTA <- rowSums(myData[2:ncol(myData)])
  myData <- myData[,as.vector(c("IME","VSOTA"))]
  
  myData$PROCENT <- myData$VSOTA / maxtock
  myData$PROCENT <- as.numeric(myData$PROCENT)
  ############################################ export za summary v obliki txt
  sink("Statistika_izpita.txt")
  print(summary(myData))
  sink()  # returns output to the console
  ############################################ export v obliki pdf
  pdf("Statistika_izpita_graficno.pdf") 
  # 2. Create a plot
  par(mfrow=c(2,2))
  hist(myData$PROCENT, main="Histogram stevila ocen", xlab="Ocena", 
       ylab="Stevilo")
  abline(v=c(0.5,0.6,0.7), col=c("red", "blue","green"))
  boxplot(myData$VSOTA, main="Skatla z brki za ocene", xlab="", 
          ylab="Ocena")
  plot(density(myData$VSOTA), main="Gostota ocen", xlab="Ocena", 
       ylab="Stevilo")
  # Close the pdf file
  dev.off()
}