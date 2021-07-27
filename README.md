Etude de l’emploi dans l’ESR
================

## Organisation

-   [data](data/) : jeux de données
-   [galaxie](galaxie/) : outil d’extraction des données de Galaxie

## Jeux de données

### Extraction des données Galaxie

-   Données :
    [cpesr-emplois-galaxie.csv](data/cpesr-emplois-galaxie.csv)
-   Source :
    <https://www.galaxie.enseignementsup-recherche.gouv.fr/ensup/ListesPostesPublies/Emplois_publies_TrieParCorps.html>
-   Mise à jour : 26-02-2021
-   Nombre d’observations : 6659
-   Période : 2018 2021
-   Variables :
    -   UAI
    -   Etablissement
    -   Référence.GALAXIE
    -   N..dans.le.SI.local
    -   Article
    -   Corps
    -   Chaire
    -   Section
    -   Section2
    -   Section3
    -   Date.de.prise.de.fonction
    -   Date.ouverture.cand
    -   Date.clôture.cand
    -   Profil
    -   Localisation
    -   Etat.de.vacance
    -   Annee

### Qualifications et recrutements MCF par section CNU

-   Données :
    [cpesr-emplois-cnu-mcf-qualification-recrutement.csv](data/cpesr-emplois-cnu-mcf-qualification-recrutement.csv)
-   Source :
    <https://www.enseignementsup-recherche.gouv.fr/cid118435/personnels-enseignants-du-superieur-bilans-et-statistiques.html>
-   Mise à jour : 23-11-2020
-   Nombre d’observations : 1024
-   Période : 2002 2019
-   Variables :
    -   TypeRecrutement
    -   SectionCNU.ID
    -   Annee
    -   QualificationDossiers.MCF
    -   QualificationQualifies.MCF
    -   PostesPublies.MCF
    -   Candidatures.MCF
    -   Candidats.MCF
    -   PostesPourvus.MCF
    -   Candidatures.MCF.F
    -   Candidatures.MCF.H
    -   Candidats.MCF.F
    -   Candidats.MCF.H
    -   Recrutes.MCF.F
    -   Recrutes.MCF.H

### Mutations régionales entrantes et sortantes

-   Données :
    [cpesr-emplois-mutations-ES.csv](data/cpesr-emplois-mutations-ES.csv)
-   Source :
    <https://www.enseignementsup-recherche.gouv.fr/cid118435/personnels-enseignants-du-superieur-bilans-et-statistiques.html>
-   Mise à jour : 23-11-2020
-   Nombre d’observations : 474
-   Période : 2004 2019
-   Variables :
    -   Academie
    -   Annee
    -   Solde.mutation.PR
    -   Solde.mutation.MCF
    -   Solde.mutation.total

### Mutations régionales flux

-   Données :
    [cpesr-emplois-mutations-flux.csv](data/cpesr-emplois-mutations-flux.csv)
-   Source :
    <https://www.enseignementsup-recherche.gouv.fr/cid118435/personnels-enseignants-du-superieur-bilans-et-statistiques.html>
-   Mise à jour : 23-11-2020
-   Nombre d’observations : 8170
-   Période : 2014 2019
-   Variables :
    -   Annee
    -   Academie.origine
    -   Academie.recrutement
    -   Groupe.CNU
    -   MCF

### Sections CNU

-   Données : [cpesr-cnu-sections.csv](data/cpesr-cnu-sections.csv)
-   Mise à jour : 27-07-0201
-   Nombre d’observations : 58
-   Variables :
    -   SectionCNU.ID
    -   SectionCNU
    -   SousGroupeCNU
    -   GroupeCNU
    -   GrandeDisciplineCNU
    -   GDCNU

### Effectifs enseignants titulaires

-   Données :
    [fr-esr-enseignants-titulaires-esr-public.csv](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-titulaires-esr-public/download/?format=csv&timezone=Europe/Berlin&lang=fr&use_labels_for_header=true&csv_separator=%3B)
    (à récupérer)
-   Source :
    <https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-titulaires-esr-public/>
