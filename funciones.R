#Función que transforma el archivo proporcionado por el GEM, Crea una lista que
#puede ser gestionada facilmente por otras funciones
library(xlsx)
basedatos <- function(bdexcel){
        #Configurar el directorio de trabajo sobre aquella carpeta que contiene
        #el archivo excel denominado GEM APS Key Indicators 2001 - 2015.xls
        #Código para cargar una base de datos .xls con varias sheets
        
        wb <- loadWorkbook(bdexcel)
        #Averiguar la cantidad de sheets que tiene la base de datos .xls
        m <- wb$getNumberOfSheets()
        
        #Crear una base de datos universal tipo list. Allí se encuentran los principales
        #indicadores que se extraen de la encuesta APS del proyecto GEM
        bdu <- list()
        for (i in 1:m) {
                bdu[i] <- list(read.xlsx2(bdexcel, i))
        }
        
        #Se eliminan las filas 2 y 3 de todos los data.frame que estan en la lista
        bdu1 <- lapply(bdu, function(x){x[-c(1:2),]})
        
        #Se adicionan los nombres de las sheets correspondientes a la wb original
        names(bdu1) <- as.character(c(2001:2015))
        
        #Se transforma a character cada una de las columnas de cada
        #uno de los data.frames en bdu1
        for (j in 1:length(bdu1)){
                for (k in 1:dim(bdu1[[j]])[2]){
                        bdu1[[j]][, k]<- as.character(bdu1[[j]][, k])
                }
        }
        
        #Las columnas número 2 de cada data.frame se les coloca el nombre de Pais
        for(o in 1:length(bdu1)){
                names(bdu1[[o]])[2] <- c("Pais")
        }
        
        #Se dejan solo las columnas correspondientes a la TEA por Género y el país
        bdu1 <- lapply(bdu1, function(x){x[, c("Pais", "Teayymal", "Teayyfem", "Teayy")]})
        
        #Se agregan a cada uno de los data.frame la medida de disparidad
        #Disparidad = TeaMas / TeaFem
        for(i in 1:length(bdu1)){
                bdu1[[i]]$disp <- as.numeric(bdu1[[i]]$Teayymal) / as.numeric(bdu1[[i]]$Teayyfem)
        }
        
        #Se agrega el periodo a cada uno de los data.frame
        for (i in 1:length(bdu1)) {
                bdu1[[i]]$periodo <- rep(names(bdu1)[i], dim(bdu1[[i]])[1]) 
        }
        
        bdu1
}

#Función que permite gráficar por país la TEA por Género se llama bd_x_pais
library(ggplot2)
#El único argumento que recibe la función
#es nación donde el usuario digitará el país de interés, por 
#defecto esta el nombre de "a_nivel_mundial" que permitirá gráficar
#la brecha de género que existe en la actividad emprendedora
bd_x_pais <- function(nacion = "a_nivel_mundial", lin = 0, ejx = 0, ejy = 0){
        if(nacion == "a_nivel_mundial"){
                #Función que recibe una lista, creada previamente con el codigo anterior
                #y luego grafica la brecha de género para todos los paises
                mas <- sapply(bdu1, function(x)
                {mean(as.numeric(x[,c("Teayymal")]))})
                fem <- sapply(bdu1, function(x)
                {mean(as.numeric(x[,c("Teayyfem")]))})
                g <- c(mas, fem)
                tiempo <- rep(2001:2015, 2)
                genero <- c(rep("masculino", 15), rep("femenino", 15))
                df1 <- data.frame(TEA = g, periodo = tiempo, genero = genero)
                
                g1 <- ggplot(df1, aes(x = tiempo, y = TEA, colour = genero))
                g1 + geom_line(size = lin)       + 
                        xlab("Tiempo") +  ylab("TEA (%)") +
                        scale_x_continuous(limits = c(df1$periodo[1] - ejx, df1$periodo[dim(df1)[1]] + ejx), 
                                           expand = c(0, 0)) +
                        scale_y_continuous(limits = c(min(c(min(na.omit(df1$TEA)), min(na.omit(df1$TEA)))) - ejy,
                                                      max(c(max(na.omit(df1$TEA)), max(na.omit(df1$TEA)))) + ejy),
                                           expand = c(0, 0)) + 
                        geom_point() +
                        theme_bw() + 
                        geom_text(aes(label=round(TEA,1)), colour="black", size=3)
                
        }else{
                #Crea un vector con la Tea femenina según el argumento nacion
                fem <- sapply(1:length(bdu1), function(x){
                        if(sum(bdu1[[x]]$Pais == nacion) == 0){
                                NA
                        }else{
                                bdu1[[x]][bdu1[[x]]$Pais == nacion,c("Teayyfem")]
                        }
                })
                fem <- as.numeric(fem)
                
                #Crea un vector con la Tea masculina según el argumento nacion
                mas <- sapply(1:length(bdu1), function(x){
                        if(sum(bdu1[[x]]$Pais == nacion) == 0){
                                NA
                        }else{
                                bdu1[[x]][bdu1[[x]]$Pais == nacion, c("Teayymal")]
                        }
                })
                mas <- as.numeric(mas)
                
                #Se crea la base de datos sobre la cual se gráfica la brecha según país
                df1 <- data.frame(Tea = c(mas, fem), 
                                  Genero = c(rep("Masculino", 15), rep("Femenino", 15)),
                                  Periodo = as.numeric(2001:2015))
                df1 <- na.omit(df1)
                
                #Se gráfica la brecha según país
                ggplot(df1, aes(x=Periodo,y=Tea, colour = Genero)) +
                        geom_line(size = lin) +
                        xlab("Tiempo") +  ylab("TEA") +
                        scale_x_continuous(limits = c(df1$Periodo[1] - ejx, df1$Periodo[dim(df1)[1]] + ejx), 
                                           expand = c(0, 0)) +
                        scale_y_continuous(limits = c(min(c(min(na.omit(df1$Tea)), min(na.omit(df1$Tea)))) - ejy,
                                                      max(c(max(na.omit(df1$Tea)), max(na.omit(df1$Tea)))) + ejy),
                                           expand = c(0, 0)) +
                        geom_point()  +
                        theme_bw()+ 
                        geom_text(aes(label=round(Tea,1)), colour="black", size=3)
        }
        
}

