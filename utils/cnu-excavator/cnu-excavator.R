library(tidyverse)


as.numeric_cnu <- function(x) {
  if(is.numeric(x)) return(x)
  ifelse(
    str_detect(x,"div"),
    Inf,
    readr::parse_number(x,trim_ws = T, locale = readr::locale(decimal_mark = ",", grouping_mark = " "))
  )
}

cnu.sections <- read.csv2("../../data/cpesr-cnu-sections.csv")


clean_perimetre <- function(df,perimetre.nom,perimetre.col,data.col.start,data.col.end) {
  df %>%
  filter(Périmètre == perimetre.nom) %>%
    mutate(Périmètre.ID = as.character(!!as.name(perimetre.col))) %>%
    group_by(Année, Périmètre.ID) %>%
    slice_head() %>% 
    select(
      Périmètre,Périmètre.ID,Année,
      !!as.name(data.col.start):!!as.name(data.col.end)
    )
}

clean_qualif <- function(csvfile) {
  
  qualif <- read.csv(csvfile, header = FALSE) %>%
    transmute(
      SectionCNU.ID = as.numeric(V1),
      Année = as.numeric(V4),
      Qualification.Candidats.PR = as.numeric_cnu(V5),
      Qualification.Candidats.PR.femmes = as.numeric_cnu(V6) /100,
      Qualification.Qualifiés.PR = as.numeric_cnu(V8),
      Qualification.Qualifiés.PR.femmes = as.numeric_cnu(V9) /100,
      #Qualification.Ratio.PR = as.numeric_cnu(V9) /100,
      Qualification.Candidats.MCF = as.numeric_cnu(V14),
      Qualification.Candidats.MCF.femmes = as.numeric_cnu(V15),
      Qualification.Qualifiés.MCF = as.numeric_cnu(V17),
      Qualification.Qualifiés.MCF.femmes = as.numeric_cnu(V18) /100,
      #Qualification.Ratio.MCF = as.numeric_cnu(V19) /100,
      ) %>%
    filter(!is.na(Année)) %>%
    group_by(SectionCNU.ID,Année) %>%
    mutate(Périmètre = factor(row_number(), levels=c(1,2,3,4), labels = c("Ensemble","Grande discipline","Groupe","Section"))) %>%
    left_join(cnu.sections) 
  
  bind_rows(  
    clean_perimetre(qualif %>% mutate(Ensemble = "Ensemble"),"Ensemble","Ensemble","Qualification.Candidats.PR","Qualification.Qualifiés.MCF.femmes"),
    clean_perimetre(qualif,"Grande discipline","GrandeDisciplineCNU.ID","Qualification.Candidats.PR","Qualification.Qualifiés.MCF.femmes"),
    clean_perimetre(qualif,"Groupe","GroupeCNU.ID","Qualification.Candidats.PR","Qualification.Qualifiés.MCF.femmes"),
    clean_perimetre(qualif,"Section","SectionCNU.ID","Qualification.Candidats.PR","Qualification.Qualifiés.MCF.femmes")
  )

}

qualif.ratio.recevabilité <- full_join(
  clean_qualif("cnu-excavation-qualification-2013.csv") %>%
    transmute(Périmètre, Périmètre.ID,Année,QC.MCF.13=Qualification.Candidats.MCF,QC.PR.13=Qualification.Candidats.PR),
  clean_qualif("cnu-excavation-qualification-2015.csv") %>%
    transmute(Périmètre, Périmètre.ID,Année,QC.MCF.15=Qualification.Candidats.MCF,QC.PR.15=Qualification.Candidats.PR) 
  ) %>%
  mutate(
    ratio.MCF = QC.MCF.15/QC.MCF.13,
    ratio.PR = QC.PR.15/QC.PR.13) %>%
  na.omit() %>%
  group_by(Périmètre,Périmètre.ID) %>%
  summarise(
    ratio.MCF = mean(ratio.MCF),
    ratio.PR = mean(ratio.PR),
    )

qualif <- bind_rows(
  clean_qualif("cnu-excavation-qualification-2020.csv"),
  #clean_qualif("cnu-excavation-qualification-2019.csv"),
  clean_qualif("cnu-excavation-qualification-2015.csv") %>% filter(Année < 2015),
  clean_qualif("cnu-excavation-qualification-2013.csv") %>% filter(Année < 2011) %>%
    left_join(qualif.ratio.recevabilité) %>%
    mutate(
      Qualification.Candidats.MCF = Qualification.Candidats.MCF * ratio.MCF,
      Qualification.Candidats.PR = Qualification.Candidats.PR * ratio.PR) %>%
    select(-c(ratio.MCF,ratio.PR))
) %>% 
  arrange(Périmètre, Périmètre.ID, Année)



