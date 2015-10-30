# Alteracao teste git hub
# install.packages(RSelenium)
library(RSelenium)
checkForServer()
startServer()
remDrv <- remoteDriver(browserName = 'firefox')
remDrv$open()
vetorBuscas <- c("UFSCar", "USP", "UNESP", "UNICAMP", "UNIFESP")
totalRegistros <- c()
for (busca in vetorBuscas){
  remDrv$navigate('http://busca.estadao.com.br/')
  remDrv$findElement(using = "xpath", "//input[@id = 'myInputBusca']")$sendKeysToElement(list(busca))
  remDrv$findElement(using = "xpath", "//input[@type = 'submit']")$clickElement()
  pagina <- remDrv$getPageSource()[[1]]
  pagina <- htmlParse(pagina)
  pagina <- xmlRoot(pagina)
  registros <- getNodeSet(pagina, "//form[@method = 'GET']/p")
  registros <- xmlSApply(registros, xmlValue)[2]
  totalRegistros <- c(totalRegistros, registros)
}
remDrv$closeWindow()
remDrv$quit()
remDrv$closeServer()

