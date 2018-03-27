#Crear directorios de usuario y descargar ejercicios. 

getwd()
#crear directorio 
 dir.create("~/Analisis_datos/Economia/Econometria/Dataset/gujarati_r/resultados") 

# Cambia al directorio de trabajo
 setwd("~/Analisis_datos/Economia/Econometria/Dataset/gujarati_r/")

#Descargando los datos en R

download.file("http://highered.mheducation.com/sites/dl/free/0070660050/37004/data_sets.zip",dest="datasetstxt.zip", mode = "wb")
#Segunda fuente
download.file("http://highered.mcgraw-hill.com/sites/dl/free/0073375772/611592/5e_data_sets.zip",dest="dataset.zip",mode="wb")

#Para descomprimir

 unzip("dataset.zip",files=NULL,overwrite = TRUE)
 unzip("datasetstxt.zip",files=NULL,overwrite = TRUE)
 
