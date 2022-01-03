# Práctica sobre el software plink

# Se limpia el espacio de trabajo ----
rm(list = ls())

# Se selecciona la carpeta donde estan los datos ----
setwd('/home/leo/Escritorio/github/Repo_TFM/Datos/')

# Se escribe una función que permite ejecutar plink en R de forma sencilla ----
plink <- function(PLINKopciones = '') system(paste('/home/leo/Escritorio/github/Repo_TFM/plink', PLINKopciones))

plink() # Al ejecutar esto en la consola aparecen las opciones del plink junto con la versión y todo lo demás, lo que indica que si es posible ejecutar el plink de esta forma.

##############################################
# 1. Software molcoanc para simular el pedigrí
##############################################

#### Población de arroz ADM ----

# Se extrae del archivo de genotipos (snps.bed) solo los individuos que hacen parte de la población ADM ---
plink('--bfile snps --keep Datos_ADM/Ind_ADM.txt --make-bed --out Datos_ADM/Ind_ADM') # El archivo con genotipo (snps) ya esta en formato binario (.bed), por lo que no fue necesario convertirlo a este formato (se sugiere convertir a formato binario ya que estos archivos de SNPs son muy grandes y su carga puede tomar tiempo, y para ahorrar espacio).

# Nota: Para cargar el archivo binario se uso --bfile en lugar del comando normalmente usado --file. Con --make-bed se indico crear de igual forma un archivo en formato binario llamado Ind_ADM donde se encuentra los archivos resultantes. Aquí se extrajeron solo los individuos indicados en Datos_ADM/Ind.txt, que corresponde a solo los individuos ADM. Con --out  Datos_ADM/Ind_ADM se indico guardar los resultados en la carpeta "Datos_ADM".

# Se filtra el archivo de genotipos anterior (Ind_ADM.bed) para eliminar los SNPs con MAF < 35% ----
plink('--bfile Datos_ADM/Ind_ADM --maf 0.35 --make-bed --out Datos_ADM/frec_0.35_ADM')

# Se seleccionan al azar 1000 marcadores (o SNPs) del archivo anteriormente creado (frec_0.35_ADM.bed) ----
plink('--bfile Datos_ADM/frec_0.35_ADM --thin 0.0466243 --make-bed --out Datos_ADM/nSNPs_ADM') # Se indica que el número de SNPs (variantes) ahora es de 980 (aunque seguramente esto cambiara debido a que no se establecio una semilla como se hace en R) y el número de individuos ADM es de 29.

# Nota: Para seleccionar al azar los 1000 marcadores se uso -- thin y el valor de 0.0466243 se obtuvo mediante regla de tres (1000x100)/21448; 21448 corresponde a las 21448 veriantes que quedaron del paso anterior.

#### Población de arroz ARO ----

# Se extrae del archivo de genotipos (snps.bed) solo los individuos que hacen parte de la población ARO ---
plink('--bfile snps --keep Datos_ARO/Ind_ARO.txt --make-bed --out Datos_ARO/Ind_ARO')

# Se filtra el archivo de genotipos anterior (Ind_ARO.bed) para eliminar los SNPs con MAF < 35% ----
plink('--bfile Datos_ARO/Ind_ARO --maf 0.35 --make-bed --out Datos_ARO/frec_0.35_ARO')

# Se seleccionan al azar 1000 marcadores (o SNPs) del archivo anteriormente creado (frec_0.35_ARO.bed) ----
plink('--bfile Datos_ARO/frec_0.35_ARO --thin 0.0568085 --make-bed --out Datos_ARO/nSNPs_ARO') # Se indica que el número de SNPs (variantes) ahora es de 1012 (aunque seguramente esto cambiara debido a que no se establecio una semilla como se hace en R) y el número de individuos ARO es de 17.

# Nota: El valor de 0.0568085 se obtuvo mediante regla de tres (1000x100)/17603; 17603 corresponde a las 17603 veriantes que quedaron del paso anterior.

#### Población de arroz AUS ----

# Se extrae del archivo de genotipos (snps.bed) solo los individuos que hacen parte de la población AUS ---
plink('--bfile snps --keep Datos_AUS/Ind_AUS.txt --make-bed --out Datos_AUS/Ind_AUS')

# Se filtra el archivo de genotipos anterior (Ind_AUS.bed) para eliminar los SNPs con MAF < 35% ----
plink('--bfile Datos_AUS/Ind_AUS --maf 0.35 --make-bed --out Datos_AUS/frec_0.35_AUS')

