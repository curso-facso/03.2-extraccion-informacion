


rD <- rsDriver(browser="chrome", port=4545L, verbose=F)
remDr <- rD[["client"]]


library(RSelenium)
remDr <- remoteDriver(
  remoteServerAddr = "localhost",
  port = 4445L,
  browserName = "firefox"
)

remDr$open(silent = FALSE)
remDr$navigate("http://www.google.com")
remDr$getTitle()

remDr$navigate("http://www.bbc.com")
remDr$getTitle()



remDr$open()
remDr$navigate("http://www.google.com/ncr")

remDr$getTitle()
remDr$screenshot(display = TRUE)


remDr$open()
remDr$getStatus()

remDr$navigate("http://www.google.com/ncr")
remDr$navigate("http://www.bbc.co.uk")
remDr$getCurrentUrl()


remDr$navigate("http://www.google.com/ncr")
webElem <- remDr$findElement(using = "name", value = "q")
webElem$getElementAttribute("name")

remDr$close()
