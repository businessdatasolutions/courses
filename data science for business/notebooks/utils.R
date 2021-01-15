## Laad packages - Hier niks aanpassen!
library(tidyverse)

## Functies om data in te lezen en the transformeren- Hier niks aanpassen!
readData <- function(setNr, folderpath, filevector) read.csv(paste0(folderpath,filevector[setNr]))[,2:3]

createDataList <- function(folderpath) {
  dataList <- list()
  fileList <- list.files(path = paste0(folderpath, "."))
  dataList <- sapply(fileList, function(x) {
    df <- read.csv(paste0(folderpath, x))[,2:3]
    setName <- str_remove(x, ".csv")
    dataList <- c(dataList, list(c(name = setName, list(data = df))))
  })
  return(dataList)
}

## Bestandsnamen datasets - Hier niks aanpassen!
dataSets <- list.files(path = "datasets/datasaur/.")

## Data wegschrijven - Hier niks aanpassen
dataList <- createDataList(folderpath = "datasets/datasaur/")
saveRDS(dataList, "session1.rds")

## Plot alle datasets
myData <- readRDS("session1.rds")

par(pty="s")
for(i in 1:length(myData)) {
  x <- myData[[i]]$data$x
  y <- myData[[i]]$data$y
  plot(x,y)
}
