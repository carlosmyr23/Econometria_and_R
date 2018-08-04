#########################################################

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
 
#########################################################

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
  
 
#########################################################

# Ejemplo 1 pasar archivo de excel a una Data Frame en R  
# Se usa la tabla 1.3 de la pagina 29
 library("readxl")
#Ver los archivos
 dir()
#Se pasa a la carpeta donde estan los archivos xls
 setwd("/home/carlos/Analisis_datos/Economia/Econometria/Dataset/gujarati_r")

#Se usa el comando read_excel() y se le asigna a una dataframe
# Se usa skip = 2 para omitir los renglones que no se usen.
 
 tabla1 <- read_excel("Table 1_3.xls",skip = 2);tabla1
#Se convierte en una matriz
  tabla1 <- as.matrix(tabla1)
# Se visualiza la tabla1 
tabla1
# Se reacomodan los nombres de las filas con el comando 
# rownames () con la columna 1 que tenía los años 
tabla1[,1]

rownames(tabla1) <- tabla1[,1]
 tabla1
 #se elimina la columna sobrante con [,-1]
 tabla1 <- tabla1[,-1]
 tabla1
 # Se convierte a caracter numerico con mode(variable) <- "numeric"
 mode(tabla1) <- "numeric"
  
 
 #Ejercicio Capítulo 1 página 29 Econometría Gujarati 

 # En esta tabla se observan los índice de precios
 # al consumidor de siete países
 # Industrializados, cuya base es 1982-1984 . 100
################################################################### 
 #1.1 a) A partir de estos datos, calcule la tasa de 
 #  inflación en cada país
 #
 # La tasa de inflación se calcula como 
 # IPC año actual - IPC del año anterior/IPC del año anterior * 100
 
 # Para eso se crea una función que haga la siguiente operacion
 #(((tabla1[fila2,columna2])-(tabla1[fila1,columna2]))/(tabla1[fila1,columna2]))*100
 

 # La función consiste en dos "for" anidados en una función que 
 # camina hasta donde tu le digas  
 
 # la primera parte dice IPC_inflacion <- funtion(m2){ resultado <- m2
 # que crea 3 variables, una de ellas una función personal
 # La segunda dice for(columna in colnames(m2)) {
 # Que asigna la variable columna a un colnames de la variable m2
 # La tercera linea dice for(fila in 2:dim(m2)[1]) {
 # tiene otro for anidado donde inciará un contador de la fila 2 hasta la
 # dimensión de la matriz con la fucnión dim(m2)[1]
 # la cuarta linea dice  
 # resultado[fila,columna] <- 100*(m2[fila,columna]-m2[fila-1,columna])/(m2[fila-1,columna])
 # La cual hace la operacion usando las variables fila, columna creadas 
 # La quinta fila regresa a la variable resultado hasta que acaben los contadores
 
 m2 <- tabla1
 IPC_inflacion <- funtion(m2) { resultado <- m2
 
 
     for(columna in colnames(m2)) {
      for(fila in 2:dim(m2)[1]) {
            resultado[fila,columna] <- 100*(m2[fila,columna]-m2[fila-1,columna])/(m2[fila-1,columna])
            }
           }
   return(resultado)
 }
 
 

 #Se invoca la función y se le asigna a otra variable
 tabla_inflacion <- IPC_inflacion(tabla1)
 # Se limpia la tabla de la primera fila
 tabla_inflacion <- tabla_inflacion[-1,]
 #Se visualiza
 View(tabla_inflacion)
################################################################### 
 #1.1 b) Grafique la tasa de inflación de cada nación en función del tiempo 
 # (es decir, asigne el eje horizontal al tiempo, y el vertical, a la 
 # tasa de inflación).
 
 ?plot()

# 1.1 b) Graficando la inflación para los 7 paises
 
 coloritos <- palette(rainbow(6)) 