# Se seleccionan al azar 1000 marcadores (o SNPs) del archivo anteriormente creado (frec_0.35_AUS.bed) ----
plink('--bfile Datos_AUS/frec_0.35_AUS --thin 0.04989273 --make-bed --out Datos_AUS/nSNPs_AUS') # Se indica que el número de SNPs (variantes) ahora es de 954 (aunque seguramente esto cambiara debido a que no se establecio una semilla como se hace en R) y el número de individuos AUS es de 75.

# Nota: El valor de 0.04989273 se obtuvo mediante regla de tres (1000x100)/20043; 20043 corresponde a las 20043 veriantes que quedaron del paso anterior.

#### Población de arroz IND ----

# Se extrae del archivo de genotipos (snps.bed) solo los individuos que hacen parte de la población IND ---
plink('--bfile snps --keep Datos_IND/Ind_IND.txt --make-bed --out Datos_IND/Ind_IND')

# Se filtra el archivo de genotipos anterior (Ind_IND.bed) para eliminar los SNPs con MAF < 35% ----
plink('--bfile Datos_IND/Ind_IND --maf 0.35 --make-bed --out Datos_IND/frec_0.35_IND')

# Se seleccionan al azar 1000 marcadores (o SNPs) del archivo anteriormente creado (frec_0.35_IND.bed) ----
plink('--bfile Datos_IND/frec_0.35_IND --thin 0.06054368 --make-bed --out Datos_IND/nSNPs_IND') # Se indica que el número de SNPs (variantes) ahora es de 1007 (aunque seguramente esto cambiara debido a que no se establecio una semilla como se hace en R) y el número de individuos IND es de 451.

# Nota: El valor de 0.06054368 se obtuvo mediante regla de tres (1000x100)/16517; 16517 corresponde a las 16517 veriantes que quedaron del paso anterior.

#### Población de arroz JAP ----

# Se extrae del archivo de genotipos (snps.bed) solo los individuos que hacen parte de la población JAP ---
plink('--bfile snps --keep Datos_JAP/Ind_JAP.txt --make-bed --out Datos_JAP/Ind_JAP')

# Se filtra el archivo de genotipos anterior (Ind_JAP.bed) para eliminar los SNPs con MAF < 35% ----
plink('--bfile Datos_JAP/Ind_JAP --maf 0.35 --make-bed --out Datos_JAP/frec_0.35_JAP')

# Se seleccionan al azar 1000 marcadores (o SNPs) del archivo anteriormente creado (frec_0.35_JAP.bed) ----
plink('--bfile Datos_JAP/frec_0.35_JAP --thin 0.08162599 --make-bed --out Datos_JAP/nSNPs_JAP') # Se indica que el número de SNPs (variantes) ahora es de 1005 (aunque seguramente esto cambiara debido a que no se establecio una semilla como se hace en R) y el número de individuos JAP es de 166.

# Nota: El valor de 0.08162599 se obtuvo mediante regla de tres (1000x100)/12251; 12251 corresponde a las 12251 veriantes que quedaron del paso anterior.

###########################################################################################################
# 2. Calculo de la matriz de parentesco genómico en las diferentes subpoblaciones de individuos genotipados
###########################################################################################################

#### Población de arroz IND ----

## 1. Subpoblación con 98 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 98 individuos genotipados que hacen parte de la población IND ---
plink('--bfile snps --keep Datos_IND/mG/mG_1/subpob_IND.txt --make-bed --out Datos_IND/mG/mG_1/Ind_IND')

# Se filtra el archivo de genotipos anterior (Ind_IND.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_IND/mG/mG_1/Ind_IND --maf 0.05 --make-bed --out Datos_IND/mG/mG_1/frec_0.05_IND') # De este procedimiento, quedan 102836 variantes (o SNPs) de 98 individuos.

## 2. Subpoblación con 148 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 148 individuos genotipados que hacen parte de la población IND ---
plink('--bfile snps --keep Datos_IND/mG/mG_2/subpob_IND.txt --make-bed --out Datos_IND/mG/mG_2/Ind_IND')

# Se filtra el archivo de genotipos anterior (Ind_IND.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_IND/mG/mG_2/Ind_IND --maf 0.05 --make-bed --out Datos_IND/mG/mG_2/frec_0.05_IND') # De este procedimiento, quedan 100662 variantes (o SNPs) de 148 individuos.

