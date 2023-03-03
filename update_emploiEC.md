EmploiEC: update data
================
CPESR
2023-03-03

## Chargement des données sources

### Sections CNU

<details>
<summary>
cnu.section
</summary>

| SectionCNU.ID | SectionCNU                            | SousGroupeCNU                      | GroupeCNU.ID | GroupeCNU                          | GrandeDisciplineCNU.ID | GrandeDisciplineCNU |
|--------------:|:--------------------------------------|:-----------------------------------|:-------------|:-----------------------------------|:-----------------------|:--------------------|
|             0 | Sans discipline                       | NA                                 | NA           | NA                                 | NA                     | NA                  |
|             1 | Droit privé et sciences criminelles   | Droit et science politique         | 1            | Droit et science politique         | DEG                    | Droit éco gestion   |
|             2 | Droit public                          | Droit et science politique         | 1            | Droit et science politique         | DEG                    | Droit éco gestion   |
|             3 | Histoire du droit et des institutions | Droit et science politique         | 1            | Droit et science politique         | DEG                    | Droit éco gestion   |
|             4 | Science politique                     | Droit et science politique         | 1            | Droit et science politique         | DEG                    | Droit éco gestion   |
|             5 | Sciences économiques                  | Sciences économiques et de gestion | 2            | Sciences économiques et de gestion | DEG                    | Droit éco gestion   |

</details>
<details>
<summary>
cnu.périmètres
</summary>

| Périmètre | Périmètre.ID | Périmètre.label                       |
|:----------|:-------------|:--------------------------------------|
| Section   | 0            | Sans discipline                       |
| Section   | 1            | Droit privé et sciences criminelles   |
| Section   | 2            | Droit public                          |
| Section   | 3            | Histoire du droit et des institutions |
| Section   | 4            | Science politique                     |
| Section   | 5            | Sciences économiques                  |

</details>

### Enseignants

    ## Joining, by = "SectionCNU.ID"

<details>
<summary>
ens
</summary>

| Périmètre | Périmètre.ID | Année | Effectif.MCF | Effectif.PR |
|:----------|:-------------|------:|-------------:|------------:|
| Section   | 0            |  2010 |          488 |         612 |
| Section   | 1            |  2010 |         1208 |         567 |
| Section   | 2            |  2010 |          791 |         513 |
| Section   | 3            |  2010 |          160 |         109 |
| Section   | 4            |  2010 |          224 |         124 |
| Section   | 5            |  2010 |         1277 |         531 |

</details>

### Etudiants

<details>
<summary>
etu
</summary>

| Année | Périmètre.ID | Effectif.ETU | Périmètre         |
|------:|:-------------|-------------:|:------------------|
|  2010 | DEG          |       449585 | Grande discipline |
|  2010 | Ensemble     |      1515481 | Ensemble          |
|  2010 | LLASHS       |       491728 | Grande discipline |
|  2010 | Pharma       |        22796 | Grande discipline |
|  2010 | Sans         |            0 | Grande discipline |
|  2010 | Santé        |       203118 | Grande discipline |

</details>

### Fiches démographiques CNU

<details>
<summary>
cnu.fd
</summary>

| Périmètre | Périmètre.ID | Année | Qualification.Candidats.PR | Qualification.Candidats.PR.femmes | Qualification.Qualifiés.PR | Qualification.Qualifiés.PR.femmes | Qualification.Candidats.MCF | Qualification.Candidats.MCF.femmes | Qualification.Qualifiés.MCF | Qualification.Qualifiés.MCF.femmes | Concours.Postes.PR | Concours.Candidats.PR | Concours.Candidats.PR.femmes | Concours.Recrutés.PR | Concours.Recrutés.PR.femmes | Concours.Postes.MCF | Concours.Candidats.MCF | Concours.Candidats.MCF.femmes | Concours.Recrutés.MCF | Concours.Recrutés.MCF.femmes |
|:----------|:-------------|------:|---------------------------:|----------------------------------:|---------------------------:|----------------------------------:|----------------------------:|-----------------------------------:|----------------------------:|-----------------------------------:|-------------------:|----------------------:|-----------------------------:|---------------------:|----------------------------:|--------------------:|-----------------------:|------------------------------:|----------------------:|-----------------------------:|
| Ensemble  | Ensemble     |  2009 |                   2473.362 |                             0.298 |                       1745 |                             0.295 |                   10182.331 |                               43.8 |                        7087 |                              0.441 |               1185 |                  2269 |                        0.292 |                  947 |                       0.307 |                2194 |                   9756 |                         0.449 |                  2036 |                        0.417 |
| Ensemble  | Ensemble     |  2010 |                   2058.798 |                             0.285 |                       1453 |                             0.282 |                    8670.845 |                               44.2 |                        6081 |                              0.449 |               1129 |                  2138 |                        0.286 |                  899 |                       0.297 |                2101 |                   9706 |                         0.458 |                  1963 |                        0.434 |
| Ensemble  | Ensemble     |  2011 |                   2069.000 |                             0.293 |                       1602 |                             0.295 |                    8996.000 |                               44.0 |                        6503 |                              0.433 |               1162 |                  2420 |                        0.279 |                  970 |                       0.319 |                1989 |                   9918 |                         0.464 |                  1881 |                        0.448 |
| Ensemble  | Ensemble     |  2012 |                   2092.000 |                             0.304 |                       1630 |                             0.306 |                    9089.000 |                               45.2 |                        6689 |                              0.445 |               1075 |                  2434 |                        0.295 |                  883 |                       0.293 |                1852 |                   9697 |                         0.465 |                  1742 |                        0.452 |
| Ensemble  | Ensemble     |  2013 |                   2091.000 |                             0.332 |                       1657 |                             0.337 |                    9190.000 |                               45.1 |                        6799 |                              0.439 |                817 |                  2072 |                        0.303 |                  717 |                       0.317 |                1675 |                   9859 |                         0.459 |                  1593 |                        0.465 |
| Ensemble  | Ensemble     |  2014 |                   2030.000 |                             0.334 |                       1591 |                             0.339 |                    9123.000 |                               46.3 |                        6767 |                              0.459 |                802 |                  2084 |                        0.314 |                  711 |                       0.340 |                1447 |                   9680 |                         0.463 |                  1393 |                        0.447 |

