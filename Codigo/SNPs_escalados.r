#!/usr/bin/Rscript

pacman::p_load(here, genio, BEDMatrix, dplyr)

#### Población IND ----

## 1. Subpoblación con 98 individuos genotipados

bimsnps_IND <- read_bim(here('Datos', 'Datos_IND', 'mG', 'mG_1', 'frec_0.05_IND.bim'))
famsnps_IND <- read_fam(here('Datos', 'Datos_IND', 'mG', 'mG_1', 'frec_0.05_IND.fam'))
bedsnps_IND <- BEDMatrix(here('Datos', 'Datos_IND', 'mG', 'mG_1', 'frec_0.05_IND.bed'), n = length(famsnps_IND$id), p = length(bimsnps_IND$id), simple_names = FALSE)
snps_IND <- as.matrix(bedsnps_IND)

mG_1_esc <- scale(snps_IND) %>%
	saveRDS(here('Datos', 'Datos_IND', 'mG', 'mG_1', 'mG_1_esc.RDS'))

## 2. Subpoblación con 148 individuos genotipados

bimsnps_IND <- read_bim(here('Datos', 'Datos_IND', 'mG', 'mG_2', 'frec_0.05_IND.bim'))
famsnps_IND <- read_fam(here('Datos', 'Datos_IND', 'mG', 'mG_2', 'frec_0.05_IND.fam'))
bedsnps_IND <- BEDMatrix(here('Datos', 'Datos_IND', 'mG', 'mG_2', 'frec_0.05_IND.bed'), n = length(famsnps_IND$id), p = length(bimsnps_IND$id), simple_names = FALSE)
snps_IND <- as.matrix(bedsnps_IND)

mG_2_esc <- scale(snps_IND) %>%
	saveRDS(here('Datos', 'Datos_IND', 'mG', 'mG_2', 'mG_2_esc.RDS'))

## 3. Subpoblación con 198 individuos genotipados

bimsnps_IND <- read_bim(here('Datos', 'Datos_IND', 'mG', 'mG_3', 'frec_0.05_IND.bim'))
famsnps_IND <- read_fam(here('Datos', 'Datos_IND', 'mG', 'mG_3', 'frec_0.05_IND.fam'))
bedsnps_IND <- BEDMatrix(here('Datos', 'Datos_IND', 'mG', 'mG_3', 'frec_0.05_IND.bed'), n = length(famsnps_IND$id), p = length(bimsnps_IND$id), simple_names = FALSE)
snps_IND <- as.matrix(bedsnps_IND)

mG_3_esc <- scale(snps_IND) %>%
	saveRDS(here('Datos', 'Datos_IND', 'mG', 'mG_3', 'mG_3_esc.RDS'))

## 4. Subpoblación con 248 individuos genotipados

bimsnps_IND <- read_bim(here('Datos', 'Datos_IND', 'mG', 'mG_4', 'frec_0.05_IND.bim'))
famsnps_IND <- read_fam(here('Datos', 'Datos_IND', 'mG', 'mG_4', 'frec_0.05_IND.fam'))
bedsnps_IND <- BEDMatrix(here('Datos', 'Datos_IND', 'mG', 'mG_4', 'frec_0.05_IND.bed'), n = length(famsnps_IND$id), p = length(bimsnps_IND$id), simple_names = FALSE)
snps_IND <- as.matrix(bedsnps_IND)

mG_4_esc <- scale(snps_IND) %>%
	saveRDS(here('Datos', 'Datos_IND', 'mG', 'mG_4', 'mG_4_esc.RDS'))

## 5. Subpoblación con 298 individuos genotipados

bimsnps_IND <- read_bim(here('Datos', 'Datos_IND', 'mG', 'mG_5', 'frec_0.05_IND.bim'))
famsnps_IND <- read_fam(here('Datos', 'Datos_IND', 'mG', 'mG_5', 'frec_0.05_IND.fam'))
bedsnps_IND <- BEDMatrix(here('Datos', 'Datos_IND', 'mG', 'mG_5', 'frec_0.05_IND.bed'), n = length(famsnps_IND$id), p = length(bimsnps_IND$id), simple_names = FALSE)
snps_IND <- as.matrix(bedsnps_IND)