plot(rownames(tabla_inflacion),main="Inflación",tabla_inflacion[,1],type="l",col="blue")
 lines(rownames(inflacion),inflacion[,2],type="l",col="green")
 lines(rownames(inflacion),inflacion[,3],type="l",col="yellow")
 lines(rownames(inflacion),inflacion[,4],type="l",col="magenta")
 lines(rownames(inflacion),inflacion[,5],type="l",col="red")
 lines(rownames(inflacion),inflacion[,6],type="l",col="black")
 lines(rownames(inflacion),inflacion[,7],type="l",col="purple")

 
plot(rownames(tabla_inflacion),tabla_inflacion[,1],type="l",col="blue") 
  for(i in 1:6)  
    {
   lines(rownames(inflacion),inflacion[,i],type="l",col=rainbow(6))
      }
 
 #Solo para que viva en los for
 
 rm(m2)
 ########################################################
 # 1.1 c) ¿Qué conclusiones generales surgen respecto de 
 # la inflación en los siete países?
 # Para contestar la pregunta c debemos conocer 
 # el promedio de los 7 paises en cada año
 # Se puede construir una función que saca 
 # el promedio. 
 # utilizamos la función mean() 
 
 ?mean
 
 # Solución 1
 #
 #Sacamos el promedio de la primera fila
 # Nos dice la inflación promedio de todos los paises 
 # en un año
 
 mean(tabla_inflacion[1,])
 promedio2 <- tabla_inflacion
 # Pero queremos el promedio de todos los años
 
 # Solución 2
 # Para sacar de otra forma más facil usamos
 
   ?apply()
   # Media por País  
   Media_Pais <- apply(tabla_inflacion,MARGIN = 2 ,mean)
   Media_Pais 
   # Media de los paises en años     
   Media_A <- apply(tabla_inflacion,MARGIN = 1 ,mean)
   ?rbind()
   promedio2 <- cbind(promedio2,Media_A)
   promedio2
   promedio2 <- rbind(promedio2,Media_Pais)
   View(promedio2)

  
# c) ¿Qué conclusiones generales surgen respecto de la 
# inflación en los siete países?
   
# Observamos las medias, y podemos decir que a partir 
# del año de 1993 el promedio de la inflación de los  
# 7 paises es menor al 3.2 %. Y antes del año 1993 es
# Es mayor al 3.2%. Se puede concluir que la inflación
# Disminuyó para los 7 paises en los últimos años.     
###################################################
   
# d) ¿Qué país tiene, al parecer, la tasa de inflación 
# más variable? ¿Puede explicarlo?
   
# Medidas de Variablidad Desviación estandar
   # En R existe una función llamada "sd" standar desviation 
   # La podemos calcular con apply 
   # Aquí se calcula la desviación estandar por país
   # Recuerde que rbind es para renglon y cbind para columna
   desvp <- apply(tabla_inflacion,MARGIN = 2 ,sd)
   promedio2 <- rbind(promedio2,desvp)
   
   # Aquí se calcula la desviación estandar por año de todos
   # Los países 
   
   desva <- apply(tabla_inflacion,MARGIN = 1 ,sd)
   promedio2 <- cbind(promedio2,desva)
   # Mostramos las variables en la tabla promedio2
   # Recuerde que esta tabla solo muestra los datos completos.
   # Si operamos sobre esa dataframe es probable que se
   # Cometan errores
   # Vemos la tabla con View() 
   View(promedio2)
   ?mode()
   mode(promedio2)   
   length(promedio2)
# Se observan los datos, entre más grande sea la desviación
# Más variabilidad tiene.
# Se puede crear una condicional que la mida.
# El país que se Observa con más variabilidad en la 
# inflación es Italia 
#     


# 1.2. a) Use la tabla 1.3 para trazar la gráfica de 
# la tasa de inflación de Canadá, Francia, Alemania,
# Italia, Japón y Gran Bretaña, en comparación con la 
# de Estados Unidos.
#
# b) Comente en términos generales el comportamiento 
# de la tasa de inflación de los seis países, en 
# comparación con la de Estados Unidos.
# Los comportamientos de la inflación, son parecidos al
# de Estados Unidos.    
   # c) Si descubre que las tasas de inflación de esos
