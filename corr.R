corr <- function(directory, threshold=0) {
  lista_de_datos <- list.files(directory, full.names = TRUE)
  medidas <- complete(directory)
  id <- medidas[medidas$nobs>threshold,]
  tmp_cor <- c()

  for (i in id$id) {
      archivo <- read.csv(lista_de_datos[i])
      valor <- !is.na(archivo$sulfate & archivo$nitrate)
      datos_valor <- archivo[valor, ]
      cor_tmp <- cor(datos_valor$sulfate, datos_valor$nitrate)
      
      if (!anyNA(cor_tmp)) 
              tmp_cor <- append(tmp_cor, cor_tmp)
  }
  
  tmp_cor
}