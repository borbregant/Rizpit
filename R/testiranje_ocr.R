library(tesseract)#za ocr
library(magick)#za obdelavo slik

eng <- tesseract("eng")
text <- tesseract::ocr("C:\\Users\\bor\\Downloads\\test.png", engine = eng)
cat(text)
