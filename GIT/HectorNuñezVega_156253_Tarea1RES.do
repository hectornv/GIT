log using "/Users/HectorNV/Desktop/Itam/Maestría Eco Ap./Econometría Aplicada l/Taller/Tarea 1/HectorNuñezVega_156253_Tarea1RES.log", replace 

clear

/* ======================

DEFINIR LAS RUTAS DE ARCHIVOS Y GUARDADO

========================*/

global main "/Users/HectorNV/Desktop/Itam/Maestría Eco Ap./Econometría Aplicada l/Taller"
global tarea "/Users/HectorNV/Desktop/Itam/Maestría Eco Ap./Econometría Aplicada l/Taller/Tarea 1"


/* ======================

PREGUNTA 1

========================*/

*Inciso a


* BASE DE DATOS BONOS

import excel "$main/Bonos.xlsx", firstrow


*ANALISIS DE VARIABLES Y FORMATO CORRECTO/INCORRECTO

describe

	/* Deberian ser numeric y son de clase string: 
	- obs
	-maturity
	-rate
	-spread
	-amt
	-quorum
	-paymentvote
	-acceleration
	-reverseacc
	-npexcep
Deberian ser Dummy variable -numeric-.
	-arbitration
	-secured */
	

*Inciso b

/* CONVERTIR LAS STRING A NUMERICAS*/

encode obs, gen(n_obs) label("Obs num")

encode rate, gen(n_rate) label("Rate num")

replace spread ="" if spread == "&&"
gen n_spread = real(spread)
label variable n_spread "Spread num"

encode amt, gen(n_amt) label("Amt num")

encode quorum, gen(n_quorum) label("quorum num")

encode paymentvote, gen(n_paymentvote) label("paymentvote num")

encode acceleration, gen(n_acceleration) label("acceleration num")

encode reverseacc, gen(n_reverseacc) label("reverseacc num")

encode npexcep, gen(n_npexcep) label("npexcep num")

encode arbitration, gen(n_arbitration) label("arbitration num")

encode secured, gen(n_secured) label("secured num")


*Inciso c

keep obs year n_spread aaa aa a bb b num_lawyers2 rep_ic_size curr rep_ic_top2 rep_ic_top2_ny rep_ic_top2_eng lnamt years highrate2 hh_index_ib hh_index_ib_eng hh_index_ib_ny 

*Inciso d

keep if year >= 1947

*Inciso e

summarize n_spread

tab n_spread

*El menor spread que hay es de -7.23% y el mayor es de casi 50.93%. Por otro lado, la mediana se encuentra en el 1.77. 


summarize aaa aa a bb b 

tab aaa

tab aa

tab a

tab bb

tab b

/* BONOS:

AAA:
	- Media: 0.1340965
	- Frecuencia: 164/1223 
	- Representan: 13.41%
AA:
	- Media: 0.1896975
	-Frecuencia: 232/1223
	-Representan: 18.97%

A:
	- Media: 0.154538
	-Frecuencia: 189/1223
	-Representan: 15.45%

BB:
	- Media: 0.258381
	-Frecuencia: 316/1223
	-Representan: 25.84%
	
B:
	- Media: 0.1275552
	-Frecuencia: 156/1223
	-Representan: 12.76%

*/


summarize num_lawyers2

tab num_lawyers2

/*

FIRMA DE ABOGADOS:
	-Promedio:  1.287356 ≈ 1
	- 12.98% no se respaldo en ni una firma.
	- 45.30% se respaldaron en una firma.
	- 41.72% se respaldaron en dos firmas.
	- 

*/


summarize rep_ic_size rep_ic_top2 rep_ic_top2_eng rep_ic_top2_ny

tab rep_ic_size

tab rep_ic_top2

tab rep_ic_top2_eng

tab rep_ic_top2_ny

