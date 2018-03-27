#Crear directorios de usuario y descargar ejercicios de Gujarati. 

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

#Algunos comandos de R
 
#Ver directorio de trabajo
# getwd()

# Ver archivos
 # dir()

# Borrar una columna
 # set subset (Datos, select = (columnas a borrar, otra))
 #tabla1 #<- subset(tabla1, select = -c(GROUP01,TABLE01))

#Borrar una tabla o data frame
 #tabla <- NULL
 
 #Leer tabla de Eviews
 # tabla1.3 <- readEViews(filename = "table1-3.wf1", as.data.frame = TRUE)
 

#Leer tabla Excel 
 # read_excel("Table 1_1.xls")

# Reasignar a un vector una entrada 
 # v4[3] <- 7 
 # v4["c"]<- 7 
 # sacar lo que contiene un vector mivector["b"] 
 # length[mivector]
 # para conocer los elementos 
 # mode[mivector] 
 # para conocer que tipo de objeto es 
 # class(objetos)
 
 # crear una matriz de 3x3 
  #matriz <- matrix(1:9, ncol=3, nrow=3)
 #Como preguntar de una función 
  #?matrix()
 #Eliminar una columna variable[,-1]
 # Longitud de un vector
  # length()
 # Preguntar cuantas filas hay 
 #nrow(dataframe)

  
 
 #funcion que saca funciones en una dataframe 
  #?apply()
 
