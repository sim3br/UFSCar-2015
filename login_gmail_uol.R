library(RSelenium)
library(XML)

###### ACESSAR UOL ######
teste <- c(teste, #Selinium)
url <- 'https://acesso.uol.com.br/login.html?skin=webmail'
login M- "leobarone"
senha <- "SUASENHA" 

checkForServer()
startServer()

remDrv <- remoteDriver()
remDrv$open()
remDrv$navigate(url)
Sys.sleep(2)
remDrv$findElement(using = "xpath", "//input[@name = 'user']")$sendKeysToElement(list(login))
Sys.sleep(2)
remDrv$findElement(using = "xpath", "//input[@name = 'pass']")$sendKeysToElement(list(senha))
Sys.sleep(2)
remDrv$findElement(using = "xpath", "//input[@type = 'submit']")$clickElement()

###### ACESSAR GMAIL ######

url <- 'https://accounts.google.com/ServiceLogin?sacu=1&scc=1&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&hl=pt-BR&service=mail#identifier'
login <- "leobarone@gmail.com"  
senha <- "SUASENHA" 

checkForServer()
startServer()

remDrv <- remoteDriver()
remDrv$open()
remDrv$navigate(url)
Sys.sleep(2)
remDrv$findElement(using = "xpath", "//input[@name = 'Email']")$sendKeysToElement(list(login))
Sys.sleep(2)
remDrv$findElement(using = "xpath", "//input[@name = 'signIn']")$clickElement()
Sys.sleep(2)
remDrv$findElement(using = "xpath", "//input[@name = 'Passwd']")$sendKeysToElement(list(senha))
Sys.sleep(2)
remDrv$findElement(using = "xpath", "//input[@id = 'signIn']")$clickElement()


