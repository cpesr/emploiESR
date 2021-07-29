Emploi dans l’ESR
================

## Organisation

-   [data](data/) : jeux de données
-   [galaxie-excavator](galaxie-excavator/) : outil d’extraction des
    données de Galaxie

## Jeux de données

### Extraction des données Galaxie

-   Données :
    [cpesr-emplois-galaxie](data/%20cpesr-emplois-galaxie%20.csv)
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
    [cpesr-emplois-cnu-mcf-qualification-recrutement](data/%20cpesr-emplois-cnu-mcf-qualification-recrutement%20.csv)
-   Source :
    <https://www.enseignementsup-recherche.gouv.fr/cid118435/personnels-enseignants-du-superieur-bilans-et-statistiques.html>
-   Mise à jour : 23-11-2020
-   Nombre d’observations : 1024
-   Période : 2002 2019
-   Variables :
    -   Annee
    -   SectionCNU.ID
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
-   Notes :
    -   Changement en 2005 des numéros de section CNU de Pharmacie : 39
        à 41 deviennent 85 à 87.
        -   Le changement est appliqué de façon rétroactive dans tout le
            jeu.
    -   Ventilation par section CNU pour la deuxième session manquante
        pour 2008.
        -   Cette année présente un nombre de postes incorrectement plus
            faible d’environ 10%.

### Mutations régionales entrantes et sortantes

-   Données :
    [cpesr-emplois-mutations-ES](data/%20cpesr-emplois-mutations-ES%20.csv)
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
    [cpesr-emplois-mutations-flux](data/%20cpesr-emplois-mutations-flux%20.csv)
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

-   Données : [cpesr-cnu-sections](data/%20cpesr-cnu-sections%20.csv)
-   Source : manuelle
-   Mise à jour : 27-07-0201
-   Nombre d’observations : 59
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
