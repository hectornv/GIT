install.packages("devtools")
library(devtools)
install.packages("readxl")
library(readxl)
install.packages("xtable")
library(xtable)
install.packages("xlsx")
library(xlsx)

I_Marg<- read_excel("Documentos/Base_Indice_Marg.xls")
IMN<- I_Marg[,-1]
IMN<- IMN[,-(13:14)]

#Prueba del Índice Anterior
I_Marg 
IMViejo<- I_Marg[,3:11]
IMViejo
PCAV<- prcomp(IMViejo, scale = TRUE)
summary(PCAV)

#Se puede observar que el 71.35% de la varianza se explica por el primer componente.

biplot(x = PCAV, scale = 0, cex = 0.6, col = c("red", "dark blue"))
CP1<- PCAV$x[,1]
IM<- CP1/2.5340
IM

IMAntes<- I_Marg$IM
LUGAR<- I_Marg$NOM_ENT
LUGAR
ANTES<- as.data.frame(IMAntes,LUGAR)
ANTES

#Con el Índice Propuesto

pca <- prcomp(IMN[,2:12], scale = TRUE)
pca
biplot(x = pca, scale = 0, cex = 0.6, col = c("blue4", "dark green"))
SPCA<-summary(pca)
SPCA
#En el nuevo modelo el 68.14% de la varianza se explica por el primer componente.



CP1N<- pca$x[,1]
IMProp<- round(CP1N/2.7377,2)
IMProp
IMAntes

AVSA<- cbind(ANTES, IMProp)
AVSA
?xtable()
write.csv(AVSA)

