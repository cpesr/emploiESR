
context_sizemul <- 0.7
p_contexte_ec <- plot_metrique("Effectif.EC", métriquelab = "Enseignants-chercheurs titulaire", périm = c("Ensemble","Grande discipline"), norm = FALSE, facetting = FALSE, sizemul=context_sizemul)

p_contexte_ec.norm <-plot_metrique("Effectif.EC", métriquelab = "Enseignants-chercheurs titulaire\n(base 100)", périm = c("Ensemble","Grande discipline"), norm = TRUE, facetting = FALSE, sizemul=context_sizemul)

emploisEC <- emploisEC %>%
  mutate(Effectif.ETU.k = Effectif.ETU / 1000)

p_contexte_etu <- plot_metrique("Effectif.ETU.k", métriquelab = "Etudiants (milliers)", périm = c("Ensemble","Grande discipline"), norm = FALSE, facetting = FALSE, sizemul=context_sizemul)
p_contexte_etu.norm <- plot_metrique("Effectif.ETU.k", métriquelab = "Etudiants (base 100)", périm = c("Ensemble","Grande discipline"), norm = TRUE, facetting = FALSE, sizemul=context_sizemul)

p_contexte_te <- plot_metrique("Contexte.TauxEncadrement", métriquelab = "Taux d'encadrement", périm = c("Ensemble","Grande discipline"), norm = FALSE, facetting = FALSE, sizemul=context_sizemul)
p_contexte_te.norm <- plot_metrique("Contexte.TauxEncadrement", métriquelab = "Taux d'encadrement (base 100)", périm = c("Ensemble","Grande discipline"), norm = TRUE, facetting = FALSE, sizemul=context_sizemul)


levels_context <- c("Effectif.EC","Effectif.ETU","Contexte.TauxEncadrement")
labs_context <- c("Effectif EC","Effectif étudiant","Taux d'encadrement")
palette_context <- setNames(RColorBrewer::brewer.pal(3, "Set2"), labs_context)

p_contexte_ec.etu.te <- plot_series(levels_context, labs_context, périm="Ensemble",norm=TRUE, colors=palette_context, normbreaks = seq(50,150,5), sizemul=1, minannée = "2010")
p_contexte_ec.etu.te.disc <- plot_series(levels_context, labs_context, périm="Grande discipline",norm=TRUE, colors=palette_context, sizemul=context_sizemul*0.8, minannée = "2010")

plot_evolution_EC <- function(périm="Ensemble") {
  emploisEC %>%
    mutate(Année = as.character(Année)) %>%
    filter(Périmètre == périm) %>%
    filter(!is.na(Effectif.EC)) %>%
    group_by(Périmètre.ID) %>%
    mutate(
      Evolution.réelle = Effectif.EC - lag(Effectif.EC),
      Evolution.nécessaire = first(Effectif.EC)/first(Effectif.ETU)*Effectif.ETU - Effectif.EC
    ) %>%
    select(Année,Périmètre.ID,Evolution.réelle,Evolution.nécessaire) %>%
    pivot_longer(-c(Année,Périmètre.ID),names_to = "Série", values_to = "val") %>%
    mutate(val = round(val)) %>%
    mutate(Série = factor(Série,labels = c("Evolution nécessaire", "Evolution réelle"))) %>%
    mutate(nudge = ifelse(val >= 0,-0.2,1.2)) %>%
    ggplot(aes(x=Année,y=val,fill=Série)) + 
    geom_col(position="dodge") + 
    geom_text(aes(label=val, vjust = nudge), position = position_dodge(width = .9)) +
    facet_wrap(Périmètre.ID~.) +
    coord_cartesian(clip = "off") +
    xlab("") + ylab("Evolution annuelle des effectifs EC") +
    scale_y_continuous(breaks = seq(0,12500,2500))
}
# plot_evolution_EC() 

p_contexte.evol <- plot_evolution_EC() 
p_contexte.evol.disc <- plot_evolution_EC(périm="Grande discipline") 

### Emplois longs

plot_emplois_long <- function() {

  postes <- emploisEC %>%
    filter(Périmètre %in% c("Grande discipline")) %>%
    mutate(Données = ifelse(Source == "Galaxie", "Temporaires","Définitives")) %>%
    mutate(Année = as.character(Année)) 
    
  postes.tot <- postes %>%
    group_by(Année,Données) %>%
    summarise(Concours.Postes.MCF = sum(Concours.Postes.MCF,na.rm = TRUE)) %>%
    ungroup() %>%
    mutate(evol = round(Concours.Postes.MCF / first(Concours.Postes.MCF) * 100))
  
  ggplot(postes, aes(x=Année, y=Concours.Postes.MCF)) +
    geom_col(aes(fill=factor(Périmètre.ID,levels=levels_gdcnu),alpha=Données)) +
    geom_text(data=postes.tot, aes(label=Concours.Postes.MCF), color="black", vjust=-0.3) +
    geom_text(data=postes.tot, aes(label=evol), color="white", vjust=1.3) +
    xlab("") + ylab("Nombre de postes MCF ouverts") +
    scale_fill_manual(breaks=levels_gdcnu[-1], values=palette_gdcnu[-1], name="") +
    scale_alpha_manual(values = c(1,0.5)) 
}

#plot_emplois_long()

### Descriptions

description.contexte=list(
  "global"=
"Le nombre de postes de Maîtres de conférences (MCF) ouverts au concours 
reoprésente le nombre de recrutements de nouveaux enseignants-chercheurs titulaires.

C'est un flux partiel des stocks d'enseignants universitaires. 
Il ne permet donc pas de saisir à lui seul l'évolution 
des effectifs enseignants, et notamment donc d'être comparé à l'évolution des
effectifs étudiants. C'est pourquoi une mise en contexte est nécessaire. 
",
  "ec"=
"Les effectifs enseignants-chercheurs titulaires sont constitués des Maîtres 
de Conférences et Professeurs des Universités.

La série `Ensemble` contient tous 
les effectifs. Les séries disciplinaires sont limitées au périmètre des fiches 
démographiques du CNU. 
",
  "etu"=
"Les effectifs étudiants sont constitués des inscriptions administrative de la 
base SISE, hors double-inscriptions CPGE, et hors IFSI. 

Le jeu de données ne 
permet pas d'exclure les doctorants. Les séries disciplinaires peuvent être affectées 
par des changements de périmètre, et doivent donc être prises avec précaution.
",
  "te"=
"Le taux d'encadrement est défini comme le nombre d'enseignants-chercheurs 
titulaires pour 100 étudiants.

Ce taux est (très) approximatif pour les séries disciplinaires, puisque les étudiants
dans une discipline donnée ont des enseignants venus d'autres disciplines, ce que
ne permet pas de détecter les données.
",
  "evol"=
"L'évolution annuelle des effectifs indique la différence d'une année sur l'autre
du nombre d'enseignants-chercheurs titulaires sur l'ensemble du périmètre MESRI.

Une deuxième série indique l'évolution qui aurait été nécessaire pour conserver 
le taux d'encadrement global de 2010, et donc le nombre de recrutements qu'il aurait fallu faire,
en plus des renouvellements de départ, pour conserver les conditions de travail et 
d'étude sur la dernière décennie.
"
)


