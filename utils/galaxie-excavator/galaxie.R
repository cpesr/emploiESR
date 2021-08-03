#!/bin/R
# DataSets :
# galaxie https://www.galaxie.enseignementsup-recherche.gouv.fr/ensup/ListesPostesPublies/Emplois_publies_TrieParCorps.html
# (updateEmploi.sh télécharge et formate ces données)

library(tidyverse)

rentrée <- 2021

# Approximation des sections CNU correspondant aux flilières en tension
#section.cnu.en.tension = c("74","70","18","16","01","02","03","71")
section.cnu.en.tension = c()

# Chargement des données Galaxie
galaxie.2018 <- read.table("galaxie.2018.csv",header=TRUE, sep=",", quote='"')
galaxie.2018$Annee <- 2018
galaxie.2019 <- read.table("galaxie.2019.csv",header=TRUE, sep=",", quote='"')
galaxie.2019$Annee <- 2019
galaxie.2020 <- read.table("galaxie.2020.csv",header=TRUE, sep=",", quote='"')
galaxie.2020$Annee <- 2020
galaxie.2021 <- read.table("galaxie.2021.csv",header=TRUE, sep=",", quote='"')
galaxie.2021$Annee <- 2021

galaxie <- galaxie.2018 %>% 
  bind_rows(galaxie.2019) %>% 
  bind_rows(galaxie.2020) %>%
  bind_rows(galaxie.2021) 

write.csv2(galaxie,file="../data/galaxie.csv",row.names=FALSE)