</details>

### DGRH

    ## Joining, by = "SectionCNU.ID"

    ## 
    ## <details>
    ##   <summary> dgrh </summary>
    ## 
    ## 
    ## 
    ## | Année|Périmètre |Périmètre.ID | Concours.Postes.MCF| Concours.Recrutés.MCF|
    ## |-----:|:---------|:------------|-------------------:|---------------------:|
    ## |  2002|Ensemble  |Ensemble     |                2417|                  2188|
    ## |  2003|Ensemble  |Ensemble     |                2158|                  2054|
    ## |  2004|Ensemble  |Ensemble     |                2357|                  2228|
    ## |  2005|Ensemble  |Ensemble     |                2091|                  2011|
    ## |  2006|Ensemble  |Ensemble     |                2318|                  2200|
    ## |  2007|Ensemble  |Ensemble     |                2284|                  2159|
    ## 
    ## 
    ## </details>

## Données temporaires galaxie

    ## Joining, by = "SectionCNU.ID"

<details>
<summary>
galaxie
</summary>

| Année | Périmètre | Périmètre.ID | Concours.Postes.MCF | Concours.Postes.PR |
|------:|:----------|:-------------|--------------------:|-------------------:|
|  2018 | Ensemble  | Ensemble     |                1082 |                576 |
|  2019 | Ensemble  | Ensemble     |                1029 |                580 |
|  2020 | Ensemble  | Ensemble     |                1119 |                620 |
|  2021 | Ensemble  | Ensemble     |                1047 |                606 |
|  2022 | Ensemble  | Ensemble     |                1281 |                679 |
|  2023 | Ensemble  | Ensemble     |                1493 |                642 |

</details>

## Fusions

    ## Joining, by = c("Périmètre", "Périmètre.ID")
    ## Joining, by = c("Périmètre", "Périmètre.ID", "Année")
    ## Joining, by = c("Périmètre", "Périmètre.ID", "Année")

<details>
<summary>
emploisEC
</summary>