/*

TAMAÑO DE EMISIONES DE LOS BONOS:
	- Media rep_ic_size: 0.1363023
		- Representan: 13.63%
	- Media rep_ic_top2: 0.2638132
		- Representan:  26.38%
	
	BAJO LEYES EXTRANJERAS
	- Inglaterra: 0.1797665
		- Representan: 17.98%
	- Nueva York: 0.2638132 
		- Representan: 26.38%

*/

summarize curr

tab curr

/*
MONEDAS QUE REPRESENTAN PORCENTAJES IMPORTANTES DE EMISIONES:
	- US DOLLAR: 64.25%
	- EURO: 15.64%
	- DM: 7.58%
*/

summarize lnamt

tab lnamt

/*

MONTOS DE EMISION MAS USADOS -LOG-
	- 6.90776 en 152 ocasiones ≈ 12.05%
	- 6.21461 en 132 ocasiones ≈ 10.47%
	- 4.60517 en 84 ocasiones ≈ 6.66%
	- 5.29832 en 72 ocasiones ≈ 5.71%
	- 5.52146 en 72 ocasiones ≈ 5.71%
*/

summarize hh_index_ib hh_index_ib_eng hh_index_ib_ny

tab hh_index_ib

tab hh_index_ib_eng

tab hh_index_ib_ny


/*

INDICES DE AGLOMERACION
	-Indice
		- Media: .0409696
		- Maximo: .1009
		- Mediana: .0363 < M < .0417
	-Indice Ingles
		- Media: .0367208
		- Maximo: 0
		- Mediana: .0277 < M < .0314
	-Indice NY
		- Media: .0677846
		- Maximo: .1457
		- Mediana: .0647 < M < .0683

*/

*GUARDAR LOS DATOS COMO .DTA

save "/Users/HectorNV/Desktop/Itam/Maestría Eco Ap./Econometría Aplicada l/Taller/Tarea 1/Datos_Bonos.dta", replace

/* ======================

PREGUNTA 2

========================*/


* BASE DE DATOS BONOS

*import excel "$main/Bonos2.xlsx", firstrow

*GUARDAR LOS DATOS COMO .DTA

*save "/Users/HectorNV/Desktop/Itam/Maestría Eco Ap./Econometría Aplicada l/Taller/Tarea 1/Datos_Bonos2.dta", replace

*cd "/Users/HectorNV/Desktop/Itam/Maestría Eco Ap./Econometría Aplicada l/Taller"

merge m:m obs using "/Users/HectorNV/Desktop/Itam/Maestría Eco Ap./Econometría Aplicada l/Taller/Tarea 1/Datos_Bonos2.dta"

* Inciso a


/*

Son string y deberian ser numeric: standarddeviationofexportgrowth, reservesshorttermdebt y obs de nuevo. 

*/


* Inciso b

*Inciso b

/* CONVERTIR LAS STRING A NUMERICAS*/

replace standarddeviationofexportgrowth ="" if standarddeviationofexportgrowth == "&&"

replace reservesshorttermdebt ="" if reservesshorttermdebt == "&&"


encode obs, gen(n_obs) label("Obs num")

encode standarddeviationofexportgrowth, gen(n_std_exp_growth) label("Rate Std")

encode reservesshorttermdebt, gen(n_reservesshorttermdebt) label("reservesshorttermdebt num")

*Inciso c

summarize debtserviceexports gdpgrowth n_std_exp_growth n_reservesshorttermdebt ratioofshorttermdebttototaldebt ratioofdomesticcredittogdp ratioofreservesimports debtrescheduledinpreviousyear ratioofreservesgdp standarddeviationofexportgrowth2


tab debtserviceexports

/*

debtserviceexports
	- Media: 11.05489
	- Std. Dev: 16.58627
	- Min: 0
	- Max: 120.186


*/

tab gdpgrowth 

/*

gdpgrowth
	- Media: .0070874
	- Std. Dev: .0094286
	- Min: -.039871
	- Max: .041981

*/

tab n_std_exp_growth

/*

n_std_exp_growth
	- Media: 282.1256
	- Std. Dev: 165.7886
	- Min: 1
	- Max: 567

*/

tab n_reservesshorttermdebt

