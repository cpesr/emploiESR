Emploi dans l’ESR
================

## Organisation

-   [data](data/) : jeux de données
-   [galaxie-excavator](galaxie-excavator/) : outil d’extraction des
    données de Galaxie

## Jeux de données

### Extraction des fiches démographiques du CNU

-   Données :
    [cpesr-emplois-cnu-qualification-concours](data/cpesr-emplois-cnu-qualification-concours.csv)
-   Source :
    <https://www.enseignementsup-recherche.gouv.fr/pid24672-cid85019/fiches-demographiques-des-sections-du-cnu.html>
-   Mise à jour :19-10-2021
-   Nombre d’observations : 812
-   Variables :
    -   Périmètre
    -   Périmètre.ID
    -   Année
    -   Qualification.Candidats.PR
    -   Qualification.Candidats.PR.femmes
    -   Qualification.Qualifiés.PR
    -   Qualification.Qualifiés.PR.femmes
    -   Qualification.Candidats.MCF
    -   Qualification.Candidats.MCF.femmes
    -   Qualification.Qualifiés.MCF
    -   Qualification.Qualifiés.MCF.femmes
    -   Concours.Postes.PR
    -   Concours.Candidats.PR
    -   Concours.Candidats.PR.femmes
    -   Concours.Recrutés.PR
    -   Concours.Recrutés.PR.femmes
    -   Concours.Postes.MCF
    -   Concours.Candidats.MCF
    -   Concours.Candidats.MCF.femmes
    -   Concours.Recrutés.MCF
    -   Concours.Recrutés.MCF.femmes

### Qualifications et recrutements MCF par section CNU

-   Données :
    [cpesr-emplois-cnu-mcf-qualification-recrutement](data/cpesr-emplois-cnu-mcf-qualification-recrutement.csv)
-   Source :
    <https://www.enseignementsup-recherche.gouv.fr/cid118435/personnels-enseignants-du-superieur-bilans-et-statistiques.html>
-   Mise à jour :23-11-2020
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
-   Changement en 2005 des numéros de section CNU de Pharmacie : 39 à 41
    deviennent 85 à 87.
    -   Le changement est appliqué de façon rétroactive dans tout le
        jeu.
-   Ventilation par section CNU pour la deuxième session manquante
    pour 2008.
    -   Cette année présente un nombre de postes incorrectement plus
        faible d’environ 10%.
-   Liste d’aptitude : entre 2002 et 2005, les postes ouverts réservés
    aux assistants titulaires (article 62 pour fusion des corps depuis
    le décret de 1984) ne sont pas comptabilisés. Il y en avait 250 par
    an.
-   Les postes prennent en compte les mutations et détachements.

### Mutations régionales entrantes et sortantes

-   Données :
    [cpesr-emplois-mutations-ES](data/cpesr-emplois-mutations-ES.csv)
-   Source :
    <https://www.enseignementsup-recherche.gouv.fr/cid118435/personnels-enseignants-du-superieur-bilans-et-statistiques.html>
-   Mise à jour :23-11-2020
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
    [cpesr-emplois-mutations-flux](data/cpesr-emplois-mutations-flux.csv)
-   Source :
    <https://www.enseignementsup-recherche.gouv.fr/cid118435/personnels-enseignants-du-superieur-bilans-et-statistiques.html>
-   Mise à jour :23-11-2020
-   Nombre d’observations : 8170
-   Période : 2014 2019
-   Variables :
    -   Annee
    -   Academie.origine
    -   Academie.recrutement
    -   Groupe.CNU
    -   MCF

### Extraction des données Galaxie

-   Données : [cpesr-emplois-galaxie](data/cpesr-emplois-galaxie.csv)
-   Source :
    <https://www.galaxie.enseignementsup-recherche.gouv.fr/ensup/ListesPostesPublies/Emplois_publies_TrieParCorps.html>
-   Mise à jour :26-02-2021
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

### Sections CNU

-   Données : [cpesr-cnu-sections](data/cpesr-cnu-sections.csv)
-   Source : manuelle
-   Mise à jour :27-07-0201
-   Nombre d’observations : 81
-   Variables :
    -   SectionCNU.ID
    -   SectionCNU
    -   SousGroupeCNU
    -   GroupeCNU.ID
    -   GroupeCNU
    -   GrandeDisciplineCNU.ID
    -   GrandeDisciplineCNU

### Effectifs enseignants titulaires

-   Données :
    [fr-esr-enseignants-titulaires-esr-public.csv](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-titulaires-esr-public/download/?format=csv&timezone=Europe/Berlin&lang=fr&use_labels_for_header=true&csv_separator=%3B)
    (à récupérer)
-   Source :
    <https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-titulaires-esr-public/>