#Función que extrae el nombre de los paises que han participado en el proyecto GEM
#(Solo extrae los nombres de los dos periodos donde participaron más paises, 
#esto sugiere que potencialmente pueden haber más paises)
nombre_paises <- function(){
        
        #Creo una lista que me permite observar la cantidad de paises que han participado por año
        mm <- lapply(1:15, function(x){bdu1[[x]][,1]})
        
        #En los años 2013 y 2014 es donde hay mayor presencia de países.
        m1 <- mm[[13]]
        m2 <- mm[[14]]
        
        
        #El siguiente código me permite determinar si hay paises que participaron en el 2014
        #no lo hicieron en el 2013, y viceversa.
        g <- character()
        
        for (ii in 1:70) {
                for(jj in 1:70){
                        if(m1[ii] == m2[jj]){
                                g[ii] <- m1[ii]
                        }
                }
        }
        
        g[70] <- NA
        g <- as.character(g)
        h <- 1:70
        j <- data.frame(g, h)
        sel <- j[is.na(j$g),2]
        m3 <- m1[sel]
        m4 <- c(m3, m2)
        nombres <- m4[order(m4)]
        nombres <- c("a_nivel_mundial", nombres)
        nombres
}

#Función que grafica la disparidad de género: disparidad = TeaMas / TeaFem
library(ggplot2)
disparidad <- function(nacion = "a_nivel_mundial", lin = 0, ejx = 0, ejy = 0){
        if(nacion == "a_nivel_mundial"){
                #Función que recibe una lista, creada previamente con el codigo anterior
                #y luego grafica la brecha de género para todos los paises
                dis <- sapply(bdu1, function(x)
                {mean(as.numeric(x[,c("disp")]))})
                
                tiempo <- rep(2001:2015)
                
                df1 <- data.frame(Disparidad = dis, Periodo = tiempo)
                g1 <- ggplot(df1, aes(x = tiempo, y = dis))
                g1 + geom_line(size = lin) +
                        xlab("Tiempo") +  ylab("Disparidad") + 
                        scale_x_continuous(limits = c(df1$Periodo[1] - ejx, df1$Periodo[dim(df1)[1]] + ejx),
                                           expand = c(0, 0)) +
                        scale_y_continuous(limits = c(min(c(min(na.omit(df1$Disparidad)), min(na.omit(df1$Disparidad)))) - ejy,
                                                      max(c(max(na.omit(df1$Disparidad)), max(na.omit(df1$Disparidad)))) + ejy),
                                           expand = c(0, 0)) +
                        geom_point() + 
                        geom_text(aes(label=round(Disparidad,3)), colour="black", size=5)
                
                
        }else{
                
                #Crea un vector con la disparidad según el argumento nacion
                dis <- sapply(1:length(bdu1), function(x){
                        if(sum(bdu1[[x]]$Pais == nacion) == 0){
                                NA
                        }else{
                                bdu1[[x]][bdu1[[x]]$Pais == nacion,c("disp")]
                        }
                })
                
                
                #Se crea la base de datos sobre la cual se gráfica la disparidad según país
                df1 <- data.frame(Disparidad = dis, 
                                  Periodo = as.numeric(2001:2015))
                df1 <- na.omit(df1)
                
                #Se gráfica la disparidad según país
                ggplot(df1, aes(x=Periodo,y=Disparidad)) +
                        geom_line(size = lin) +
                        xlab("Tiempo") +  ylab("Disparidad") +
                        scale_x_continuous(limits = c(df1$Periodo[1] - ejx, df1$Periodo[dim(df1)[1]] + ejx),
                                           expand = c(0, 0)) +
                        scale_y_continuous(limits = c(min(c(min(na.omit(df1$Disparidad)), min(na.omit(df1$Disparidad)))) - ejy,
                                                      max(c(max(na.omit(df1$Disparidad)), max(na.omit(df1$Disparidad)))) + ejy),
                                           expand = c(0, 0)) +
                        geom_point() + 
                        geom_text(aes(label=round(Disparidad,3)), colour="black", size=5)
        }
        
}