mG_5_esc <- scale(snps_IND) %>%
	saveRDS(here('Datos', 'Datos_IND', 'mG', 'mG_5', 'mG_5_esc.RDS'))

## 6. Subpoblación con 348 individuos genotipados

bimsnps_IND <- read_bim(here('Datos', 'Datos_IND', 'mG', 'mG_6', 'frec_0.05_IND.bim'))
famsnps_IND <- read_fam(here('Datos', 'Datos_IND', 'mG', 'mG_6', 'frec_0.05_IND.fam'))
bedsnps_IND <- BEDMatrix(here('Datos', 'Datos_IND', 'mG', 'mG_6', 'frec_0.05_IND.bed'), n = length(famsnps_IND$id), p = length(bimsnps_IND$id), simple_names = FALSE)
snps_IND <- as.matrix(bedsnps_IND)

mG_6_esc <- scale(snps_IND) %>%
	saveRDS(here('Datos', 'Datos_IND', 'mG', 'mG_6', 'mG_6_esc.RDS'))

## 7. Subpoblación con 398 individuos genotipados

bimsnps_IND <- read_bim(here('Datos', 'Datos_IND', 'mG', 'mG_7', 'frec_0.05_IND.bim'))
famsnps_IND <- read_fam(here('Datos', 'Datos_IND', 'mG', 'mG_7', 'frec_0.05_IND.fam'))
bedsnps_IND <- BEDMatrix(here('Datos', 'Datos_IND', 'mG', 'mG_7', 'frec_0.05_IND.bed'), n = length(famsnps_IND$id), p = length(bimsnps_IND$id), simple_names = FALSE)
snps_IND <- as.matrix(bedsnps_IND)

mG_7_esc <- scale(snps_IND) %>%
	saveRDS(here('Datos', 'Datos_IND', 'mG', 'mG_7', 'mG_7_esc.RDS'))

## 8. Subpoblación con 451 individuos genotipados

bimsnps_IND <- read_bim(here('Datos', 'Datos_IND', 'mG', 'mG_8', 'frec_0.05_IND.bim'))
famsnps_IND <- read_fam(here('Datos', 'Datos_IND', 'mG', 'mG_8', 'frec_0.05_IND.fam'))
bedsnps_IND <- BEDMatrix(here('Datos', 'Datos_IND', 'mG', 'mG_8', 'frec_0.05_IND.bed'), n = length(famsnps_IND$id), p = length(bimsnps_IND$id), simple_names = FALSE)
snps_IND <- as.matrix(bedsnps_IND)

mG_8_esc <- scale(snps_IND) %>%
	saveRDS(here('Datos', 'Datos_IND', 'mG', 'mG_8', 'mG_8_esc.RDS'))

#### Población JAP ----

## 1. Subpoblación con 41 individuos genotipados

bimsnps_JAP <- read_bim(here('Datos', 'Datos_JAP', 'mG', 'mG_1', 'frec_0.05_JAP.bim'))
famsnps_JAP <- read_fam(here('Datos', 'Datos_JAP', 'mG', 'mG_1', 'frec_0.05_JAP.fam'))
bedsnps_JAP <- BEDMatrix(here('Datos', 'Datos_JAP', 'mG', 'mG_1', 'frec_0.05_JAP.bed'), n = length(famsnps_JAP$id), p = length(bimsnps_JAP$id), simple_names = FALSE)
snps_JAP <- as.matrix(bedsnps_JAP)

mG_1_esc <- scale(snps_JAP) %>%
	saveRDS(here('Datos', 'Datos_JAP', 'mG', 'mG_1', 'mG_1_esc.RDS'))

## 2. Subpoblación con 58 individuos genotipados

bimsnps_JAP <- read_bim(here('Datos', 'Datos_JAP', 'mG', 'mG_2', 'frec_0.05_JAP.bim'))
famsnps_JAP <- read_fam(here('Datos', 'Datos_JAP', 'mG', 'mG_2', 'frec_0.05_JAP.fam'))
bedsnps_JAP <- BEDMatrix(here('Datos', 'Datos_JAP', 'mG', 'mG_2', 'frec_0.05_JAP.bed'), n = length(famsnps_JAP$id), p = length(bimsnps_JAP$id), simple_names = FALSE)
snps_JAP <- as.matrix(bedsnps_JAP)