/*

n_reservesshorttermdebt
	- Media: 62.19635
	- Std. Dev: 84.49453
	- Min: 1
	- Max: 282

*/

tab ratioofshorttermdebttototaldebt

/*

ratioofshorttermdebttototaldebt
	- Media:  7.830423
	- Std. Dev: 11.07384
	- Min: 0
	- Max: 63.1578

*/

tab ratioofdomesticcredittogdp

/*

ratioofdomesticcredittogdp
	- Media: 68.42651
	- Std. Dev: 53.39112
	- Min: -1.49
	- Max: 313

*/

tab ratioofreservesimports

/*

ratioofreservesimports
	- Media: 27.73291
	- Std. Dev: 23.17948
	- Min: 0
	- Max: 148.246

*/

tab debtrescheduledinpreviousyear

/*

debtrescheduledinpreviousyear
	- Media: .0640074
	- Std. Dev: .2448798 
	- Min: 0
	- Max: 1

*/

tab ratioofreservesgdp

/*

ratioofreservesgdp
	- Media: 10.91103
	- Std. Dev: 9.103049
	- Min: 0
	- Max: 82.2126

*/

tab standarddeviationofexportgrowth2

/*

standarddeviationofexportgrowth2
	- Media: 294.8625
	- Std. Dev: 589.5089
	- Min: 6.58409
	- Max: 10544.2

*/

/* ======================

PREGUNTA 3

========================*/

scatter gdpgrowth year

*Se observa que el mayor nivel de crecimiento del PIB se dio alrededor del 2005 y el nivel mas bajo se da en el 2008-2009. Seria de esperarse el mas bajo dada la crisis hipotecaria que acontecio en esas fechas.

histogram lnamt, frequency normal
*Se observa que los montos de emisiones parecen seguir una distribucion normal. Donde un valor ≈ 7 (6.90776) es el que mas se repite (se observa con mayor frecuencia).

graph bar ratioofreservesgdp, over(year)scale(*.28)

*Se observa que cuando mayor es el ratio de reservas/gdp es en el 2009, esto se puede entender dada la disminucion que se observa anteriormente en el diagrama de dispersion sobre el PIB en el año 2009. 

/* ======================

PREGUNTA 4

========================*/

*Inciso a

*Seccion 1
gen num_lawyers_2 = num_lawyers2==2 

*Seccion 2
gen num_lawyers_0 = num_lawyers2==0 

*Seccion 3
replace rep_ic_size= 0 if num_lawyers2 == 0




*Inciso b y c 

regress n_spread aaa aa a bb b num_lawyers_2 num_lawyers_0 

*Linealidad
acprplot aaa, lowess
acprplot aa, lowess
acprplot a, lowess
acprplot bb, lowess
acprplot b, lowess
acprplot num_lawyers_2, lowess
acprplot num_lawyers_0, lowess

*Homocedasticidad
rvfplot, yline(0)
estat hettest

*Los residuos no son homogeneos en lo absoluto.

*Variables Omitidas
ovtest

*Se necesitan mas variables, pues existe un sesgo por variable omitida. Se rechaza H0.

*Especificacion
linktest 

*No se rechaza la nula, el modelo esta bien especificado.

*Multicolinealidad
vif 

*No hay existencia de colinealidad en el modelo. 


*Outliers
avplots

*Se puede observar la presencia de outliers.


*Normalidad de los errores
predict e, resid

kdensity e, normal

histogram e, kdensity normal

qnorm e

swilk e

*No tienen (los errores) un comportamiento de una normal, ya se puede ver mas leptocurtica.




regress n_spread num_lawyers_2 num_lawyers_0

*Linealidad 
acprplot num_lawyers_2, lowess
acprplot num_lawyers_0, lowess


*Homocedasticidad
rvfplot, yline(0)
estat hettest

*Los residuos no son homogeneos en lo absoluto.

*Variables Omitidas
*ovtest

*No se puede realizar, pues se necesitan mas variables que no sean dummies, pues existiria un sesgo provocado por "the dummy trap". 

*Especificacion
linktest 

