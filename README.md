Emploi dans l’ESR
================

- [cpesr-emplois-ec.csv](data/cpesr-emplois-ec.csv) : données agrégées
  sur les emplois EC dans l’ESR
- [data](data/) : tous les jeux de données
- [odyssee-excavator](utils/odyssee-excavator/) : outil d’extraction des
  données de Odyssee

## Jeux de données

### Extraction des fiches démographiques du CNU

- Données : [data/cpesr-emplois-ec-cnu](data/cpesr-emplois-ec-cnu.csv)
- Source :
  <https://www.enseignementsup-recherche.gouv.fr/pid24672-cid85019/fiches-demographiques-des-sections-du-cnu.html>
- Mise à jour : 2024-11-05 23:47:51.322564
- Nombre d’observations : 1123
- Variables :
  - Périmètre
  - Périmètre.ID
  - Année
  - Qualification.Candidats.PR
  - Qualification.Candidats.PR.femmes
  - Qualification.Qualifiés.PR
  - Qualification.Qualifiés.PR.femmes
  - Qualification.Candidats.MCF
  - Qualification.Candidats.MCF.femmes
  - Qualification.Qualifiés.MCF
  - Qualification.Qualifiés.MCF.femmes
  - Concours.Postes.PR
  - Concours.Candidats.PR
  - Concours.Candidats.PR.femmes
  - Concours.Recrutés.PR
  - Concours.Recrutés.PR.femmes
  - Concours.Postes.MCF
  - Concours.Candidats.MCF
  - Concours.Candidats.MCF.femmes
  - Concours.Recrutés.MCF
  - Concours.Recrutés.MCF.femmes

### Extraction des données Galaxie

- Données :
  [utils/galaxie-excavator/galaxie](utils/galaxie-excavator/galaxie.csv)
- Source :
  <https://www.galaxie.enseignementsup-recherche.gouv.fr/ensup/ListesPostesPublies/Emplois_publies_TrieParCorps.html>
- Mise à jour : 2025-03-03 23:06:24.410763
- Nombre d’observations : 15035
- Variables :
  - Année
  - UAI
  - Etablissement
  - Référence.GALAXIE
  - N..dans.le.SI.local
  - Article
  - Corps
  - Chaire
  - Section
  - Section2
  - Section3
  - Date.de.prise.de.fonction
  - Date.ouverture.cand
  - Date.clôture.cand
  - Profil
  - Localisation
  - Etat.de.vacance
  - typeCampagne

### Extraction des données Odyssée

- Données :
  [utils/odyssee-excavator/odyssee](utils/odyssee-excavator/odyssee.csv)
- Source :
  <https://www.galaxie.enseignementsup-recherche.gouv.fr/ensup/ListesPostesPublies/Emplois_publies_TrieParCorps.html>
- Mise à jour : 2025-03-12 21:09:14.538248
- Nombre d’observations : 2800
- Variables :
  - etablissementLibelle.id.articleReference.corps.chaire.section.section2.section3.datePublicationPoste.datePriseDePoste.dateOuvertureCandidatures.dateFermetureCandidatures.descriptionPoste.typeCandidatureConcours.typeCandidatureMutation.typeCandidatureDétachement.typeCandidatureRecrutementEtranger.typeCandidatureIntégrationDirecte.typeCandidatureRecrutementSurContrat.région.etatPoste.statutPoste.typeCampagne.dateScraping

### Sections CNU

- Données : [data/cpesr-cnu-sections](data/cpesr-cnu-sections.csv)
- Source : manuelle
- Mise à jour : 2024-11-05 19:35:24.801516
- Nombre d’observations : 80
- Variables :
  - SectionCNU.ID
  - SectionCNU
  - SousGroupeCNU
  - GroupeCNU.ID
  - GroupeCNU
  - GrandeDisciplineCNU.ID
  - GrandeDisciplineCNU

### Effectifs enseignants titulaires

- Données :
  [fr-esr-enseignants-titulaires-esr-public.csv](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-titulaires-esr-public/download/?format=csv&timezone=Europe/Berlin&lang=fr&use_labels_for_header=true&csv_separator=%3B)
  (à récupérer)
- Source :
  <https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-titulaires-esr-public/>
