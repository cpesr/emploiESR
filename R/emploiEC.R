library(tidyverse)
library(ggcpesrthemes)
library(ggrepel)

options(dplyr.summarise.inform = FALSE)
options(tidyverse.quiet = TRUE)

ens <- read.csv2("../data/fr-esr-enseignants-titulaires-esr-public.csv") %>% 
  filter(Code.categorie.personnels %in% c("MCF","PR")) %>%
  group_by(Rentrée,code_section_cnu,Code.categorie.personnels) %>%
  summarise(effectif = sum(effectif,na.rm = TRUE)) %>%
  pivot_wider(names_from = Code.categorie.personnels, values_from = effectif) %>%
  ungroup() %>%
  transmute(
    Annee = Rentrée + 1, 
    SectionCNU.ID = code_section_cnu,
    Effectif.MCF = MCF,
    Effectif.PR = PR
    )

emploisEC.sections <- read.csv2("../data/cpesr-emplois-cnu-mcf-qualification-recrutement.csv") %>%
  left_join(ens) %>%
  left_join(read.csv2("../data/cpesr-cnu-sections.csv"))

emploisEC.discipline <- emploisEC.sections %>%
  group_by(Annee,GrandeDisciplineCNU,GDCNU) %>%
  summarise(across(QualificationDossiers.MCF:Effectif.PR, ~ sum(.,na.rm=TRUE))) %>%
  mutate(Candidats.MCF = ifelse(Candidats.MCF==0,NA,Candidats.MCF)) %>%
  ungroup()

emploisEC.global <- emploisEC.sections %>%
  group_by(Annee) %>%
  summarise(across(QualificationDossiers.MCF:Effectif.PR, ~ sum(.,na.rm=TRUE))) %>%
  mutate(GrandeDisciplineCNU="Toutes disciplines confondues", GDCNU = "Toutes disciplines")  %>%
  mutate(Candidats.MCF = ifelse(Candidats.MCF==0,NA,Candidats.MCF)) %>%
  ungroup()

emploisEC <- bind_rows(emploisEC.discipline,emploisEC.global) %>%
  mutate(
    Annee = as.factor(Annee),
    GDCNU = as.factor(GDCNU)) %>%
  mutate(
    TauxTension = Candidats.MCF / PostesPublies.MCF,
    TauxRéussite = PostesPublies.MCF / Candidats.MCF,
    SansPoste = Candidats.MCF - PostesPublies.MCF,
    TauxTitularisation = PostesPublies.MCF / QualificationDossiers.MCF,
    TauxSélectionQualif = QualificationQualifies.MCF / QualificationDossiers.MCF,
    TauxSélectionConcours = PostesPublies.MCF / QualificationQualifies.MCF,
    QualifVsConcours = (QualificationDossiers.MCF - QualificationQualifies.MCF) / (QualificationDossiers.MCF-PostesPublies.MCF),
    DélaisRenouvellement = (Effectif.MCF+Effectif.PR) / PostesPublies.MCF
  )
  

plot_etapes <- function(disciplines=FALSE, norm=FALSE, legend=TRUE) {
  { if(disciplines) emploisEC.discipline else emploisEC.global } %>%
  select(Annee,GDCNU,QualificationDossiers.MCF,QualificationQualifies.MCF,PostesPublies.MCF,Candidats.MCF,PostesPourvus.MCF)%>%
  pivot_longer(-c(Annee,GDCNU), names_to = "Etape", values_to = "Nombre") %>%
  na_if(0) %>%
  mutate(Etape = factor(Etape, 
                        levels=c("QualificationDossiers.MCF","QualificationQualifies.MCF","Candidats.MCF","PostesPublies.MCF","PostesPourvus.MCF"),
                        labels=c("Dossiers de qualification","Qualifications","Candidats","Postes publiés","Postes Pourvus")
                        )) %>%
  { if(norm) 
     group_by(., GDCNU,Etape) %>% mutate(Nombre = Nombre / first(Nombre) * 100)
  else .  } %>%
  ggplot(aes(x=Annee,y=Nombre,color=Etape)) +
    geom_line() + geom_point() +
    xlab("Année") +
    facet_wrap(GDCNU~.) +
    { if(norm) scale_y_continuous(breaks = seq(50,150,25)) } +
    scale_x_continuous(breaks = c(2002,2007,2013,2018)) +
    theme_cpesr_cap() + theme(legend.direction = "vertical", legend.position = "right") +
    { if(!legend) theme(legend.position = "None")}
}

#plot_etapes(disciplines=TRUE,norm=TRUE,legend = FALSE)

scale_color_gdcnu <- function(...){
  ggplot2:::manual_scale(
    'color', 
    values = setNames(RColorBrewer::brewer.pal(5, "Set1") , rev(levels(emploisEC$GDCNU))), 
    ...
  )
}

plot_metrique <- function(metrique, metriclab = "Valeur", disciplines=FALSE, norm=FALSE, labels=TRUE, percentlab=FALSE) {
  emploisEC %>%
  { if(disciplines) filter(., GDCNU != "Toutes disciplines") else filter(., GDCNU == "Toutes disciplines") } %>%
  mutate(val = !!as.name(metrique)) %>%
  filter(!is.na(val) & val != 0) %>%
  { if(norm) group_by(., GDCNU) %>% mutate(val = val / first(val) * 100) else . } %>%
  { if(percentlab & !norm)
      mutate(., lab = scales::percent(val, accuracy=1))
    else if(norm)
      mutate(., lab = round(val,0))
    else
      mutate(., lab = round(val,1)) } %>%
    mutate(lab = ifelse(Annee == first(Annee) |  Annee == last(Annee), lab, NA)) %>%
    
  ggplot(aes(x=Annee,y=val,color=GDCNU)) +  
    geom_line(aes(group=GDCNU), size=1) + geom_point(size=3) +
    { if(labels) geom_label(aes(label=lab), size=5, fontface="bold", direction="y") } +
    facet_wrap(GDCNU~.) +
    xlab("Année") +
    ylab(metriclab) +
    coord_cartesian(clip="off") +
    scale_color_gdcnu() +
    scale_x_discrete(breaks = seq(2002,2020,2)) +
    { if(!norm) expand_limits(y=c(0)) } +
    { if(percentlab & !norm) scale_y_continuous(labels=scales::percent) } +
    theme_cpesr_cap() + theme(legend.position = "None")
}

# plot_metrique("TauxTension", percentlab = FALSE)
# plot_metrique("Tension", metriclab = "Tension", disciplines = TRUE, norm = TRUE)

plot_metrique_all_github <- function(metrique, metriquelab = "", titre = "", ...) {
  print(plot_metrique(metrique,metriquelab, ...) + ggtitle(titre))
  print(plot_metrique(metrique,metriquelab, norm=TRUE, ...) + ggtitle(titre, subtitle = "base 100 pour la première année"))
  print(plot_metrique(metrique,metriquelab, disciplines=TRUE, ...) + ggtitle(titre))
  print(plot_metrique(metrique,metriquelab, disciplines=TRUE, norm=TRUE, ...) + ggtitle(titre, subtitle = "base 100 pour la première année"))
}