| Périmètre | Périmètre.ID | Périmètre.label | Année | Concours.Postes.MCF | Concours.Recrutés.MCF | Qualification.Candidats.PR | Qualification.Candidats.PR.femmes | Qualification.Qualifiés.PR | Qualification.Qualifiés.PR.femmes | Qualification.Candidats.MCF | Qualification.Candidats.MCF.femmes | Qualification.Qualifiés.MCF | Qualification.Qualifiés.MCF.femmes | Concours.Postes.PR | Concours.Candidats.PR | Concours.Candidats.PR.femmes | Concours.Recrutés.PR | Concours.Recrutés.PR.femmes | Concours.Candidats.MCF | Concours.Candidats.MCF.femmes | Concours.Recrutés.MCF.femmes | Source | Effectif.MCF | Effectif.PR | Effectif.ETU | Effectif.EC | Contexte.TauxEncadrement | Contexte.EvolRéelle | Contexte.EvolNécessaire | kpi.MCF.TauxTension | kpi.MCF.TauxRéussite | kpi.MCF.SansPoste | kpi.MCF.TauxSélection | kpi.MCF.TauxSélection.Qualification | kpi.MCF.TauxSélection.Concours | kpi.MCF.TauxSélection.QualifVsConcours | kpi.PériodeRenouvellement |
|:----------|:-------------|:----------------|:------|--------------------:|----------------------:|---------------------------:|----------------------------------:|---------------------------:|----------------------------------:|----------------------------:|-----------------------------------:|----------------------------:|-----------------------------------:|-------------------:|----------------------:|-----------------------------:|---------------------:|----------------------------:|-----------------------:|------------------------------:|-----------------------------:|:-------|-------------:|------------:|-------------:|------------:|-------------------------:|--------------------:|------------------------:|--------------------:|---------------------:|------------------:|----------------------:|------------------------------------:|-------------------------------:|---------------------------------------:|--------------------------:|
| Ensemble  | Ensemble     | Ensemble        | 2002  |                2417 |                  2188 |                         NA |                                NA |                         NA |                                NA |                          NA |                                 NA |                          NA |                                 NA |                 NA |                    NA |                           NA |                   NA |                          NA |                     NA |                            NA |                           NA | DGRH   |           NA |          NA |           NA |          NA |                       NA |                  NA |                      NA |                  NA |                   NA |                NA |                    NA |                                  NA |                             NA |                                     NA |                        NA |
| Ensemble  | Ensemble     | Ensemble        | 2003  |                2158 |                  2054 |                         NA |                                NA |                         NA |                                NA |                          NA |                                 NA |                          NA |                                 NA |                 NA |                    NA |                           NA |                   NA |                          NA |                     NA |                            NA |                           NA | DGRH   |           NA |          NA |           NA |          NA |                       NA |                  NA |                      NA |                  NA |                   NA |                NA |                    NA |                                  NA |                             NA |                                     NA |                        NA |
| Ensemble  | Ensemble     | Ensemble        | 2004  |                2357 |                  2228 |                         NA |                                NA |                         NA |                                NA |                          NA |                                 NA |                          NA |                                 NA |                 NA |                    NA |                           NA |                   NA |                          NA |                     NA |                            NA |                           NA | DGRH   |           NA |          NA |           NA |          NA |                       NA |                  NA |                      NA |                  NA |                   NA |                NA |                    NA |                                  NA |                             NA |                                     NA |                        NA |
| Ensemble  | Ensemble     | Ensemble        | 2005  |                2091 |                  2011 |                         NA |                                NA |                         NA |                                NA |                          NA |                                 NA |                          NA |                                 NA |                 NA |                    NA |                           NA |                   NA |                          NA |                     NA |                            NA |                           NA | DGRH   |           NA |          NA |           NA |          NA |                       NA |                  NA |                      NA |                  NA |                   NA |                NA |                    NA |                                  NA |                             NA |                                     NA |                        NA |
| Ensemble  | Ensemble     | Ensemble        | 2006  |                2318 |                  2200 |                         NA |                                NA |                         NA |                                NA |                          NA |                                 NA |                          NA |                                 NA |                 NA |                    NA |                           NA |                   NA |                          NA |                     NA |                            NA |                           NA | DGRH   |           NA |          NA |           NA |          NA |                       NA |                  NA |                      NA |                  NA |                   NA |                NA |                    NA |                                  NA |                             NA |                                     NA |                        NA |
| Ensemble  | Ensemble     | Ensemble        | 2007  |                2284 |                  2159 |                         NA |                                NA |                         NA |                                NA |                          NA |                                 NA |                          NA |                                 NA |                 NA |                    NA |                           NA |                   NA |                          NA |                     NA |                            NA |                           NA | DGRH   |           NA |          NA |           NA |          NA |                       NA |                  NA |                      NA |                  NA |                   NA |                NA |                    NA |                                  NA |                             NA |                                     NA |                        NA |

</details>
<table>
<thead>
<tr>
<th style="text-align:left;">
Périmètre
</th>
<th style="text-align:left;">
Périmètre.ID
</th>
<th style="text-align:left;">
Périmètre.label
</th>
<th style="text-align:right;">
nb_lignes
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Grande discipline
</td>
<td style="text-align:left;">
Santé
</td>
<td style="text-align:left;">
Santé
</td>
<td style="text-align:right;">
2
</td>
</tr>
<tr>
<td style="text-align:left;">
Grande discipline
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:right;">
2
</td>
</tr>
<tr>
<td style="text-align:left;">
Groupe
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:right;">
9
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
75
</td>
<td style="text-align:left;">
Théologie
</td>
<td style="text-align:right;">
2
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
76
</td>
<td style="text-align:left;">
Théologie catholique
</td>
<td style="text-align:right;">
18
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
77
</td>
<td style="text-align:left;">
Théologie protestante
</td>
<td style="text-align:right;">
18
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
90
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:right;">
2
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
91
</td>
<td style="text-align:left;">
Sciences de la rééducation et de réadaptation
</td>
<td style="text-align:right;">
2
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
92
</td>
<td style="text-align:left;">
Sciences infirmières
</td>
<td style="text-align:right;">
2
</td>
</tr>
</tbody>
</table>

## Ecriture des données

## Effacement du cache
