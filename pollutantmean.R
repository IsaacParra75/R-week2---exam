pollutantmean<-function(directory, pollutant, id= 1:332) {
  
  lista_de_datos <- list.files(directory, full.names = TRUE)
  
  datos <- data.frame()
  
  for (i in id) {
    datos <- rbind(datos, read.csv(lista_de_datos[i]))
  }
  mean(datos[[pollutant]], na.rm=TRUE)
}