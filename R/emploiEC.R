library(tidyverse)
library(ggcpesrthemes)
library(ggrepel)

options(dplyr.summarise.inform = FALSE)
options(tidyverse.quiet = TRUE)

cnu.sections <- read.csv2("../data/cpesr-cnu-sections.csv")

ens <- read.csv2("../data/fr-esr-enseignants-titulaires-esr-public.csv") %>% 
  filter(Code.categorie.personnels %in% c("MCF","PR")) %>%
  group_by(Rentrée,code_section_cnu,Code.categorie.personnels) %>%
  summarise(effectif = sum(effectif,na.rm = TRUE)) %>%
  pivot_wider(names_from = Code.categorie.personnels, values_from = effectif) %>%
  ungroup() %>%
  transmute(
    Année = Rentrée - 1,
    SectionCNU.ID = code_section_cnu,
    Effectif.MCF = MCF,
    Effectif.PR = PR
    ) %>%
  left_join(cnu.sections)

etu <- read.csv2("../data/fr-esr-statistiques-sur-les-effectifs-d-etudiants-inscrits-par-etablissement-hcp.csv") %>%
    filter(Attention == "") %>%
    transmute(
      Année = rentree-1,
      Ensemble = Nombre.d.étudiants.inscrits..inscriptions.principales..hors.doubles.inscriptions.CPGE - replace_na(Diplôme.préparé...Diplôme.d.État.d.infirmier,0),
      DEG=Grande.discipline...Droit..sciences.économiques..AES,
      Sans=Grande.discipline...Interdisciplinaire,
      LLASHS=Grande.discipline...Lettres..langues.et.sciences.humaines + Grande.discipline...STAPS,
      Santé = Grande.discipline...Santé,
      ST = Grande.discipline...Sciences.et.sciences.de.l.ingénieur,
      Pharma = Discipline...Pharmacie      
      ) %>% 
    pivot_longer(-c(Année), names_to = "Périmètre.ID", values_to = "Effectif.ETU") %>%
    group_by(Année, Périmètre.ID) %>%
    summarise(Effectif.ETU = sum(Effectif.ETU, na.rm = TRUE)) %>%
    mutate(
      Périmètre.ID = na_if(Périmètre.ID,"NA"),
      Périmètre=ifelse(Périmètre.ID == "Ensemble", "Ensemble","Grande discipline"))
  



ens <- bind_rows(
ens %>%
  transmute(
    Périmètre = "Section",
    Périmètre.ID = as.character(SectionCNU.ID),
    Année,
    Effectif.MCF,
    Effectif.PR
  ),
ens %>%
  group_by(
    Périmètre = "Groupe",
    Périmètre.ID = as.character(GroupeCNU.ID),
    Année) %>%
  summarise(
    Effectif.MCF = sum(Effectif.MCF, na.rm = T),
    Effectif.PR = sum(Effectif.PR, na.rm = T)
  ),
ens %>%
  group_by(
    Périmètre = "Grande discipline",
    Périmètre.ID = as.character(GrandeDisciplineCNU.ID),
    Année) %>%
  summarise(
    Effectif.MCF = sum(Effectif.MCF, na.rm = T),
    Effectif.PR = sum(Effectif.PR, na.rm = T)
  ),
ens %>%
  group_by(
    Périmètre = "Ensemble",
    Périmètre.ID = "Ensemble",
    Année) %>%
  summarise(
    Effectif.MCF = sum(Effectif.MCF, na.rm = T),
    Effectif.PR = sum(Effectif.PR, na.rm = T)
  )
) 

cnu.périmètres <- bind_rows(
  cnu.sections %>% transmute(Périmètre = "Section", Périmètre.ID = as.character(SectionCNU.ID), Périmètre.label = SectionCNU),
  cnu.sections %>% transmute(Périmètre = "Groupe", Périmètre.ID = GroupeCNU.ID, Périmètre.label = GroupeCNU) %>% unique(),
  cnu.sections %>% transmute(Périmètre = "Grande discipline", Périmètre.ID = GrandeDisciplineCNU.ID, Périmètre.label = GrandeDisciplineCNU) %>% unique(),
  data.frame("Périmètre" = "Ensemble", Périmètre.ID = "Ensemble", Périmètre.label = "Ensemble")) %>%
  na.omit()
  

emploisEC <- cnu.périmètres %>%
  right_join(read.csv2("../data/cpesr-emplois-cnu-qualification-concours.csv")) %>%
  left_join(ens) %>%
  left_join(etu) %>%
  mutate(
    Année = as.factor(Année),
    Périmètre = factor(Périmètre, levels=c("Ensemble","Grande discipline","Groupe","Section"))) %>%
  arrange(Périmètre,Périmètre.ID,Année) %>%
  group_by(Périmètre,Périmètre.ID) %>%
  mutate(
    Effectif.EC = Effectif.MCF+Effectif.PR,
    Contexte.TauxEncadrement = Effectif.EC / Effectif.ETU * 100,
    Contexte.EvolRéelle = Effectif.EC - first(Effectif.EC),
    Contexte.EvolNécessaire = (Effectif.ETU / first(Effectif.ETU) - 1) * first(Effectif.EC) 
  ) %>%
  mutate(
    kpi.MCF.TauxTension = Concours.Candidats.MCF / Concours.Postes.MCF,
    kpi.MCF.TauxRéussite = Concours.Recrutés.MCF / Concours.Candidats.MCF,
    kpi.MCF.SansPoste = Concours.Candidats.MCF - Concours.Recrutés.MCF,
    kpi.MCF.TauxSélection = Concours.Recrutés.MCF / Qualification.Candidats.MCF,
    kpi.MCF.TauxSélection.Qualification = Qualification.Qualifiés.MCF / Qualification.Candidats.MCF,
    kpi.MCF.TauxSélection.Concours = Concours.Recrutés.MCF / Qualification.Qualifiés.MCF,
    kpi.MCF.TauxSélection.QualifVsConcours = (Qualification.Qualifiés.MCF - Concours.Recrutés.MCF) / (Qualification.Candidats.MCF-Concours.Recrutés.MCF),
    kpi.PériodeRenouvellement = (Effectif.MCF+Effectif.PR) / Concours.Recrutés.MCF
  ) %>%
  ungroup()

check_emploisEC <- function() {
  emploisEC %>%
    group_by(Périmètre,Périmètre.ID,Périmètre.label) %>%
    summarise(nb_lignes = n()) %>%
    filter(nb_lignes != 11)
  
  emploisEC %>%
    group_by(Périmètre,Périmètre.ID,Périmètre.label) %>%
    summarise(nb_lignes = n()) %>%
    filter(nb_lignes != 10)
}
  
check_emploisEC() %>% filter(nb_lignes != 11)

write.csv2(emploisEC, "../data/cpesr-emploi-ec.csv", row.names = FALSE)