## 3. Subpoblación con 198 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 198 individuos genotipados que hacen parte de la población IND ---
plink('--bfile snps --keep Datos_IND/mG/mG_3/subpob_IND.txt --make-bed --out Datos_IND/mG/mG_3/Ind_IND')

# Se filtra el archivo de genotipos anterior (Ind_IND.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_IND/mG/mG_3/Ind_IND --maf 0.05 --make-bed --out Datos_IND/mG/mG_3/frec_0.05_IND') # De este procedimiento, quedan 101997 variantes (o SNPs) de 198 individuos.

## 4. Subpoblación con 248 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 248 individuos genotipados que hacen parte de la población IND ---
plink('--bfile snps --keep Datos_IND/mG/mG_4/subpob_IND.txt --make-bed --out Datos_IND/mG/mG_4/Ind_IND')

# Se filtra el archivo de genotipos anterior (Ind_IND.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_IND/mG/mG_4/Ind_IND --maf 0.05 --make-bed --out Datos_IND/mG/mG_4/frec_0.05_IND') # De este procedimiento, quedan 100620 variantes (o SNPs) de 248 individuos.

## 5. Subpoblación con 298 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 298 individuos genotipados que hacen parte de la población IND ---
plink('--bfile snps --keep Datos_IND/mG/mG_5/subpob_IND.txt --make-bed --out Datos_IND/mG/mG_5/Ind_IND')

# Se filtra el archivo de genotipos anterior (Ind_IND.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_IND/mG/mG_5/Ind_IND --maf 0.05 --make-bed --out Datos_IND/mG/mG_5/frec_0.05_IND') # De este procedimiento, quedan 101394 variantes (o SNPs) de 298 individuos.

## 6. Subpoblación con 348 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 348 individuos genotipados que hacen parte de la población IND ---
plink('--bfile snps --keep Datos_IND/mG/mG_6/subpob_IND.txt --make-bed --out Datos_IND/mG/mG_6/Ind_IND')

# Se filtra el archivo de genotipos anterior (Ind_IND.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_IND/mG/mG_6/Ind_IND --maf 0.05 --make-bed --out Datos_IND/mG/mG_6/frec_0.05_IND') # De este procedimiento, quedan 100955 variantes (o SNPs) de 348 individuos.

## 7. Subpoblación con 398 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 398 individuos genotipados que hacen parte de la población IND ---
plink('--bfile snps --keep Datos_IND/mG/mG_7/subpob_IND.txt --make-bed --out Datos_IND/mG/mG_7/Ind_IND')

# Se filtra el archivo de genotipos anterior (Ind_IND.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_IND/mG/mG_7/Ind_IND --maf 0.05 --make-bed --out Datos_IND/mG/mG_7/frec_0.05_IND') # De este procedimiento, quedan 101176 variantes (o SNPs) de 398 individuos.

## 8. Subpoblación con 451 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 451 individuos genotipados que hacen parte de la población IND ---
plink('--bfile snps --keep Datos_IND/mG/mG_8/subpob_IND.txt --make-bed --out Datos_IND/mG/mG_8/Ind_IND')

# Se filtra el archivo de genotipos anterior (Ind_IND.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_IND/mG/mG_8/Ind_IND --maf 0.05 --make-bed --out Datos_IND/mG/mG_8/frec_0.05_IND') # De este procedimiento, quedan 100231 variantes (o SNPs) de 451 individuos.

#### Población de arroz JAP ----

## 1. Subpoblación con 41 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 41 individuos genotipados que hacen parte de la población JAP ---
plink('--bfile snps --keep Datos_JAP/mG/mG_1/subpob_JAP.txt --make-bed --out Datos_JAP/mG/mG_1/Ind_JAP')

# Se filtra el archivo de genotipos anterior (Ind_JAP.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_JAP/mG/mG_1/Ind_JAP --maf 0.05 --make-bed --out Datos_JAP/mG/mG_1/frec_0.05_JAP') # De este procedimiento, quedan 67397 variantes (o SNPs) de 41 individuos.

## 2. Subpoblación con 58 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 58 individuos genotipados que hacen parte de la población JAP ---
plink('--bfile snps --keep Datos_JAP/mG/mG_2/subpob_JAP.txt --make-bed --out Datos_JAP/mG/mG_2/Ind_JAP')

# Se filtra el archivo de genotipos anterior (Ind_JAP.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_JAP/mG/mG_2/Ind_JAP --maf 0.05 --make-bed --out Datos_JAP/mG/mG_2/frec_0.05_JAP') # De este procedimiento, quedan 76085 variantes (o SNPs) de 58 individuos.