mG_2_esc <- scale(snps_JAP) %>%
	saveRDS(here('Datos', 'Datos_JAP', 'mG', 'mG_2', 'mG_2_esc.RDS'))

## 3. Subpoblación con 75 individuos genotipados

bimsnps_JAP <- read_bim(here('Datos', 'Datos_JAP', 'mG', 'mG_3', 'frec_0.05_JAP.bim'))
famsnps_JAP <- read_fam(here('Datos', 'Datos_JAP', 'mG', 'mG_3', 'frec_0.05_JAP.fam'))
bedsnps_JAP <- BEDMatrix(here('Datos', 'Datos_JAP', 'mG', 'mG_3', 'frec_0.05_JAP.bed'), n = length(famsnps_JAP$id), p = length(bimsnps_JAP$id), simple_names = FALSE)
snps_JAP <- as.matrix(bedsnps_JAP)

mG_3_esc <- scale(snps_JAP) %>%
	saveRDS(here('Datos', 'Datos_JAP', 'mG', 'mG_3', 'mG_3_esc.RDS'))

## 4. Subpoblación con 92 individuos genotipados

bimsnps_JAP <- read_bim(here('Datos', 'Datos_JAP', 'mG', 'mG_4', 'frec_0.05_JAP.bim'))
famsnps_JAP <- read_fam(here('Datos', 'Datos_JAP', 'mG', 'mG_4', 'frec_0.05_JAP.fam'))
bedsnps_JAP <- BEDMatrix(here('Datos', 'Datos_JAP', 'mG', 'mG_4', 'frec_0.05_JAP.bed'), n = length(famsnps_JAP$id), p = length(bimsnps_JAP$id), simple_names = FALSE)
snps_JAP <- as.matrix(bedsnps_JAP)

mG_4_esc <- scale(snps_JAP) %>%
	saveRDS(here('Datos', 'Datos_JAP', 'mG', 'mG_4', 'mG_4_esc.RDS'))

## 5. Subpoblación con 109 individuos genotipados

bimsnps_JAP <- read_bim(here('Datos', 'Datos_JAP', 'mG', 'mG_5', 'frec_0.05_JAP.bim'))
famsnps_JAP <- read_fam(here('Datos', 'Datos_JAP', 'mG', 'mG_5', 'frec_0.05_JAP.fam'))
bedsnps_JAP <- BEDMatrix(here('Datos', 'Datos_JAP', 'mG', 'mG_5', 'frec_0.05_JAP.bed'), n = length(famsnps_JAP$id), p = length(bimsnps_JAP$id), simple_names = FALSE)
snps_JAP <- as.matrix(bedsnps_JAP)

mG_5_esc <- scale(snps_JAP) %>%
	saveRDS(here('Datos', 'Datos_JAP', 'mG', 'mG_5', 'mG_5_esc.RDS'))

## 6. Subpoblación con 126 individuos genotipados

bimsnps_JAP <- read_bim(here('Datos', 'Datos_JAP', 'mG', 'mG_6', 'frec_0.05_JAP.bim'))
famsnps_JAP <- read_fam(here('Datos', 'Datos_JAP', 'mG', 'mG_6', 'frec_0.05_JAP.fam'))
bedsnps_JAP <- BEDMatrix(here('Datos', 'Datos_JAP', 'mG', 'mG_6', 'frec_0.05_JAP.bed'), n = length(famsnps_JAP$id), p = length(bimsnps_JAP$id), simple_names = FALSE)
snps_JAP <- as.matrix(bedsnps_JAP)

mG_6_esc <- scale(snps_JAP) %>%
	saveRDS(here('Datos', 'Datos_JAP', 'mG', 'mG_6', 'mG_6_esc.RDS'))

## 7. Subpoblación con 143 individuos genotipados

bimsnps_JAP <- read_bim(here('Datos', 'Datos_JAP', 'mG', 'mG_7', 'frec_0.05_JAP.bim'))
famsnps_JAP <- read_fam(here('Datos', 'Datos_JAP', 'mG', 'mG_7', 'frec_0.05_JAP.fam'))
bedsnps_JAP <- BEDMatrix(here('Datos', 'Datos_JAP', 'mG', 'mG_7', 'frec_0.05_JAP.bed'), n = length(famsnps_JAP$id), p = length(bimsnps_JAP$id), simple_names = FALSE)
snps_JAP <- as.matrix(bedsnps_JAP)

