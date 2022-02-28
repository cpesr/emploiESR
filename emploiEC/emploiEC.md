L’entrée dans la carrière des enseignants-chercheurs
================

Une version plus complète du rapport est disponible
[ici](cpesr-emploiEC-rapport.pdf).

## Introduction

Les principales données utilisées dans ce document proviennent des
fiches démographiques du CNU[1] (Conseil National des Universités) et
décrivent en partie les conditions d’entrée dans la carrière
d’enseignants-chercheurs.

Ce document s’intéresse essentiellement au recrutement des titulaires,
qui comporte trois phases[2] :

-   **Doctorat** : l’obtention d’un doctorat (Bac+8) est en principe
    indispensable pour participer aux épreuves de recrutement. Les
    docteurs ne se destinent pas tous à une carrière académique, et la
    proportion qui poursuit sa carrière dans le secteur privé est un
    enjeu politique subissant des transformations.

L’âge moyen d’obtention du doctorat est de 32 ans.

Le nombre de docteurs n’est pas disponible dans le jeu de données
exploité dans ce document.

-   **Qualification** : la qualification est une épreuve nationale, sur
    dossier expertisé par le CNU. En principe, seuls les qualifiés sont
    autorisés à participer aux concours. L’expertise est disciplinaire,
    et peut fortement varier d’une section CNU[3] (sous-groupe
    disciplinaire) à l’autre, tant sur les critères d’éligibilité que
    sur la poids de la qualification dans le recrutement. Les docteurs
    peuvent être qualifiés dans plusieurs sections, et les
    qualifications sont valables 4 ans.

L’âge moyen d’obtention de la qualification est de 33 ans.

La qualification est largement affaiblie par la Loi de programmation de
la recherche de 2020[4], qui introduit plusieurs dérogations.

-   **Concours** : le concours est une épreuve locale, sur dossier puis
    audition, organisée par chaque établissement pour chaque poste
    ouvert. Les qualifiés peuvent candidater sur plusieurs postes,
    pendant toute la période de validité de leur qualification. Les
    candidats sont classés indépendamment sur chaque concours local. Des
    postes ouverts peuvent ne pas être pourvus, soit parce qu’aucun
    candidat n’a été classé, soit parce que tous les candidats classés
    ont préféré un autre poste ou que le seul candidat s’est finalement
    désisté.

Les candidats qui acceptent un poste deviennent alors stagiaire pendant
un an, avant d’être titularisés sous conditions.

L’âge moyen d’obtention d’un poste est de 34 ans, et celui de la
titularisation de 35 ans.

L’âge moyen de départ à la retraite est de 63 ans[5].

### Méthodologie

Ce document constitue un travail de traitement et de représentation de
données ouvertes. Ces traitements et représentations, aussi bien que les
données sources, peuvent faire l’objet d’erreurs, y compris
d’interprétation.

La plus grande prudence dans leur utilisation est indispensable.

Traitements et données : <https://github.com/cpesr/emploiESR/>

## Présentation des données

Les données temporelles sont systématiquement présentées sous quatre
formes :

-   `Ensemble` : toutes disciplines confondues ;
-   `Ensemble en base 100` : ensemble, en base 100 pour la première
    année ;
-   `Disciplinaire` : par grandes disciplines du CNU ;
-   `Disciplinaire en base 100` : disciplinaire, en base 100 pour la
    première année.

Les grandes disciplines du CNU sont :

-   `DEG` : Droit, Economie, Gestion ;
-   `LLASHS` : Lettres, Langues, Arts, Sciences Humaines et Sociales ;
-   `Pharma` : Pharmacie ;
-   `ST` : Sciences et Technologies (aussi appelée `SI`, Sciences et
    sciences de l’Ingénieur).

Les disciplines de santé et médecine ont un système de recrutement
différent qui n’est pas traité dans ce document.

## Source des données