#Función que imprime estadística descriptiva por género, hace uso de la
#función describeBy del paquete psych
library(psych)
Est_x_genero <- function(nacion = "a_nivel_mundial"){
        
        if(nacion == "a_nivel_mundial"){
                #Captura los Tea masculino
                bd <- lapply(bdu1, function(x){ x[, c("Teayymal")]})
                h <- as.numeric(unlist(bd))
                
                #Captura los Tea femenino
                bd2 <- lapply(bdu1, function(x){ x[, c("Teayyfem")]})
                m <- as.numeric(unlist(bd2))
                
                #Captura los periodo
                bd1 <- lapply(bdu1, function(x){x[, c("periodo")]})
                p <- unlist(bd1)
                
                #Crea un data frame
                df <- data.frame(Tea = c(m, h),
                                 Gen = c(rep("Femenino", length(m)), rep("Masculino", length(h))),
                                 Periodo = c(p, p))
                
                #Estadística descriptiva para el género elegido por año
                describeBy(df$Tea, list(df$Gen, df$Periodo))
        }else{
                
                #Crea la base de datos según el argumento nación
                fem <- unlist(sapply(bdu1, function(x){x[x[, c("Pais")] == nacion, c("Teayyfem")]}))
                m <- as.numeric(fem)
                mas <- unlist(sapply(bdu1, function(x){x[x[, c("Pais")] == nacion, c("Teayymal")]}))
                h <- as.numeric(mas)
                
                df <- data.frame(Tea = c(m, h), 
                                 Gen = c(rep("Femenino", length(m)), rep("Masculino", length(h))))
                
                #Imprime la estadística descriptiva por país
                describeBy(df$Tea, df$Gen)
        }
        
}

#Función que imprime estadística descriptiva para la disparidad de género
#a nivel mundial
Est_disp <- function(nacion = "a_nivel_mundial"){
        if(nacion == "a_nivel_mundial"){
                
                #Extre la disparidad a nivel mundial
                dis <- unlist(lapply(bdu1, function(x){x[, c("disp")]}))
                dis <- as.numeric(dis)
                
                #Estrae los años para cada disparidad
                per <- unlist(lapply(bdu1, function(x){x[, c("periodo")]}))
                per <- as.numeric(per)
                
                #Crea el data.frame sobre donde se apllicara la estadística
                df <- data.frame(dis, per)
                
                #Función para la estadistica descriptiva
                describeBy(df$dis, df$per)
                
        }else{
                
                #Extrae la dispar por nación
                dis <- unlist(lapply(bdu1, function(x){x[x[c("Pais")] == nacion, c("disp")]}))
                dis <- as.numeric(dis)
                
                #Calcula la estadística descriptiva
                summary(dis)
        }
}

#Función que imprime el resultado de la función summary(), luego de 
#aplicar un logistic model
model1 <- function(nacion = "a_nivel_mundial"){
        if(nacion == "a_nivel_mundial"){
                summary(glm(formula = TEAyy ~ gender*age + I(age^2) + gender*GEMEDUC + gender*GEMWORK3 + gender*GEMHHINC +
                                    gender*opport + gender*suskill + gender*fearfail + gender*nbgoodc + 
                                    gender*nbstatus +  gender*knowent + gender*nbmedia, 
                            family = "binomial", data = bdu3))
                
        }else{
                bdu4 <- bdu3[bdu3$country == nacion, ]
                summary(glm(formula = TEAyy ~ gender*age + I(age^2) + gender*GEMEDUC + gender*GEMWORK3 + gender*GEMHHINC +
                                    gender*opport + gender*suskill + gender*fearfail + gender*nbgoodc + 
                                    gender*nbstatus +  gender*knowent + gender*nbmedia, 
                            family = "binomial", data = bdu4))
        }
}



