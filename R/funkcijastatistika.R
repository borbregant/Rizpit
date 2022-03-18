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
  hist((myData$PROCENT)*100, main="Histogram stevila dosezenih procentov", xlab="Dosezen delez ocene",
       ylab="Stevilo")
  abline(v=c(50,63,76,90), col=c("red", "blue","green","purple"))
  boxplot((myData$PROCENT)*100, main="Skatla z brki za procente", xlab="",
          ylab="Dosezeno stevilo procentov")
  plot(density(myData$VSOTA), main="Gostota dosezenih procentov", xlab="Dosezeno stevilo procentov",
       ylab="", yaxt='n')#yaxt=n da y os brez skale (saj je neuporabna za gostoto)
  # Close the pdf file
  dev.off()
}