-   Données originales :
    -   [Fiches démographiques du
        CNU](https://www.enseignementsup-recherche.gouv.fr/pid24672-cid85019/fiches-demographiques-des-sections-du-cnu.html)
    -   [Bilans de campagne de
        recrutement](https://www.enseignementsup-recherche.gouv.fr/cid118435/personnels-enseignants-du-superieur-bilans-et-statistiques.html#recrutement)
-   Données agrégées :
    -   [cpesr-emplois-cnu-qualification-concours.csv](https://github.com/cpesr/emploiESR/tree/main/data/data/cpesr-emplois-cnu-qualification-concours.csv)
    -   [cpesr-emplois-ec.csv](https://github.com/cpesr/emploiESR/tree/main/data/cpesr-emplois-ec.csv)
-   Autres données :
    -   [Les enseignants titulaires dans les établissements publics de
        l’ESR](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-titulaires-esr-public/export/?flg=fr&disjunctive.annee)
    -   [Statistiques sur les effectifs d’étudiants inscrits par
        établissement public sous tutelle du ministère en charge de
        l’Enseignement supérieur (hors doubles inscriptions
        université-CPGE)](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-statistiques-sur-les-effectifs-d-etudiants-inscrits-par-etablissement-hcp/)

## Acquisition et traitement des données

1.  Acquisition manuelle d’un sous-ensemble des données provenant des
    `fiches démographiques du CNU` ;
2.  Visualisations exploratoires :
    -   à propos de la qualification :
        [visualisations](https://github.com/cpesr/RFC/blob/main/ConcoursMCF/QualificationMCF.md)
        ;
    -   à propos du concours :
        [visualisations](https://github.com/cpesr/RFC/blob/main/ConcoursMCF/ConcoursMCF.md)
        ;
3.  Acquisition automatisée par le script
    [cnu-excavator](https://github.com/cpesr/emploiESR/tree/main/utils/cnu-excavator),
    pour les années 2013, 2015 et 2019, des tableaux :
    -   `3.1 - Qualification aux fonctions d'enseignant-chercheur - Nombre de candidats et de qualifiés (y compris la qualification "de groupe")`
        ;
    -   `3.2 - Recrutement des enseignants-chercheurs - Postes publiés et pourvus, taux de pression et part des postes non pourvus - Session synchronisée et "au fil de l'eau"`
        ;
4.  Correction des erreurs détectées :
    -   Inversion du nombre de candidats en 2019 entre les groupes
        Pharma. et ST ;
    -   Erreur manifeste dans le nombre de candidats en 2018 pour le
        groupe 10 ;
    -   Changement de méthodologie pour les candidats à la qualification
        entre les fiches 2013 (candidatures totales) et 2015
        (candidatures recevables seulement) :
        -   Calcul d’un ratio moyen candidatures recevables /
            candidatures sur les années 2011 à 2013, pour chaque section
            indépendamment ;
        -   Application de ce ratio aux données de la fiche 2013 (donc
            pour les années 2009 et 2010, les suivantes étant dans la
            fiche 2015) ;
5.  Traitement des données par des [scripts
    R](https://github.com/cpesr/emploiESR/tree/main/R) :
    -   Normalisation des données ;
    -   Intégration des données extérieures ;
    -   Calcul des métriques supplémentaires ;
6.  Production et mise en ligne des visualisations pour commentaires :
    [visualisations](https://github.com/cpesr/emploiESR/blob/main/emploiEC/emploiEC.md)
    ;
7.  Production de ce rapport.

## Note sur les qualifications multiples

Une proportion non négligeable de candidats postule dans plusieurs
sections. Les candidats dans ce cas apparaissent dans les données une
fois par section, une fois par grande discipline, et une fois dans
l’ensemble. Ceci explique que la somme du nombre de candidats par
section ne correspond pas au nombre de candidats par grande discipline
et dans l’ensemble.

En revanche, les postes ne sont comptabilisés que pour une seule
section, et les sommes sont cohérentes.

    - twtexte:[#DataESR] L'entrée dans la carrière des enseignants-chercheurs en chiffres
    - twalt:@ffigon @juliengossa LO 2.0 www.cpesr.fr
    - twurl:https://twitter.com/CPESR_/status/1442047467042877442

## Contexte

### Nombre de postes de MCF ouverts au concours par an

<img src="emploiEC_files/figure-gfm/contexte_postes-1.png" width="960" />

### Effectifs enseignants-chercheurs titulaires

Les effectifs enseignants-chercheurs titulaires sont constitués des
Maîtres de Conférences et Professeurs des Universités.

La série `Ensemble` contient tous les effectifs. Les séries
disciplinaires sont limitées au périmètre des fiches démographiques du
CNU. \`

<img src="emploiEC_files/figure-gfm/contexte_ec.norm-1.png" width="768" />

<img src="emploiEC_files/figure-gfm/contexte_ec-1.png" width="768" />

### Effectifs étudiants dans le périmètre du MESRI

<img src="emploiEC_files/figure-gfm/p_contexte_etu-1.png" width="768" />

<img src="emploiEC_files/figure-gfm/p_contexte_etu.norm-1.png" width="768" />

### Taux d’encadrement

Le taux d’encadrement est défini comme le nombre
d’enseignants-chercheurs titulaires pour 100 étudiants.

Ce taux est (très) approximatif pour les séries disciplinaires, puisque
les étudiants dans une discipline donnée ont des enseignants venus
d’autres disciplines, ce que ne permet pas de détecter les données.

<img src="emploiEC_files/figure-gfm/p_contexte_te-1.png" width="768" />

<img src="emploiEC_files/figure-gfm/p_contexte_te.norm-1.png" width="768" />

### Evolution des effectifs étudiants et enseignants-chercheurs titulairs et taux d’encadrement

<img src="emploiEC_files/figure-gfm/p_contexte_ec.etu.te-1.png" width="768" />

<img src="emploiEC_files/figure-gfm/p_contexte_ec.etu.te.disc-1.png" width="768" />

### Evolutions réelles et nécessaires des effectifs enseignant-chercheur titulaire pour maintenant le taux d’encadrement de 2009

L’évolution annuelle des effectifs indique la différence d’une année sur
l’autre du nombre d’enseignants-chercheurs titulaires sur l’ensemble du
périmètre MESRI.

Une deuxième série indique l’évolution qui aurait été nécessaire pour
conserver le taux d’encadrement global de 2009, et donc le nombre de
recrutements qu’il aurait fallu faire, en plus des renouvellement de
départ, pour conserver les conditions de travail et d’étude sur la
dernière décennie.

<img src="emploiEC_files/figure-gfm/contexte.evol.etu-1.png" width="768" />

## Principales Series de données

Les principales séries de données utilisées dans ce document sont :

-   `Candidats à la qualification` : nombre de docteurs ayant déposé une
    candidature recevable à la qualification dans l’année ;
-   `Candidats qualififés` : nombre de docteurs ayant été qualifiés dans
    l’année ;
-   `Candidats au concours` : nombre de qualifiés (pas nécessairement
    dans l’année) ayant participé au concours Maîtres de Conférences
    (MCF) dans l’année ;
-   `Postes publiés` : nombre de postes de Maîtres de Conférences (MCF)
    ouverts au concours dans l’année ;
-   `Candidats recrutés` : nombre de candidats au concours Maîtres de
    Conférents (MCF) qui obtiennent finalement un poste.

### Principales séries de données à propos du recrutement des MCF

<img src="emploiEC_files/figure-gfm/etapes.tout-1.png" width="768" />

<img src="emploiEC_files/figure-gfm/etapes.tout.norm-1.png" width="768" />

### Principales séries de données à propos du recrutement des MCF par secteur disciplinaire

<img src="emploiEC_files/figure-gfm/etapes.discipline-1.png" width="768" />

<img src="emploiEC_files/figure-gfm/etapes.discipline.norm-1.png" width="768" />

## Représentation des flux

#### Effectifs aux différentes étapes de la sélection lors du recrutement des MCF : représentation en colonnes

Représentation en colonnes des effectifs aux différentes étapes du
recrutement des enseignants-chercheurs, pour la dernière année
disponible.

Cette représentation propose un profil visuel de la sélection.

<img src="emploiEC_files/figure-gfm/flux.col-1.png" width="768" />

<img src="emploiEC_files/figure-gfm/flux.col.discipline-1.png" width="768" />

#### Effectifs aux différentes étapes de la sélection lors du recrutement des MCF : diagramme de Sankey

Représentation en flux des effectifs aux différentes étapes du
recrutement des enseignants-chercheurs, pour la dernière année
disponible.

Le flux « échec » (en rouge) cumule l’échec à la qualification et au
concours.

<img src="emploiEC_files/figure-gfm/flux.alluvial-1.png" width="768" />

<img src="emploiEC_files/figure-gfm/flux.alluvial.discipline-1.png" width="768" />

#### Effectifs aux différentes étapes de la sélection lors du recrutement des MCF : représentation en segments

Représentation en segments des effectifs aux différentes étapes du
recrutement des enseignants-chercheurs, pour toutes les années
disponibles.

Moins facile à lire, cette représentation permet cependant d’apprécier
l’évolution dans le temps des effectifs.

<img src="emploiEC_files/figure-gfm/flux.lignes-1.png" width="768" />

<img src="emploiEC_files/figure-gfm/flux.lignes.discipline-1.png" width="768" />

<img src="emploiEC_files/figure-gfm/flux.lignes.norm-1.png" width="768" />

<img src="emploiEC_files/figure-gfm/flux.lignes.discipline.norm-1.png" width="768" />

## Métriques

### Tension à l’entrée dans la carrière d’enseignant-chercheur

Définition : nombre de candidats par poste ouvert au concours

La tension présente une triple interprétation :

-   pour l’Etat, elle mesure l’attractivité des carrières ;
-   pour les établissement, elle mesure l’attractivité des postes mis au
    concours ;
-   pour les candidats, elle mesure la compétition.

Des carrières attractives augmentent la tension, mais une tension haute
diminue l’attractivité des carrières. Cette dynamique est soumise à un
décalage temporel d’environ 5 à 10 ans, temps entre la décision de
s’inscrire en doctorat et celle de participer au concours de
recrutement.

Le risque systémique principal est « l’effet accordéon » : des périodes
avec très peu de postes pour beaucoup de candidats, suivies de périodes
avec beaucoup de postes pour très peu de candidats.

<img src="emploiEC_files/figure-gfm/metriques-1.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-2.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-3.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-4.png" width="768" />

### Taux de réussite à l’entrée dans la carrière d’enseignant-chercheur

Définition : nombre de recrutés par candidat⋅e.

Le taux de réussite est proche de l’inverse du taux de tension :

-   pour l’Etat et les établissements, il mesure la qualité du
    recrutement : plus le taux est bas, plus on estime que les candidats
    recrutés sont de grande qualité ;
-   pour les candidats, il mesure le risque de précarité à la sortie du
    doctorat : plus le taux est bas, plus le risque de se retrouver «
    sans poste » est grand.

Les mêmes observations s’appliquent qu’au Taux de tension.

<img src="emploiEC_files/figure-gfm/metriques-5.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-6.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-7.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-8.png" width="768" />

### Candidats sans poste à l’entrée dans la carrière d’enseignant-chercheur

Définition : différence entre candidats et recrutés au concours.

Le nombre de « sans poste » mesure le vivier, ou réservoir, de
recrutement potentiel. Il varie en fonction de l’attractivité des
carrières et du nombre de postes ouverts au concours, mais aussi des
opportunités d’embauche en dehors du milieu académique.

<img src="emploiEC_files/figure-gfm/metriques-9.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-10.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-11.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-12.png" width="768" />

### Taux de sélection à l’entrée dans la carrière d’enseignant-chercheur

Définition : nombre de recrutés par candidats à la qualification.

Le taux de sélection est une mesure de la difficulté d’entrer dans la
carrière d’enseignant-chercheur, au travers des deux étapes de la
sélection : qualification et concours.

*Attention* : les qualifiés de l’année ne candidatent pas forcément dans
l’année, et les candidats ne sont pas forcément qualifiés dans l’année,
mais cette mesure est moins sensible à l’accumulation de candidats sans
postes qui recandidatent.

<img src="emploiEC_files/figure-gfm/metriques-13.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-14.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-15.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-16.png" width="768" />

### Taux de sélection par la qualification à l’entrée dans la carrière d’enseignant-chercheur

Définition : nombre de qualifiés par candidats à la qualification.

Le taux de sélection par la qualification mesure la part des lauréats
lors de cette étape de sélection.

<img src="emploiEC_files/figure-gfm/metriques-17.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-18.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-19.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-20.png" width="768" />

### Taux de sélection par le concours à l’entrée dans la carrière d’enseignant-chercheur

Définition : nombre de recrutés par qualifiés.

Le taux de sélection par le concours mesure la part des lauréats lors de
cette étape de sélection.

<img src="emploiEC_files/figure-gfm/metriques-21.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-22.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-23.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-24.png" width="768" />

### Equilibre de la sélection qualification/concours à l’entrée dans la carrière d’enseignant-chercheur

Définition : nombre de qualifiés évincés par le concours par le nombre
de candidats évincés par la qualification et le concours.

Ce taux mesure la part relative de la qualification et du concours dans
la sélection à l’entrée de la carrière d’enseignant-chercheur : à 50%,
qualification et concours ont la même part ; plus le taux est élevé,
plus le concours occupe une grande part.

<img src="emploiEC_files/figure-gfm/metriques-25.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-26.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-27.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-28.png" width="768" />

### Période nécessaire au renouvellement des effectifs enseignant-chercheur titulaire

Définition : effectifs enseignants-chercheurs titulaires par poste
publié.

Cette période mesure le nombre d’années nécessaires au renouvellement de
la totalité des effectifs actuels, au rythme de recrutement actuel.

Un seuil peut être grossièrement défini autour de 29 ans, correspondant
à la différence entre l’âge moyen de recrutement des MCF (34 ans) et
l’âge moyen de départ à la retraite (63 ans). En dessous, le
renouvellement se fait plus vite que de nécessaire pour conserver les
mêmes effectifs, au dessus le renouvellement se fait plus lentement que
de nécessaire pour conserver les mêmes effectifs.

*Attention* : cette indicateur propose une lecture partielle, si elle
n’est pas complétée notamment par le nombre de départs et la pyramide
des âges.

<img src="emploiEC_files/figure-gfm/metriques-29.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-30.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-31.png" width="768" />
<img src="emploiEC_files/figure-gfm/metriques-32.png" width="768" />

[1] <https://www.conseil-national-des-universites.fr/>

[2] <https://cache.media.enseignementsup-recherche.gouv.fr/file/statistiques/20/0/Note_DGRH_n7_septembre_2020_-_Trajectoire_professionnelle_des_enseignants-chercheurs_recrutes_en_2019_1328200.pdf>

[3] <https://www.conseil-national-des-universites.fr/cnu/#/entite/entiteName/CNU/idChild/0>

[4] <https://cpesr.fr/dossier-lppr/>

[5] <https://cache.media.enseignementsup-recherche.gouv.fr/file/2020/89/3/NI_2020_06_Retraites_1278893.pdf>