## 3. Subpoblación con 75 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 75 individuos genotipados que hacen parte de la población JAP ---
plink('--bfile snps --keep Datos_JAP/mG/mG_3/subpob_JAP.txt --make-bed --out Datos_JAP/mG/mG_3/Ind_JAP')

# Se filtra el archivo de genotipos anterior (Ind_JAP.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_JAP/mG/mG_3/Ind_JAP --maf 0.05 --make-bed --out Datos_JAP/mG/mG_3/frec_0.05_JAP') # De este procedimiento, quedan 77844 variantes (o SNPs) de 75 individuos.

## 4. Subpoblación con 92 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los individuos 92 individuos genotipados que hacen parte de la población JAP ---
plink('--bfile snps --keep Datos_JAP/mG/mG_4/subpob_JAP.txt --make-bed --out Datos_JAP/mG/mG_4/Ind_JAP')

# Se filtra el archivo de genotipos anterior (Ind_JAP.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_JAP/mG/mG_4/Ind_JAP --maf 0.05 --make-bed --out Datos_JAP/mG/mG_4/frec_0.05_JAP') # De este procedimiento, quedan 77270 variantes (o SNPs) de 92 individuos.

## 5. Subpoblación con 109 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los individuos 109 individuos genotipados que hacen parte de la población JAP ---
plink('--bfile snps --keep Datos_JAP/mG/mG_5/subpob_JAP.txt --make-bed --out Datos_JAP/mG/mG_5/Ind_JAP')

# Se filtra el archivo de genotipos anterior (Ind_JAP.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_JAP/mG/mG_5/Ind_JAP --maf 0.05 --make-bed --out Datos_JAP/mG/mG_5/frec_0.05_JAP') # De este procedimiento, quedan 77279 variantes (o SNPs) de 109 individuos.

## 6. Subpoblación con 126 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los individuos 126 individuos genotipados que hacen parte de la población JAP ---
plink('--bfile snps --keep Datos_JAP/mG/mG_6/subpob_JAP.txt --make-bed --out Datos_JAP/mG/mG_6/Ind_JAP')

# Se filtra el archivo de genotipos anterior (Ind_JAP.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_JAP/mG/mG_6/Ind_JAP --maf 0.05 --make-bed --out Datos_JAP/mG/mG_6/frec_0.05_JAP') # De este procedimiento, quedan 76705 variantes (o SNPs) de 126 individuos.

## 7. Subpoblación con 143 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los individuos 143 individuos genotipados que hacen parte de la población JAP ---
plink('--bfile snps --keep Datos_JAP/mG/mG_7/subpob_JAP.txt --make-bed --out Datos_JAP/mG/mG_7/Ind_JAP')

# Se filtra el archivo de genotipos anterior (Ind_JAP.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_JAP/mG/mG_7/Ind_JAP --maf 0.05 --make-bed --out Datos_JAP/mG/mG_7/frec_0.05_JAP') # De este procedimiento, quedan 75802 variantes (o SNPs) de 143 individuos.

## 8. Subpoblación con 166 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los individuos 166 individuos genotipados que hacen parte de la población JAP ---
plink('--bfile snps --keep Datos_JAP/mG/mG_8/subpob_JAP.txt --make-bed --out Datos_JAP/mG/mG_8/Ind_JAP')

# Se filtra el archivo de genotipos anterior (Ind_JAP.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_JAP/mG/mG_8/Ind_JAP --maf 0.05 --make-bed --out Datos_JAP/mG/mG_8/frec_0.05_JAP') # De este procedimiento, quedan 78857 variantes (o SNPs) de 166 individuos.

#### Población de arroz AUS ----

## 1. Subpoblación con 10 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 10 individuos genotipados que hacen parte de la población AUS ---
plink('--bfile snps --keep Datos_AUS/mG/mG_1/subpob_AUS.txt --make-bed --out Datos_AUS/mG/mG_1/Ind_AUS')

# Se filtra el archivo de genotipos anterior (Ind_AUS.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_AUS/mG/mG_1/Ind_AUS --maf 0.05 --make-bed --out Datos_AUS/mG/mG_1/frec_0.05_AUS') # De este procedimiento, quedan 86184 variantes (o SNPs) de 10 individuos.

## 2. Subpoblación con 19 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 19 individuos genotipados que hacen parte de la población AUS ---
plink('--bfile snps --keep Datos_AUS/mG/mG_2/subpob_AUS.txt --make-bed --out Datos_AUS/mG/mG_2/Ind_AUS')

