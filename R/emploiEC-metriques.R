
levels_gdcnu <- c("Ensemble","ST","LLASHS","DEG","Pharma")
palette_gdcnu <- setNames(RColorBrewer::brewer.pal(5, "Set1"), levels_gdcnu)


séries.MCF = c("Qualification.Candidats.MCF","Qualification.Qualifiés.MCF",
               "Concours.Candidats.MCF","Concours.Postes.MCF","Concours.Recrutés.MCF")
séries.MCF.lab = c("Candidats qualification","Candidats qualifiés",
                   "Candidats concours","Postes publiés","Candidats recrutés")
séries.MCF.palette <- c("#A6CEE3","#1F78B4","#B2DF8A","#79c360","#33A02C")
names(séries.MCF.palette) <- séries.MCF.lab

kpis <- list(
  "kpi.MCF.TauxTension"=list(
    "nom"="kpi.MCF.TauxTension",
    "titre"="Tension à l'entrée dans la carrière d'enseignant-chercheur.",
    "lab"="Tension",
    "percentlab" = FALSE,
    "def"="nombre de candidats par poste ouvert au concours",
    "desc"="La tension présente une triple interprétation\\ :

- pour l'Etat, elle mesure l'attractivité des carrières\\ ;
- pour les établissement, elle mesure l'attractivité des postes mis au concours ;
- pour les candidats, elle mesure la compétition.

Des carrières attractives augmentent la tension,
mais une tension haute diminue l'attractivité des carrières. 
Cette dynamique est soumise à un décalage temporel d'environ 5 à 10 ans, temps
entre la décision de s'inscrire en doctorat et celle de participer au concours
de recrutement.

Le risque systémique principal est « l'effet accordéon » : des périodes
avec très peu de postes pour beaucoup de candidats, suivies de périodes avec 
beaucoup de postes pour très peu de candidats.
"),
  
  "kpi.MCF.TauxRéussite"=list(
    "nom"="kpi.MCF.TauxRéussite",
    "titre"="Taux de réussite à l'entrée dans la carrière d'enseignant-chercheur",
    "lab"="Taux de réussite concours",
    "percentlab" = TRUE,
    "def"="nombre de recrutés par candidat⋅e.",
    "desc"="Le taux de réussite est proche de l'inverse du taux de tension :

- pour l'Etat et les établissements, il mesure la qualité du recrutement : 
plus le taux est bas, plus on estime que les candidats recrutés sont de grande qualité ;
- pour les candidats, il mesure le risque de précarité à la sortie du doctorat : 
plus le taux est bas, plus le risque de se retrouver « sans poste » est grand. 

Les mêmes observations s'appliquent qu'au Taux de tension.
"),
  
  "MCFSansPoste"=list(
    "nom"="kpi.MCF.SansPoste",
    "titre"="Candidats sans poste à l'entrée dans la carrière d'enseignant-chercheur",
    "lab"="Nombre de candidats sans poste",
    "percentlab" = FALSE,
    "def"="différence entre candidats et recrutés au concours.",
    "desc"="Le nombre de « sans poste » mesure le vivier, ou réservoir, de recrutement potentiel.
Il varie en fonction de l'attractivité des carrières et du nombre de postes ouverts
au concours, mais aussi des opportunités d'embauche en dehors du milieu académique.
"),
  
  
  "kpi.MCF.TauxSélection"=list(
    "nom"="kpi.MCF.TauxSélection",
    "titre"="Taux de sélection à l'entrée dans la carrière d'enseignant-chercheur",
    "lab"="Taux de sélection",
    "percentlab" = TRUE,
    "def"="nombre de recrutés par candidats à la qualification.",
    "desc"="Le taux de sélection est une mesure de la difficulté d'entrer dans la carrière
d'enseignant-chercheur, au travers des deux étapes de la sélection : qualification et
concours.

_Attention_ :
les qualifiés de l'année ne candidatent pas forcément dans l'année, 
et les candidats ne sont pas forcément qualifiés dans l'année, mais
cette mesure est moins sensible à l'accumulation de candidats sans postes qui 
recandidatent.
"),
  
  "kpi.MCF.TauxSélection.Qualification"=list(
    "nom"="kpi.MCF.TauxSélection.Qualification",
    "titre"="Taux de sélection par la qualification à l'entrée dans la carrière d'enseignant-chercheur",
    "lab"="Taux de sélection qualification",
    "percentlab" = TRUE,
    "def"="nombre de qualifiés par candidats à la qualification.",  
    "desc"="Le taux de sélection par la qualification mesure la part des lauréats lors de cette étape de sélection.
    "),
  
  "kpi.MCF.TauxSélection.Concours"=list(
    "nom"="kpi.MCF.TauxSélection.Concours",
    "titre"="Taux de sélection par le concours à l'entrée dans la carrière d'enseignant-chercheur",
    "lab"="Taux de sélection concours",
    "percentlab" = TRUE,
    "def"="nombre de recrutés par qualifiés.",
    "desc"="Le taux de sélection par le concours mesure la part des lauréats lors de cette étape de sélection.
"),
  
  "kpi.MCF.TauxSélection.QualifVsConcours"=list(
    "nom"="kpi.MCF.TauxSélection.QualifVsConcours",
    "titre"="Equilibre de la sélection qualification/concours à l'entrée dans la carrière d'enseignant-chercheur",
    "lab"="Taux d'équilibre",
    "percentlab" = TRUE,
    "def"="nombre de qualifiés évincés par le concours par le nombre de candidats évincés par la qualification et le concours.",
    "desc"="Ce taux mesure la part relative de la qualification et du concours dans la sélection
à l'entrée de la carrière d'enseignant-chercheur : à 50%, qualification et concours 
ont la même part ; plus le taux est élevé, plus le concours occupe une grande part.
"),
  
  
  "kpi.PériodeRenouvellement"=list(
    "nom"="kpi.PériodeRenouvellement",
    "titre"="Période nécessaire au renouvellement des effectifs enseignant-chercheur titulaire",
    "lab"="Période de renouvellement (ans)",
    "percentlab" = FALSE,
    "def"="effectifs enseignants-chercheurs titulaires par poste publié.",
    "desc"="Cette période mesure le nombre d'années nécessaires au renouvellement de la 
totalité des effectifs actuels, au rythme de recrutement actuel.

Un seuil peut être grossièrement défini autour de 29 ans, correspondant à la 
différence entre l'âge moyen de recrutement des MCF 
(34 ans)
et l'âge moyen de départ à la retraite 
(63 ans).
En dessous, le renouvellement se fait plus vite que de nécessaire pour conserver 
les mêmes effectifs, au dessus le renouvellement se fait plus lentement que de nécessaire 
pour conserver les mêmes effectifs.

_Attention_ : cette indicateur propose une lecture partielle, si elle n'est pas 
complétée notamment par le nombre de départs et la pyramide des âges.
"
  )
)


description.flux=list(
  "col"=
"Représentation en colonnes des effectifs aux différentes étapes du 
recrutement des enseignants-chercheurs, pour la dernière année disponible.

Cette représentation propose un profil visuel de la sélection.",

  "alluvial"=
"Représentation en flux des effectifs aux différentes étapes du 
recrutement des enseignants-chercheurs, pour la dernière année disponible.

Le flux « échec » (en rouge) cumule l'échec à la qualification et au concours.",

  "lignes"=
"Représentation en segments des effectifs aux différentes étapes du 
recrutement des enseignants-chercheurs, pour toutes les années disponibles.

Moins facile à lire, cette représentation permet cependant d'apprécier l'évolution
dans le temps des effectifs."  
)