clean_recrut <- function(csvfile) {
  
  recrut <<- read.csv(csvfile, header = FALSE) %>%
    transmute(
      SectionCNU.ID = as.numeric(V1),
      Année = as.numeric(V3),
      Concours.Postes.PR = as.numeric_cnu(V4),
      Concours.Candidats.PR = as.numeric_cnu(V5),
      Concours.Candidats.PR.femmes = as.numeric_cnu(V6) /100,
      Concours.Recrutés.PR = as.numeric_cnu(V8),
      Concours.Recrutés.PR.femmes = as.numeric_cnu(V9) /100,
      Concours.Postes.MCF = as.numeric_cnu(V13),
      Concours.Candidats.MCF = as.numeric_cnu(V14),
      Concours.Candidats.MCF.femmes = as.numeric_cnu(V15) /100,
      Concours.Recrutés.MCF = as.numeric_cnu(V17),
      Concours.Recrutés.MCF.femmes = as.numeric_cnu(V18) /100,
    ) %>%
    filter(!is.na(Année)) %>%
    group_by(SectionCNU.ID,Année) %>%
    mutate(Périmètre = factor(row_number(), levels=c(1,2,3,4), labels = c("Ensemble","Grande discipline","Groupe","Section"))) %>%
    left_join(cnu.sections)
  
  bind_rows(  
    clean_perimetre(recrut %>% mutate(Ensemble = "Ensemble"),"Ensemble","Ensemble","Concours.Postes.PR","Concours.Recrutés.MCF.femmes"),
    clean_perimetre(recrut,"Grande discipline","GrandeDisciplineCNU.ID","Concours.Postes.PR","Concours.Recrutés.MCF.femmes"),
    clean_perimetre(recrut,"Groupe","GroupeCNU.ID","Concours.Postes.PR","Concours.Recrutés.MCF.femmes"),
    clean_perimetre(recrut,"Section","SectionCNU.ID","Concours.Postes.PR","Concours.Recrutés.MCF.femmes")
  )
  
}

clean_recrut("cnu-excavation-recrutement-2019.csv")

recrut <- bind_rows(
  clean_recrut("cnu-excavation-recrutement-2020.csv"),
  #clean_recrut("cnu-excavation-recrutement-2019.csv"),
  clean_recrut("cnu-excavation-recrutement-2015.csv") %>% filter(Année < 2015),
  clean_recrut("cnu-excavation-recrutement-2013.csv") %>% filter(Année < 2011)
) %>% 
  arrange(Périmètre, Périmètre.ID, Année)

cnu <- full_join(qualif,recrut) %>%
  # Suppression des sans groupe
  filter(!is.na(Périmètre.ID)) %>% 
  # Erreurs : 
  #  - inversion du nombre de candidats Pharma/ST en 2019 
  #  - erreur nombre de candidats groupe 10 pour 2018
  mutate(
    Concours.Candidats.PR = case_when(
      Année == 2019 & Périmètre == "Grande discipline" & Périmètre.ID == "ST" ~ 942,
      Année == 2019 & Périmètre == "Grande discipline" & Périmètre.ID == "Pharma" ~ 29,
      TRUE ~ Concours.Candidats.PR),
    Concours.Candidats.MCF = case_when(
      Année == 2019 & Périmètre == "Grande discipline" & Périmètre.ID == "ST" ~ 2719,
      Année == 2019 & Périmètre == "Grande discipline" & Périmètre.ID == "Pharma" ~ 209,
      Année == 2018 & Périmètre == "Groupe" & Périmètre.ID == "10" ~ 645,
      TRUE ~ Concours.Candidats.MCF)
  )
  
cnu[!complete.cases(cnu),]

cnu %>% ungroup() %>% 
  pivot_longer(
    -c(Périmètre, Périmètre.ID, Année), 
    names_to = "métrique",
    values_to = "val") %>%
  filter(is.na(val)) %>%
  select(-val) %>%
  write.csv2("valeurs-manquantes.csv", row.names = F)

write.csv2(cnu,"../../data/cpesr-emplois-cnu-qualification-concours.csv", row.names = F)