*No se rechaza la nula, el modelo esta bien especificado (_hatsq no es significativo).

*Multicolinealidad
vif 

*No hay existencia de colinealidad en el modelo. 


*Outliers
avplots

*Se puede observar la presencia de outliers (dos para ser precisos).


*Normalidad de los errores
predict E, resid

kdensity E, normal

histogram E, kdensity normal

qnorm E

swilk E

*No tienen (los errores) un comportamiento de una normal, ya se puede ver mas leptocurtica al igual que en la del modelo pasado.


*Inciso d

/*
Modelo 1: Tiene un bajo coeficiente de determinacion (R^2), aunque en terminos de significancia individual, todas las variables incorporadas en el modelo, salvo num_lawyers_2, son significativas. 

Modelo 2: El modelo dos tiene un menor valor aun que el modelo 1 de R^2, aunque en este modelo ya presentan significancia individual todas las variables incorporadas, aun considerando que incorpora num_lawyers_2, que en el modelo 1 no fue significativa.

En el caso de ambos modelos, se pueden observar problemas de existencia de outliers, no normalidad de los errores y heteroscedasticidad; sin embargo, no se observa existencia de colinealidad entre las variables. 

*/


/* ======================

PREGUNTA 5

========================*/

*Inciso a 

tabulate(year), generate(dyear)
tabulate(curr), generate(dcurr)

regress n_spread aaa aa a bb b num_lawyers_2 num_lawyers_0 rep_ic_top2_eng dcurr* dyear*, robust 

*Inciso b (asi para cada modelo)

regress n_spread aaa aa a bb b num_lawyers_2 num_lawyers_0 rep_ic_top2_eng dcurr* dyear*, robust 

*Inciso c (asi para cada modelo) 

*Linealidad
acprplot rep_ic_top2_eng, lowess
*acprplot dcurr*, lowess
*acprplot dyear*, lowess

*Homocedasticidad
rvfplot, yline(0)

*Los residuos no son homogeneos en lo absoluto, hay existencia de heteroscedasticidad.

*Variables Omitidas
ovtest

*No se necesitan mas variables. No se rechaza H0.

*Especificacion
linktest 

*No se rechaza la nula, el modelo esta bien especificado.

*Multicolinealidad
vif 

*De dcurr9-dcurr42 generan colinealidad.

*Outliers
*avplots

*No se abrio nada.


*Normalidad de los errores
predict H, resid

kdensity H, normal

histogram H, kdensity normal

qnorm H

swilk H

*No tienen (los errores) un comportamiento de una normal, ya se puede ver mas leptocurtica.



regress n_spread aaa aa a bb b num_lawyers_2 num_lawyers_0 rep_ic_top2_ny dcurr* dyear*, robust 

*Linealidad
acprplot rep_ic_top2_ny, lowess
*acprplot dcurr*, lowess
*acprplot dyear*, lowess

*Se traba por ser muchas.


*Homocedasticidad
rvfplot, yline(0)
*estat hettest

*Los residuos no son homogeneos en lo absoluto, se observa heteroscedasticidad.

*Variables Omitidas
ovtest

*No se necesitan mas variables. No se rechaza H0.

*Especificacion
linktest 

*No se rechaza la nula, el modelo esta bien especificado.

*Multicolinealidad
vif 

*De dcurr9-dcurr42 generan colinealidad.


*Outliers
*avplots


*Normalidad de los errores
predict h, resid

kdensity h, normal

histogram h, kdensity normal

qnorm h

swilk h

*No tienen (los errores) un comportamiento de una normal, ya que se puede ver mas leptocurtica.




regress n_spread num_lawyers_2 num_lawyers_0 dcurr* dyear* rep_ic_top2_eng, robust
*Linealidad
acprplot rep_ic_top2_eng, lowess
*acprplot dcurr*, lowess
*acprplot dyear*, lowess

*Se traba por ser muchas.

*Homocedasticidad
rvfplot, yline(0)
*estat hettest

*Los residuos no son homogeneos en lo absoluto.

