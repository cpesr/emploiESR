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

ens <- bind_rows(
ens %>%
  transmute(
    Périmètre = "Section",
    Périmètre.ID = as.character(SectionCNU.ID),
    Périmètre.label = SectionCNU,
    Année,
    Effectif.MCF,
    Effectif.PR
  ),
ens %>%
  group_by(
    Périmètre = "Groupe",
    Périmètre.ID = as.character(GroupeCNU.ID),
    Périmètre.label = GroupeCNU,
    Année) %>%
  summarise(
    Effectif.MCF = sum(Effectif.MCF, na.rm = T),
    Effectif.PR = sum(Effectif.PR, na.rm = T)
  ),
ens %>%
  group_by(
    Périmètre = "Grande discipline",
    Périmètre.ID = as.character(GrandeDisciplineCNU.ID),
    Périmètre.label = GrandeDisciplineCNU,
    Année) %>%
  summarise(
    Effectif.MCF = sum(Effectif.MCF, na.rm = T),
    Effectif.PR = sum(Effectif.PR, na.rm = T)
  ),
ens %>%
  group_by(
    Périmètre = "Ensemble",
    Périmètre.ID = "Ensemble",
    Périmètre.label = "Ensemble",
    Année) %>%
  summarise(
    Effectif.MCF = sum(Effectif.MCF, na.rm = T),
    Effectif.PR = sum(Effectif.PR, na.rm = T)
  )
) 


emploisEC <- right_join(ens,read.csv2("../data/cpesr-emplois-cnu-qualification-concours.csv")) %>%
  mutate(
    Année = as.factor(Année),
    Périmètre = factor(Périmètre, levels=c("Ensemble","Grande discipline","Groupe","Section"))) %>%
  arrange(Périmètre,Périmètre.ID,Année) %>%
  mutate(
    TauxTension.MCF = Concours.Candidats.MCF / Concours.Postes.MCF,
    TauxRéussite.MCF = Concours.Postes.MCF / Concours.Candidats.MCF,
    SansPoste.MCF = Concours.Candidats.MCF - Concours.Recrutés.MCF,
    TauxTitularisation.MCF = Concours.Recrutés.MCF / Qualification.Candidats.MCF,
    Qualification.TauxSélection.MCF = Qualification.Qualifiés.MCF / Qualification.Candidats.MCF,
    Concours.TauxSélection.MCF = Concours.Recrutés.MCF / Qualification.Qualifiés.MCF,
    QualifVsConcours.MCF = (Qualification.Candidats.MCF - Qualification.Qualifiés.MCF) / (Qualification.Candidats.MCF-Concours.Postes.MCF),
    PériodeRenouvellement = (Effectif.MCF+Effectif.PR) / Concours.Recrutés.MCF
  )
  

plot_serie_MCF <- function(périm="Ensemble", norm=FALSE, legend=TRUE) {
  emploisEC %>%
    filter(Périmètre == périm) %>%
    select(Année,Périmètre.ID,
           Qualification.Candidats.MCF,Qualification.Qualifiés.MCF,
           Concours.Postes.MCF,Concours.Candidats.MCF,Concours.Recrutés.MCF)%>%
    pivot_longer(-c(Année,Périmètre.ID), names_to = "Serie", values_to = "Nombre") %>%
    na_if(0) %>%
    mutate(Serie = factor(Serie, 
                          levels=c("Qualification.Candidats.MCF","Qualification.Qualifiés.MCF",
                                   "Concours.Candidats.MCF","Concours.Postes.MCF","Concours.Recrutés.MCF"),
                          labels=c("Candidats à la qualification","Candidats qualifiés",
                                   "Candidats au concours","Postes publiés","Candidats recrutés")
                          )) %>%
    { if(norm) 
       group_by(., Périmètre.ID,Serie) %>% mutate(Nombre = Nombre / first(Nombre) * 100)
    else .  } %>%

    ggplot(aes(x=Année,y=Nombre,color=Serie)) +
      geom_line(aes(group=Serie)) + geom_point() +
      xlab("Année") +
      facet_wrap(Périmètre.ID~.) +
      { if(norm) scale_y_continuous(breaks = seq(50,150,25)) } +
      { if(périm != "Ensemble") scale_x_discrete(breaks = seq(2001,2020,2)) } +
      theme_cpesr_cap() + theme(legend.direction = "vertical", legend.position = "right") +
      { if(!legend) theme(legend.position = "None")}
}

plot_serie_MCF(périm="Grande discipline",norm=TRUE,legend = TRUE)

scale_color_gdcnu <- function(...){
  ggplot2:::manual_scale(
    'color', 
    values = setNames(RColorBrewer::brewer.pal(5, "Set1") , rev(c("Ensemble","DEG","LLASHS","Pharma","ST"))), 
    ...
  )
}

plot_metrique <- function(metrique, metriclab = "Valeur", périm="Ensemble", norm=FALSE, labels=TRUE, percentlab=FALSE) {
  emploisEC %>%
    filter(Périmètre == périm) %>%
    mutate(val = !!as.name(metrique)) %>%
    filter(!is.na(val) & val != 0) %>%
    { if(norm) group_by(., Périmètre.ID) %>% mutate(val = val / first(val) * 100) else . } %>%
    { if(percentlab & !norm)
        mutate(., lab = scales::percent(val, accuracy=1))
      else if(norm)
        mutate(., lab = round(val,0))
      else
        mutate(., lab = round(val,1)) } %>%
      mutate(lab = ifelse(Année == first(Année) |  Année == last(Année), lab, NA)) %>%
      
    ggplot(aes(x=Année,y=val,color=Périmètre.ID)) +  
      geom_line(aes(group=Périmètre.ID), size=1) + geom_point(size=3) +
      { if(labels) geom_label(aes(label=lab), size=5, fontface="bold", direction="y") } +
      facet_wrap(Périmètre.ID~.) +
      xlab("Année") +
      ylab(metriclab) +
      coord_cartesian(clip="off") +
      scale_color_gdcnu() +
      { if(périm != "Ensemble") scale_x_discrete(breaks = seq(2001,2020,2)) } +
      { if(!norm) expand_limits(y=c(0)) } +
      { if(percentlab & !norm) scale_y_continuous(labels=scales::percent) } +
      theme_cpesr_cap() + theme(legend.position = "None")
}

plot_metrique("TauxTension.MCF", percentlab = FALSE)
# plot_metrique("Tension", metriclab = "Tension", disciplines = TRUE, norm = TRUE)

plot_metrique_all_github <- function(metrique, metriquelab = "", titre = "", ...) {
  print(plot_metrique(metrique,metriquelab, ...) + ggtitle(titre))
  print(plot_metrique(metrique,metriquelab, norm=TRUE, ...) + ggtitle(titre, subtitle = "base 100 pour la première année"))
  print(plot_metrique(metrique,metriquelab, périm="Grande discipline", ...) + ggtitle(titre))
  print(plot_metrique(metrique,metriquelab, périm="Grande discipline", norm=TRUE, ...) + ggtitle(titre, subtitle = "base 100 pour la première année"))
}