# Se filtra el archivo de genotipos anterior (Ind_AUS.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_AUS/mG/mG_2/Ind_AUS --maf 0.05 --make-bed --out Datos_AUS/mG/mG_2/frec_0.05_AUS') # De este procedimiento, quedan 94790 variantes (o SNPs) de 19 individuos.

## 3. Subpoblación con 28 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 28 individuos genotipados que hacen parte de la población AUS ---
plink('--bfile snps --keep Datos_AUS/mG/mG_3/subpob_AUS.txt --make-bed --out Datos_AUS/mG/mG_3/Ind_AUS')

# Se filtra el archivo de genotipos anterior (Ind_AUS.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_AUS/mG/mG_3/Ind_AUS --maf 0.05 --make-bed --out Datos_AUS/mG/mG_3/frec_0.05_AUS') # De este procedimiento, quedan 82740 variantes (o SNPs) de 28 individuos.

## 4. Subpoblación con 37 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 37 individuos genotipados que hacen parte de la población AUS ---
plink('--bfile snps --keep Datos_AUS/mG/mG_4/subpob_AUS.txt --make-bed --out Datos_AUS/mG/mG_4/Ind_AUS')

# Se filtra el archivo de genotipos anterior (Ind_AUS.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_AUS/mG/mG_4/Ind_AUS --maf 0.05 --make-bed --out Datos_AUS/mG/mG_4/frec_0.05_AUS') # De este procedimiento, quedan 90542 variantes (o SNPs) de 37 individuos.

## 5. Subpoblación con 46 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 46 individuos genotipados que hacen parte de la población AUS ---
plink('--bfile snps --keep Datos_AUS/mG/mG_5/subpob_AUS.txt --make-bed --out Datos_AUS/mG/mG_5/Ind_AUS')

# Se filtra el archivo de genotipos anterior (Ind_AUS.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_AUS/mG/mG_5/Ind_AUS --maf 0.05 --make-bed --out Datos_AUS/mG/mG_5/frec_0.05_AUS') # De este procedimiento, quedan 86520 variantes (o SNPs) de 46 individuos.

## 6. Subpoblación con 55 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 55 individuos genotipados que hacen parte de la población AUS ---
plink('--bfile snps --keep Datos_AUS/mG/mG_6/subpob_AUS.txt --make-bed --out Datos_AUS/mG/mG_6/Ind_AUS')

# Se filtra el archivo de genotipos anterior (Ind_AUS.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_AUS/mG/mG_6/Ind_AUS --maf 0.05 --make-bed --out Datos_AUS/mG/mG_6/frec_0.05_AUS') # De este procedimiento, quedan 87809 variantes (o SNPs) de 55 individuos.

## 7. Subpoblación con 64 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 64 individuos genotipados que hacen parte de la población AUS ---
plink('--bfile snps --keep Datos_AUS/mG/mG_7/subpob_AUS.txt --make-bed --out Datos_AUS/mG/mG_7/Ind_AUS')

# Se filtra el archivo de genotipos anterior (Ind_AUS.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_AUS/mG/mG_7/Ind_AUS --maf 0.05 --make-bed --out Datos_AUS/mG/mG_7/frec_0.05_AUS') # De este procedimiento, quedan 89115 variantes (o SNPs) de 64 individuos.

## 8. Subpoblación con 75 individuos genotipados

# Se extrae del archivo de genotipos (snps.bed) solo los 75 individuos genotipados que hacen parte de la población AUS ---
plink('--bfile snps --keep Datos_AUS/mG/mG_8/subpob_AUS.txt --make-bed --out Datos_AUS/mG/mG_8/Ind_AUS')

# Se filtra el archivo de genotipos anterior (Ind_AUS.bed) para eliminar los SNPs con MAF < 5% ----
plink('--bfile Datos_AUS/mG/mG_8/Ind_AUS --maf 0.05 --make-bed --out Datos_AUS/mG/mG_8/frec_0.05_AUS') # De este procedimiento, quedan 89227 variantes (o SNPs) de 75 individuos.

########################################
# 3. Análisis de componentes principales
########################################

# Con opción --distance-matrix, se calcula la distnacia genética entre individuos.
plink('--bfile snps --distance-matrix --make-bed --out Datos_IND/PCA/PCA_IND') # De este procedimiento, se obtiene una matriz 738 x 738 individuos con las distancias individuales entre cada uno de ellos.