mG_7_esc <- scale(snps_JAP) %>%
	saveRDS(here('Datos', 'Datos_JAP', 'mG', 'mG_7', 'mG_7_esc.RDS'))

## 8. Subpoblación con 166 individuos genotipados

bimsnps_JAP <- read_bim(here('Datos', 'Datos_JAP', 'mG', 'mG_8', 'frec_0.05_JAP.bim'))
famsnps_JAP <- read_fam(here('Datos', 'Datos_JAP', 'mG', 'mG_8', 'frec_0.05_JAP.fam'))
bedsnps_JAP <- BEDMatrix(here('Datos', 'Datos_JAP', 'mG', 'mG_8', 'frec_0.05_JAP.bed'), n = length(famsnps_JAP$id), p = length(bimsnps_JAP$id), simple_names = FALSE)
snps_JAP <- as.matrix(bedsnps_JAP)

mG_8_esc <- scale(snps_JAP) %>%
	saveRDS(here('Datos', 'Datos_JAP', 'mG', 'mG_8', 'mG_8_esc.RDS'))

#### Población AUS ----

## 1. Subpoblación con 10 individuos genotipados

bimsnps_AUS <- read_bim(here('Datos', 'Datos_AUS', 'mG', 'mG_1', 'frec_0.05_AUS.bim'))
famsnps_AUS <- read_fam(here('Datos', 'Datos_AUS', 'mG', 'mG_1', 'frec_0.05_AUS.fam'))
bedsnps_AUS <- BEDMatrix(here('Datos', 'Datos_AUS', 'mG', 'mG_1', 'frec_0.05_AUS.bed'), n = length(famsnps_AUS$id), p = length(bimsnps_AUS$id), simple_names = FALSE)
snps_AUS <- as.matrix(bedsnps_AUS)

mG_1_esc <- scale(snps_AUS) %>%
	saveRDS(here('Datos', 'Datos_AUS', 'mG', 'mG_1', 'mG_1_esc.RDS'))

## 2. Subpoblación con 19 individuos genotipados

bimsnps_AUS <- read_bim(here('Datos', 'Datos_AUS', 'mG', 'mG_2', 'frec_0.05_AUS.bim'))
famsnps_AUS <- read_fam(here('Datos', 'Datos_AUS', 'mG', 'mG_2', 'frec_0.05_AUS.fam'))
bedsnps_AUS <- BEDMatrix(here('Datos', 'Datos_AUS', 'mG', 'mG_2', 'frec_0.05_AUS.bed'), n = length(famsnps_AUS$id), p = length(bimsnps_AUS$id), simple_names = FALSE)
snps_AUS <- as.matrix(bedsnps_AUS)

mG_2_esc <- scale(snps_AUS) %>%
	saveRDS(here('Datos', 'Datos_AUS', 'mG', 'mG_2', 'mG_2_esc.RDS'))

## 3. Subpoblación con 28 individuos genotipados

bimsnps_AUS <- read_bim(here('Datos', 'Datos_AUS', 'mG', 'mG_3', 'frec_0.05_AUS.bim'))
famsnps_AUS <- read_fam(here('Datos', 'Datos_AUS', 'mG', 'mG_3', 'frec_0.05_AUS.fam'))
bedsnps_AUS <- BEDMatrix(here('Datos', 'Datos_AUS', 'mG', 'mG_3', 'frec_0.05_AUS.bed'), n = length(famsnps_AUS$id), p = length(bimsnps_AUS$id), simple_names = FALSE)
snps_AUS <- as.matrix(bedsnps_AUS)

mG_3_esc <- scale(snps_AUS) %>%
	saveRDS(here('Datos', 'Datos_AUS', 'mG', 'mG_3', 'mG_3_esc.RDS'))

## 4. Subpoblación con 37 individuos genotipados

