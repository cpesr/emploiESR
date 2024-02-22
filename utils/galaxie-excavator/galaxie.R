#!/bin/R
# DataSets :
# galaxie https://www.galaxie.enseignementsup-recherche.gouv.fr/ensup/ListesPostesPublies/Emplois_publies_TrieParCorps.html
# (updateEmploi.sh télécharge et formate ces données)

library(tidyverse)

rentrée <- 2024

# Approximation des sections CNU correspondant aux flilières en tension
#section.cnu.en.tension = c("74","70","18","16","01","02","03","71")
section.cnu.en.tension = c()

# Chargement des données Galaxie
# dir <- "../utils/galaxie-excavator/"
dir <- "./"
galaxie <- data.frame()
for(file in list.files(dir, pattern = "^galaxie......csv$")) {
  an <- str_sub(file,9,12)
  gal <- read.table(paste0(dir,file), header=TRUE, sep=",", quote='"') %>%
    mutate(Année = an)
  galaxie <- bind_rows(galaxie,gal)
}
galaxie <- galaxie %>% select(Année, everything())



# galaxie.2018 <- read.table("galaxie.2018.csv",header=TRUE, sep=",", quote='"')
# galaxie.2018$Annee <- 2018
# galaxie.2019 <- read.table("galaxie.2019.csv",header=TRUE, sep=",", quote='"')
# galaxie.2019$Annee <- 2019
# galaxie.2020 <- read.table("galaxie.2020.csv",header=TRUE, sep=",", quote='"')
# galaxie.2020$Annee <- 2020
# galaxie.2021 <- read.table("galaxie.2021.csv",header=TRUE, sep=",", quote='"')
# galaxie.2021$Annee <- 2021
# galaxie.2022 <- read.table("galaxie.2022.csv",header=TRUE, sep=",", quote='"')
# galaxie.2022$Annee <- 2022
# galaxie.2023 <- read.table("galaxie.2023.csv",header=TRUE, sep=",", quote='"')
# galaxie.2023$Annee <- 2023
# galaxie.2024 <- read.table("galaxie.2024.csv",header=TRUE, sep=",", quote='"')
# galaxie.2024$Annee <- 2024


# galaxie <-  bind_rows(galaxie.2018, galaxie.2019, galaxie.2020, galaxie.2021, galaxie.2022, galaxie.2023,galaxie.2024)

write.csv2(galaxie,file="galaxie.csv",row.names=FALSE)
