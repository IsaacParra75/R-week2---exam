complete <- function(directory, id= 1:332) {
  
  lista_de_datos <- list.files(directory, full.names = TRUE)
  
  datos <- data.frame()
  completo <- data.frame()
  ## names(completo) <- c('id','nobs')
  
  for (i in id) {
    tmp <- read.csv(lista_de_datos[i])
    valor<-!is.na(tmp$sulfate & tmp$nitrate)
    completo <-rbind (completo, c(i, nrow(tmp[valor, ])))
  }
  names(completo) <- c('id','nobs')
  completo
  
}