bimsnps_AUS <- read_bim(here('Datos', 'Datos_AUS', 'mG', 'mG_4', 'frec_0.05_AUS.bim'))
famsnps_AUS <- read_fam(here('Datos', 'Datos_AUS', 'mG', 'mG_4', 'frec_0.05_AUS.fam'))
bedsnps_AUS <- BEDMatrix(here('Datos', 'Datos_AUS', 'mG', 'mG_4', 'frec_0.05_AUS.bed'), n = length(famsnps_AUS$id), p = length(bimsnps_AUS$id), simple_names = FALSE)
snps_AUS <- as.matrix(bedsnps_AUS)

mG_4_esc <- scale(snps_AUS) %>%
	saveRDS(here('Datos', 'Datos_AUS', 'mG', 'mG_4', 'mG_4_esc.RDS'))

## 5. Subpoblación con 46 individuos genotipados

bimsnps_AUS <- read_bim(here('Datos', 'Datos_AUS', 'mG', 'mG_5', 'frec_0.05_AUS.bim'))
famsnps_AUS <- read_fam(here('Datos', 'Datos_AUS', 'mG', 'mG_5', 'frec_0.05_AUS.fam'))
bedsnps_AUS <- BEDMatrix(here('Datos', 'Datos_AUS', 'mG', 'mG_5', 'frec_0.05_AUS.bed'), n = length(famsnps_AUS$id), p = length(bimsnps_AUS$id), simple_names = FALSE)
snps_AUS <- as.matrix(bedsnps_AUS)

mG_5_esc <- scale(snps_AUS) %>%
	saveRDS(here('Datos', 'Datos_AUS', 'mG', 'mG_5', 'mG_5_esc.RDS'))

## 6. Subpoblación con 55 individuos genotipados

bimsnps_AUS <- read_bim(here('Datos', 'Datos_AUS', 'mG', 'mG_6', 'frec_0.05_AUS.bim'))
famsnps_AUS <- read_fam(here('Datos', 'Datos_AUS', 'mG', 'mG_6', 'frec_0.05_AUS.fam'))
bedsnps_AUS <- BEDMatrix(here('Datos', 'Datos_AUS', 'mG', 'mG_6', 'frec_0.05_AUS.bed'), n = length(famsnps_AUS$id), p = length(bimsnps_AUS$id), simple_names = FALSE)
snps_AUS <- as.matrix(bedsnps_AUS)

mG_6_esc <- scale(snps_AUS) %>%
	saveRDS(here('Datos', 'Datos_AUS', 'mG', 'mG_6', 'mG_6_esc.RDS'))

## 7. Subpoblación con 64 individuos genotipados

bimsnps_AUS <- read_bim(here('Datos', 'Datos_AUS', 'mG', 'mG_7', 'frec_0.05_AUS.bim'))
famsnps_AUS <- read_fam(here('Datos', 'Datos_AUS', 'mG', 'mG_7', 'frec_0.05_AUS.fam'))
bedsnps_AUS <- BEDMatrix(here('Datos', 'Datos_AUS', 'mG', 'mG_7', 'frec_0.05_AUS.bed'), n = length(famsnps_AUS$id), p = length(bimsnps_AUS$id), simple_names = FALSE)
snps_AUS <- as.matrix(bedsnps_AUS)

mG_7_esc <- scale(snps_AUS) %>%
	saveRDS(here('Datos', 'Datos_AUS', 'mG', 'mG_7', 'mG_7_esc.RDS'))

## 8. Subpoblación con 75 individuos genotipados

bimsnps_AUS <- read_bim(here('Datos', 'Datos_AUS', 'mG', 'mG_8', 'frec_0.05_AUS.bim'))
famsnps_AUS <- read_fam(here('Datos', 'Datos_AUS', 'mG', 'mG_8', 'frec_0.05_AUS.fam'))
bedsnps_AUS <- BEDMatrix(here('Datos', 'Datos_AUS', 'mG', 'mG_8', 'frec_0.05_AUS.bed'), n = length(famsnps_AUS$id), p = length(bimsnps_AUS$id), simple_names = FALSE)
snps_AUS <- as.matrix(bedsnps_AUS)

mG_8_esc <- scale(snps_AUS) %>%
	saveRDS(here('Datos', 'Datos_AUS', 'mG', 'mG_8', 'mG_8_esc.RDS'))