# seis países tienen la misma dirección que
# la de Estados Unidos, ¿esto indicaría que la inflación
# en Estados Unidos “provoca” la inflación en los demás
# países? ¿Por qué?
# Estados unidos a partir de la caída del acuedo de
# Bretton Woods en Agosto de 1971 lleva el control
# del comercio internacional. Junto a Políticas de 
# establidad cambiaria Fijadas por FMI y BM
# Los paises se encuentran interconectados, directamente
# con la política monetaria de EUA. Por eso todas las
# transacciones comerciales y monetarias se hacen en 
# dollares. 
   
####################################################
   
# 1.3 
#  En la tabla 1.4 se presentan los tipos de cambio de 
#  nueve países industrializados correspondientes a 
#  1985-2006. Excepto para Gran Bretaña, el tipo de 
#  cambio se define como las unidades de la divisa 
#  equivalentes a un dólar estadounidense; para ese país
#  se define como el número de dólares estadounidenses 
#  que se cambian por una libra inglesa.
#  a) Grafique los tipos de cambio en función del tiempo
#  y comente el comportamiento general de los tipos de 
#  cambio durante el periodo.
   
#Cambiar a directorio   
   setwd("/home/carlos/Analisis_datos/Economia/Econometria/Dataset/gujarati_r")
# Importar los Datos   
   library("readxl")
   tabla1_4 <- read_excel("Table 1_4.xls",skip = 2)
   tabla1_4 <- as.matrix(tabla1_4)   
   mode(tabla1_4) <- "numeric"
   tabla1_4 <- tabla1_4[-1,]
   row.names(tabla1_4) <- tabla1_4[,1]
   tabla1_4 <- tabla1_4[,-1]
   View(tabla1_4)
        
         
  library(ggplot2) 
  
   tabla1_4 <- as.data.frame(tabla1_4) 
   tabla1_4.df <- tabla1_4

colnames(tabla1_4)    
str(tabla1_4)
class(tabla1_4)
  #ggplot(data = tabla1_4, aes(x = rownames(tabla1_4), y = tabla1_4$`United Kingdom (pound) 2` ),color = "blue")

   ggplot(data = tabla1_4, aes(x = rownames(tabla1_4),group=1)) +
     geom_line(aes(y=tabla1_4$`Australia (dollar) 2`),colour="blue") +
     geom_line(aes(y=tabla1_4$`China, P.R. (yuan)`),colour="red") +
     geom_line(aes(y=tabla1_4$`Mexico (peso)`),colour="green") +
     geom_line(aes(y=tabla1_4$`Sweden (krona)`),colour="purple") +
     geom_line(aes(y=tabla1_4$`Switzerland (franc)`),colour="pink") +
     labs(subtitle="Tipo de cambio Paises Industrializados", 
          y="Unidades por Dolar", 
          x="Años", 
          title="Tipo de cambio Paises Industrializados")
     geom_line(aes(y=tabla1_4$`United Kingdom (pound) 2`))
  
   ggplot(data = tabla1_4, aes(x = rownames(tabla1_4),group=1)) +
     geom_line(aes(y=tabla1_4$`Japan (yen)`),colour="yellow") +
     geom_line(aes(y=tabla1_4$`South Korea (won)`),colour="purple")
   
# El comportamiento del tipo de cambio de los 9 paises 
# industrializados se ha mantenido volatil, tal vez por 
# las diferentes políticas monetariasy fiscales que han
# aplicado, como Corea del Sur, Japón o China. 
# A diferencia de México cono modelos monetarios que 
# prentenden dar estabilidad a través del TC, Reservas 
# internacionalesy un modelo de economía abierta al 
# a tratados de Libre Comercio   
  
   