*Variables Omitidas
ovtest

*No se necesitan mas variables. No se rechaza H0.

*Especificacion
linktest 

*El modelo esta mal especificado.

*Multicolinealidad
vif 

*De dcurr23-dcurr42 generan colinealidad.

*Outliers
*avplots



*Normalidad de los errores
predict G, resid

kdensity G, normal

histogram G, kdensity normal

qnorm G

swilk G

*No tienen (los errores) un comportamiento de una normal, ya se puede ver mas leptocurtica.



regress n_spread num_lawyers_2 num_lawyers_0 dcurr* dyear* rep_ic_top2_ny, robust


*Linealidad
acprplot rep_ic_top2_ny, lowess
*acprplot dcurr*, lowess
*acprplot dyear*, lowess

*Se traba por ser muchas.

*Homocedasticidad
rvfplot, yline(0)
*estat hettest

*Los residuos no son homogeneos en lo absoluto.

*Variables Omitidas
ovtest

*No se necesitan mas variables. No se rechaza H0.

*Especificacion
linktest 

*Esta muy mal especificado el modelo.

*Multicolinealidad
vif 

*De dcurr23-dcurr42 generan colinealidad.


*Outliers
*avplots


*Normalidad de los errores
predict g, resid

kdensity g, normal

histogram g, kdensity normal

qnorm g

swilk g

*No tienen (los errores) un comportamiento de una normal, ya se puede ver mas leptocurtica.



/* ======================

PREGUNTA 6

========================*/

regress n_spread aaa aa a bb b num_lawyers_2 num_lawyers_0 rep_ic_top2_eng dcurr* dyear* highrate2 rep_ic_size hh_index_ib hh_index_ib_eng hh_index_ib_ny debtrescheduledinpreviousyear debtserviceexports gdpgrowth ratioofdomesticcredittogdp ratioofreservesgdp ratioofreservesimports, robust 



regress n_spread aaa aa a bb b num_lawyers_2 num_lawyers_0 rep_ic_top2_ny dcurr* dyear* highrate2 rep_ic_size hh_index_ib hh_index_ib_eng hh_index_ib_ny debtrescheduledinpreviousyear debtserviceexports gdpgrowth ratioofdomesticcredittogdp ratioofreservesgdp ratioofreservesimports, robust  


/*
No es concluyente y no sirve el modelo por el nivel tan elevado del coeficiente de determinacion, probablemente esta situacion se presente porque no es nada parsimonioso el modelo, ya que incluye todo.
*/


/* ======================

PREGUNTA 7

========================*/


probit rep_ic_top2 lnamt years highrate2 hh_index_ib num_lawyers2 year 

generate rep_ic_top2_Predict = _b[_cons] + _b[lnamt]*lnamt + _b[years]*years + _b[highrate2]*highrate2 + _b[hh_index_ib]*hh_index_ib + _b[num_lawyers2]*num_lawyers2 + _b[year]*year

*drop rep_ic_top2_Predict

*predict rep_ic_top2_Predict
*label variable rep_ic_top2_Predict "rep_ic_top2 predicted"

scatter rep_ic_top2 rep_ic_top2_Predict

*Inciso a

gen lambda_p = normalden(rep_ic_top2_Predict)/normal(rep_ic_top2_Predict)


*Inciso b


probit rep_ic_top2 lnamt years highrate2 hh_index_ib num_lawyers2 year lambda_p, robust

/*

Lambda sirve para quitar el sesgo por variable omitida, ya que simula aleatorizacion en la muestra. Es conocida como la correccion de Heckman para modelos probit. Al incluirla, se observa un ajuste en los valores de los coeficientes, en que ahora el test que realiza es un Wald Test en lugar de LR ya que se prueba la significancia conjunta, y la significancia de los distintos coeficientes cambia. Aunque lambda parezca no ser significativa, su relevancia radica en que el valor que toma es distinto a 0, como lo establece la teoria de Heckman cuando la incorpora a su modelo inicial de tipo probit. 

*/

log close














	
