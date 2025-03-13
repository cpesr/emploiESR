

Ce document constitue un travail de traitement et de représentation de données ouvertes.
Ces traitements et représentations, aussi bien que les données sources, peuvent 
faire l'objet d'erreurs, y compris d'interprétation.

La plus grande prudence dans leur utilisation est indispensable.

Traitements et données : https://github.com/cpesr/emploiESR/


## Présentation des données 


Les données temporelles sont systématiquement présentées sous quatre formes :

- `Ensemble` : toutes disciplines confondues ;
- `Ensemble en base 100` : ensemble, en base 100 pour la première année ;
- `Disciplinaire` : par grandes disciplines du CNU ;
- `Disciplinaire en base 100` : disciplinaire, en base 100 pour la première année.


Les grandes disciplines du CNU sont :

- `DEG` : Droit, Economie, Gestion ;
- `LLASHS` : Lettres, Langues, Arts, Sciences Humaines et Sociales ;
- `Pharma` : Pharmacie ;
- `ST` : Sciences et Technologies (aussi appelée `SI`, Sciences et sciences de l'Ingénieur).

Les disciplines de santé et médecine ont un système de recrutement différent qui
n'est pas traité dans ce document.

  
## Source des données

- Données originales :
  - [Fiches démographiques du CNU](https://www.enseignementsup-recherche.gouv.fr/fr/fiches-demographiques-des-sections-du-conseil-national-des-universites-cnu-83047)
  - [Bilans de campagne de recrutement](https://www.enseignementsup-recherche.gouv.fr/cid118435/personnels-enseignants-du-superieur-bilans-et-statistiques.html#recrutement)
  - [Galaxie](https://www.galaxie.enseignementsup-recherche.gouv.fr/ensup/ListesPostesPublies/Emplois_publies_TrieParCorps.html), [Odyssée](https://odyssee.enseignementsup-recherche.gouv.fr/)

- Données agrégées : 
  - [cpesr-emplois-ec.csv](https://github.com/cpesr/emploiESR/tree/main/data/cpesr-emplois-ec.csv)

- Autres données :
  - [Les enseignants titulaires dans les établissements publics de l'ESR](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-titulaires-esr-public/export/?flg=fr&disjunctive.annee)
  - [Statistiques sur les effectifs d'étudiants inscrits](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-statistiques-sur-les-effectifs-d-etudiants-inscrits-par-etablissement-hcp/)
  - [Effectifs d'étudiants inscrits dans les établissements et les formations de l'enseignement supérieur (données agrégeables)](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-atlas_regional-effectifs-d-etudiants-inscrits_agregeables)
  
## Acquisition et traitement des données

1. Acquisition manuelle d'un sous-ensemble des données provenant des `fiches démographiques du CNU` ;
1. Visualisations exploratoires :
    + à propos de la [qualification](https://github.com/cpesr/RFC/blob/main/ConcoursMCF/QualificationMCF.md) et du [concours](https://github.com/cpesr/RFC/blob/main/ConcoursMCF/ConcoursMCF.md) ;
1. Acquisition automatisée des données provenant des `bilans de la Direction des personnels` par le script [dpe-excavator](https://github.com/cpesr/emploiESR/tree/main/utils/dpe-excavator), pour les années 2001 à 2008 ;
1. Acquisition automatisée des données provenant des `fiches démographiques du CNU` par le script [cnu-excavator](https://github.com/cpesr/emploiESR/tree/main/utils/cnu-excavator), pour les années 2013, 2015 et 2021, des tableaux :
    + `3.1 - Qualification aux fonctions d'enseignant-chercheur` ;
    + `3.2 - Recrutement des enseignants-chercheurs` ;
1. Acquisition automatisée données provenant des postes en ligne sur `Galaxie` par les scripts [galaxie-excavator](https://github.com/cpesr/emploiESR/tree/main/utils/galaxie-excavator) et [odysee-excavator](https://github.com/cpesr/emploiESR/tree/main/utils/odyssee-excavator), pour les années suivantes :
    + Ces données sont marquées comme `provisoire`.
1. Correction des erreurs détectées :
    + Changement de méthodologie pour les candidats à la qualification entre les fiches 2013 (candidatures totales) et 2015 (candidatures recevables seulement) :
        - Calcul d'un ratio moyen candidatures recevables / candidatures sur les années 2011 à 2013, pour chaque section indépendamment ;
        - Application de ce ratio aux données de la fiche 2013 (donc pour les années 2009 et 2010, les suivantes étant dans la fiche 2015) ;
1. Traitement des données par des [scripts R](https://github.com/cpesr/emploiESR/tree/main/R) :
    + Normalisation des données ;
    + Intégration des données extérieures ;
    + Calcul des métriques supplémentaires ;
1. Production et mise en ligne des visualisations pour commentaires : [visualisations](https://github.com/cpesr/emploiESR/blob/main/emploiEC/emploiEC.md) ;
1. Production de ce rapport.

## Note sur les qualifications multiples

Une proportion non négligeable de candidats postule dans plusieurs sections. 
Les candidats dans ce cas apparaissent dans les données une fois par section, 
une fois par grande discipline, et une fois dans l'ensemble.
Ceci explique que la somme du nombre de candidats par section ne correspond pas 
au nombre de candidats par grande discipline et dans l'ensemble.

En revanche, les postes ne sont comptabilisés que pour une seule section, et les
sommes sont cohérentes.

## Remerciements

Les auteurs tiennent à remercier vivement [Rémy Grünblatt](https://social.sciences.re/@RGrunblatt) pour son interface https://sciences.re/postes/ et l'aide pour l'accès aux données Odyssée, 
ainsi que le SIES pour l'ouverture des données administratives de l'ESR.


