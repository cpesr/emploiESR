
## Présentation des données 


Les données temporelles sont systématiquement présentées sous quatre formes :

- `Ensemble` : toutes disciplines confondues ;
- `Ensemble en base 100` : toutes disciplines confondues, en base 100 pour la première année ;
- `Disciplinaire` : par grandes disciplines du CNU ;
- `Disciplinaire en base 100` : par grandes disciplines du CNU, en base 100 pour la première année.


Les grandes disciplines du CNU sont :

- `DEG` : Droit, Economie, Gestion ;
- `LLASHS` : Lettres, Langues, Arts, Sciences Humaines et Sociales ;
- `Pharma` : Pharmacie ;
- `ST` : Sciences et Technologies, parfois aussi appelée `SI`, Sciences et sciences de l'Ingénieur.

Les disciplines de santé et médecine ont un système de recrutement différent qui
n'est pas traité dans ce document.

  
## Source des données

- Données originales :
  - [Fiches démographiques du CNU](https://www.enseignementsup-recherche.gouv.fr/pid24672-cid85019/fiches-demographiques-des-sections-du-cnu.html)
  - [Bilans de campagne de recrutement](https://www.enseignementsup-recherche.gouv.fr/cid118435/personnels-enseignants-du-superieur-bilans-et-statistiques.html#recrutement)

- Données aggrégées : 
  - [cpesr-emplois-cnu-qualification-concours.csv](../data/cpesr-emplois-cnu-qualification-concours.csv)
  - [cpesr-emplois-ec.csv](cpesr-emplois-ec.csv)

- Autres données :
  - [Les enseignants titulaires dans les établissements publics de l'enseignement supérieur](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-titulaires-esr-public/export/?flg=fr&disjunctive.annee)
  - [Statistiques sur les effectifs d'étudiants inscrits par établissement public sous tutelle du ministère en charge de l'Enseignement supérieur (hors doubles inscriptions université-CPGE)](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-statistiques-sur-les-effectifs-d-etudiants-inscrits-par-etablissement-hcp/)

```{=latex}
\vfill\null
\columnbreak
```

## Acquisition et traitement des données

1. Acquisition manuelle d'un sous-ensemble des données provenant des `fiches démographiques du CNU` ;
1. Visualisations exploratoires :
    + à propos de la qualification : [visualisations](https://github.com/cpesr/RFC/blob/main/ConcoursMCF/QualificationMCF.md) ;
    + à propos du concours : [visualisations](https://github.com/cpesr/RFC/blob/main/ConcoursMCF/ConcoursMCF.md) ;
1. Acquisition automatisée par le script [cnu-excavator](https://github.com/cpesr/emploiESR/tree/main/utils/cnu-excavator), pour les années 2013, 2015 et 2019, des tableaux :
    + `3.1 - Qualification aux fonctions d'enseignant-chercheur - Nombre de candidats et de qualifiés (y compris la qualification "de groupe")` ;
    + `3.2 - Recrutement des enseignants-chercheurs - Postes publiés et pourvus, taux de pression et part des postes non pourvus - Session synchronisée et "au fil de l'eau"` ;
1. Correction des erreurs détectées :
    + Inversion du nombre de candidats en 2019 entre les groupes Pharma. et ST ;
    + Changement de méthodologie pour les candidats à la qualification entre les fiches 2013 (candidatures totales) et 2015 (candidatures recevables seulement) :
        - Calcul d'un ratio moyen candidatures recevables / candidatures sur les années 2011 à 2013, pour chaque section indépendamment ;
        - Application de ce ratio aux données de la fiche 2013 (donc pour les années 2009 et 2010, les suivantes étant dans la fiche 2015) ;
1. Traitement des données par des [scripts R](https://github.com/cpesr/emploiESR/tree/main/R) :
    + Normalisation des données ;
    + Intégration des données extérieures ;
    + Calcul des métriques supplémentaires ;
1. Production et mise en ligne des visualisations pour commentaires : [visualisations](https://github.com/cpesr/emploiESR/blob/main/emploiEC/emploiEC.md) ;
1. Production de ce rapport.

## Avertissement global

Ce document est présente un travail de traitement et de représentation de données ouvertes.
Ces traitements et représentations, aussi bien que les données sources, peuvent 
faire l'objet d'erreurs, y compris d'interprétation.

La plus grande prudence dans leur utilisation est indispensable.

La totalité des données et traitement est disponible à l'adresse :

https://github.com/cpesr/emploiESR/

