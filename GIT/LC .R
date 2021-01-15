library(readr)
library(StatMeasures)
library(ineq)
library(writexl)
library(dplyr)
library(tidyverse)
install.packages("datos")
library(datos)


hogar<- read_csv('concentradohogar.csv')

View(hogar)

#Lorenz Curve por Género

plot(Lc(hogar$ing_cor[hogar$sexo_jefe==1]), main = "Lorenz Curve Hombres", col = 3)

plot(Lc(hogar$ing_cor[hogar$sexo_jefe==2]), main = "Lorenz Curve Mujeres", col= 2)

plot(Lc(hogar$ingtrab[hogar$sexo_jefe==1]), main = "Lorenz Curve Hombres", col = "grey")

plot(Lc(hogar$ingtrab[hogar$sexo_jefe==2]), main = "Lorenz Curve Mujeres", col= "hot pink")

#Lorenz Curve por región (rural o urbana)


