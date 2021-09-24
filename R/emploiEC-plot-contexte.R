
context_sizemul <- 0.7
p_contexte_ec <- plot_metrique("Effectif.EC", métriquelab = "Enseignants-chercheurs titulaire", périm = c("Ensemble","Grande discipline"), norm = FALSE, facetting = FALSE, sizemul=context_sizemul)

p_contexte_ec.norm <-plot_metrique("Effectif.EC", métriquelab = "Enseignants-chercheurs titulaire\n(base 100)", périm = c("Ensemble","Grande discipline"), norm = TRUE, facetting = FALSE, sizemul=context_sizemul)

emploisEC <- emploisEC %>%
  mutate(Effectif.ETU.k = Effectif.ETU / 1000)

p_contexte_etu <- plot_metrique("Effectif.ETU.k", métriquelab = "Etudiants (milliers)", périm = c("Ensemble","Grande discipline"), norm = FALSE, facetting = FALSE, sizemul=context_sizemul)
p_contexte_etu.norm <- plot_metrique("Effectif.ETU.k", métriquelab = "Etudiants (base 100)", périm = c("Ensemble","Grande discipline"), norm = TRUE, facetting = FALSE, sizemul=context_sizemul)

p_contexte_te <- plot_metrique("Contexte.TauxEncadrement", métriquelab = "Taux d'encadrement", périm = c("Ensemble","Grande discipline"), norm = FALSE, facetting = FALSE, sizemul=context_sizemul, maxannée = "2018")
p_contexte_te.norm <- plot_metrique("Contexte.TauxEncadrement", métriquelab = "Taux d'encadrement (base 100)", périm = c("Ensemble","Grande discipline"), norm = TRUE, facetting = FALSE, sizemul=context_sizemul, maxannée = "2018")


levels_context <- c("Effectif.EC","Effectif.ETU","Contexte.TauxEncadrement")
labs_context <- c("Effectif EC","Effectif étudiant","Taux d'encadrement")
palette_context <- setNames(RColorBrewer::brewer.pal(3, "Set2"), labs_context)

p_contexte_ec.etu.te <- plot_series(levels_context, labs_context, périm="Ensemble",norm=TRUE, colors=palette_context, normbreaks = seq(50,150,5), sizemul=context_sizemul, maxannée = "2018")
p_contexte_ec.etu.te.disc <- plot_series(levels_context, labs_context, périm="Grande discipline",norm=TRUE, colors=palette_context, sizemul=context_sizemul, maxannée = "2018") + theme_cpesr()



plot_evolution_EC <- function(périm="Ensemble") {
  emploisEC %>%
    filter(Périmètre == périm) %>%
    filter(Année !=2019) %>%
    group_by(Périmètre.ID) %>%
    mutate(
      Evolution.réelle = Effectif.EC - lag(Effectif.EC),
      Evolution.nécessaire = first(Effectif.EC)/first(Effectif.ETU)*Effectif.ETU - Effectif.EC
    ) %>%
    select(Année,Périmètre.ID,Evolution.réelle,Evolution.nécessaire) %>%
    pivot_longer(-c(Année,Périmètre.ID),names_to = "Série", values_to = "val") %>%
    mutate(Série = factor(Série,labels = c("Evolution nécessaire", "Evolution réelle"))) %>%
    ggplot(aes(x=Année,y=val,fill=Série)) + 
    geom_col(position="dodge") + 
    facet_wrap(Périmètre.ID~.) +
    xlab("") + ylab("Evolution annuelle des effectifs enseignant-chercheur")
}

p_contexte.evol <- plot_evolution_EC() 
p_contexte.evol.disc <- plot_evolution_EC(périm="Grande discipline") 

### Emplois longs

plot_emplois_long <- function() {

  postes <- read.csv2("../data/cpesr-emplois-cnu-mcf-qualification-recrutement.csv") %>%
    left_join(cnu.sections) %>%
    filter(!is.na(PostesPublies.MCF)) %>%
    group_by(Année = Annee, GrandeDisciplineCNU.ID) %>%
    summarise(Concours.Postes.MCF = sum(PostesPublies.MCF,na.rm = TRUE)) 
  
  postes.tot <- postes %>%
    group_by(Année) %>%
    summarise(Concours.Postes.MCF = sum(Concours.Postes.MCF,na.rm = TRUE)) %>%
    ungroup() %>%
    mutate(evol = round(Concours.Postes.MCF / first(Concours.Postes.MCF) * 100))
    
  ggplot(postes, aes(x=Année, y=Concours.Postes.MCF)) +
    geom_col(aes(fill=factor(GrandeDisciplineCNU.ID,levels=rev(levels_gdcnu)))) +
    geom_text(data=postes.tot, aes(label=Concours.Postes.MCF), color="black", vjust=-0.3) +
    geom_text(data=postes.tot, aes(label=evol), color="white", vjust=1.3) +
    xlab("") + ylab("Nombre de postes MCF ouverts") +
    scale_fill_manual(breaks=rev(levels_gdcnu[-1]), values=rev(palette_gdcnu[-1]), name="")
}

plot_emplois_long()



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
le taux d'encadrement global de 2009, et donc le nombre de recrutements qu'il aurait fallu faire,
en plus des renouvellement de départ, pour conserver les conditions de travail et 
d'étude sur la dernière décennie.
"
)


