EmploiEC: update data
================
CPESR
2023-03-10

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

<details>
<summary>
dgrh
</summary>

| Année | Périmètre         | Périmètre.ID | Concours.Postes.MCF | Concours.Candidatures.MCF | Concours.Candidats.MCF | Concours.Recrutés.MCF | Concours.Candidatures.MCF.femmes | Concours.Candidatures.MCF.hommes | Concours.Candidats.MCF.femmes | concours.Candidats.MCF.hommes | Concours.Recrutés.MCF.femmes | Concours.Recrutés.MCF.hommes |
|------:|:------------------|:-------------|--------------------:|--------------------------:|-----------------------:|----------------------:|---------------------------------:|---------------------------------:|------------------------------:|------------------------------:|-----------------------------:|-----------------------------:|
|  2002 | Ensemble          | Ensemble     |                2417 |                        NA |                     NA |                  2188 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2003 | Ensemble          | Ensemble     |                2158 |                        NA |                     NA |                  2054 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2004 | Ensemble          | Ensemble     |                2357 |                        NA |                     NA |                  2228 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2005 | Ensemble          | Ensemble     |                2091 |                        NA |                     NA |                  2011 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2006 | Ensemble          | Ensemble     |                2318 |                        NA |                     NA |                  2200 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2007 | Ensemble          | Ensemble     |                2284 |                        NA |                     NA |                  2159 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2008 | Ensemble          | Ensemble     |                2060 |                        NA |                     NA |                  1909 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2009 | Ensemble          | Ensemble     |                2194 |                        NA |                  14836 |                    NA |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2010 | Ensemble          | Ensemble     |                2101 |                        NA |                  14404 |                    NA |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2011 | Ensemble          | Ensemble     |                1989 |                        NA |                  15085 |                    NA |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2012 | Ensemble          | Ensemble     |                1852 |                        NA |                  14464 |                    NA |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2013 | Ensemble          | Ensemble     |                1675 |                     55254 |                  13807 |                  1593 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2014 | Ensemble          | Ensemble     |                1447 |                     49777 |                  13570 |                  1393 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2015 | Ensemble          | Ensemble     |                1299 |                     46767 |                  13426 |                  1256 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2016 | Ensemble          | Ensemble     |                1328 |                     52158 |                  14104 |                  1287 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2017 | Ensemble          | Ensemble     |                1254 |                     47569 |                  13392 |                  1188 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2018 | Ensemble          | Ensemble     |                1183 |                     41538 |                  12441 |                  1104 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2019 | Ensemble          | Ensemble     |                1070 |                     39682 |                  11494 |                    NA |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2002 | Grande discipline | DEG          |                 425 |                        NA |                     NA |                   287 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |
|  2002 | Grande discipline | LLASHS       |                 923 |                        NA |                     NA |                   866 |                               NA |                               NA |                            NA |                            NA |                           NA |                           NA |

</details>

### DPE

    ## Joining, by = "SectionCNU.ID"

<details>
<summary>
dpe
</summary>

| Année | Périmètre         | Périmètre.ID | Concours.Postes.MCF | Concours.Recrutés.MCF | Concours.Postes.PR | Concours.Recrutés.PR |
|------:|:------------------|:-------------|--------------------:|----------------------:|-------------------:|---------------------:|
|  2001 | Ensemble          | Ensemble     |                1824 |                  1642 |                 NA |                  681 |
|  2002 | Ensemble          | Ensemble     |                2116 |                  1980 |                 NA |                  827 |
|  2003 | Ensemble          | Ensemble     |                1928 |                  1824 |                 NA |                  853 |
|  2004 | Ensemble          | Ensemble     |                2137 |                  2017 |                 NA |                  815 |
|  2005 | Ensemble          | Ensemble     |                1914 |                  1814 |                 NA |                  722 |
|  2006 | Ensemble          | Ensemble     |                2102 |                  1984 |                 NA |                  686 |
|  2007 | Ensemble          | Ensemble     |                2071 |                  1946 |                 NA |                  733 |
|  2008 | Ensemble          | Ensemble     |                1877 |                  1726 |                 NA |                  781 |
|  2001 | Grande discipline | DEG          |                 276 |                   243 |                 NA |                   88 |
|  2001 | Grande discipline | LLASHS       |                 665 |                   575 |                388 |                  253 |
|  2001 | Grande discipline | Pharma       |                  60 |                    56 |                 25 |                   24 |
|  2001 | Grande discipline | ST           |                 823 |                   768 |                432 |                  316 |
|  2002 | Grande discipline | DEG          |                 351 |                   307 |                 NA |                  121 |
|  2002 | Grande discipline | LLASHS       |                 781 |                   724 |                369 |                  261 |
|  2002 | Grande discipline | Pharma       |                  66 |                    64 |                 34 |                   31 |
|  2002 | Grande discipline | ST           |                 918 |                   885 |                501 |                  414 |
|  2003 | Grande discipline | DEG          |                 275 |                   253 |                 NA |                  100 |
|  2003 | Grande discipline | LLASHS       |                 661 |                   609 |                377 |                  274 |
|  2003 | Grande discipline | Pharma       |                  55 |                    53 |                 36 |                   30 |
|  2003 | Grande discipline | ST           |                 937 |                   909 |                501 |                  449 |

</details>

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

| Périmètre | Périmètre.ID | Périmètre.label | Année | Concours.Postes.MCF | Concours.Recrutés.MCF | Concours.Postes.PR | Concours.Recrutés.PR | Qualification.Candidats.PR | Qualification.Candidats.PR.femmes | Qualification.Qualifiés.PR | Qualification.Qualifiés.PR.femmes | Qualification.Candidats.MCF | Qualification.Candidats.MCF.femmes | Qualification.Qualifiés.MCF | Qualification.Qualifiés.MCF.femmes | Concours.Candidats.PR | Concours.Candidats.PR.femmes | Concours.Recrutés.PR.femmes | Concours.Candidats.MCF | Concours.Candidats.MCF.femmes | Concours.Recrutés.MCF.femmes | Source | Effectif.MCF | Effectif.PR | Effectif.ETU | Effectif.EC | Contexte.TauxEncadrement | Contexte.EvolRéelle | Contexte.EvolNécessaire | kpi.MCF.TauxTension | kpi.MCF.TauxRéussite | kpi.MCF.SansPoste | kpi.MCF.TauxSélection | kpi.MCF.TauxSélection.Qualification | kpi.MCF.TauxSélection.Concours | kpi.MCF.TauxSélection.QualifVsConcours | kpi.PériodeRenouvellement |
|:----------|:-------------|:----------------|:------|--------------------:|----------------------:|-------------------:|---------------------:|---------------------------:|----------------------------------:|---------------------------:|----------------------------------:|----------------------------:|-----------------------------------:|----------------------------:|-----------------------------------:|----------------------:|-----------------------------:|----------------------------:|-----------------------:|------------------------------:|-----------------------------:|:-------|-------------:|------------:|-------------:|------------:|-------------------------:|--------------------:|------------------------:|--------------------:|---------------------:|------------------:|----------------------:|------------------------------------:|-------------------------------:|---------------------------------------:|--------------------------:|
| Ensemble  | Ensemble     | Ensemble        | 2001  |                1824 |                  1642 |                 NA |                  681 |                         NA |                                NA |                         NA |                                NA |                          NA |                                 NA |                          NA |                                 NA |                    NA |                           NA |                          NA |                     NA |                            NA |                           NA | DGRH   |           NA |          NA |           NA |          NA |                       NA |                  NA |                      NA |                  NA |                   NA |                NA |                    NA |                                  NA |                             NA |                                     NA |                        NA |
| Ensemble  | Ensemble     | Ensemble        | 2002  |                2116 |                  1980 |                 NA |                  827 |                         NA |                                NA |                         NA |                                NA |                          NA |                                 NA |                          NA |                                 NA |                    NA |                           NA |                          NA |                     NA |                            NA |                           NA | DGRH   |           NA |          NA |           NA |          NA |                       NA |                  NA |                      NA |                  NA |                   NA |                NA |                    NA |                                  NA |                             NA |                                     NA |                        NA |
| Ensemble  | Ensemble     | Ensemble        | 2003  |                1928 |                  1824 |                 NA |                  853 |                         NA |                                NA |                         NA |                                NA |                          NA |                                 NA |                          NA |                                 NA |                    NA |                           NA |                          NA |                     NA |                            NA |                           NA | DGRH   |           NA |          NA |           NA |          NA |                       NA |                  NA |                      NA |                  NA |                   NA |                NA |                    NA |                                  NA |                             NA |                                     NA |                        NA |
| Ensemble  | Ensemble     | Ensemble        | 2004  |                2137 |                  2017 |                 NA |                  815 |                         NA |                                NA |                         NA |                                NA |                          NA |                                 NA |                          NA |                                 NA |                    NA |                           NA |                          NA |                     NA |                            NA |                           NA | DGRH   |           NA |          NA |           NA |          NA |                       NA |                  NA |                      NA |                  NA |                   NA |                NA |                    NA |                                  NA |                             NA |                                     NA |                        NA |
| Ensemble  | Ensemble     | Ensemble        | 2005  |                1914 |                  1814 |                 NA |                  722 |                         NA |                                NA |                         NA |                                NA |                          NA |                                 NA |                          NA |                                 NA |                    NA |                           NA |                          NA |                     NA |                            NA |                           NA | DGRH   |           NA |          NA |           NA |          NA |                       NA |                  NA |                      NA |                  NA |                   NA |                NA |                    NA |                                  NA |                             NA |                                     NA |                        NA |
| Ensemble  | Ensemble     | Ensemble        | 2006  |                2102 |                  1984 |                 NA |                  686 |                         NA |                                NA |                         NA |                                NA |                          NA |                                 NA |                          NA |                                 NA |                    NA |                           NA |                          NA |                     NA |                            NA |                           NA | DGRH   |           NA |          NA |           NA |          NA |                       NA |                  NA |                      NA |                  NA |                   NA |                NA |                    NA |                                  NA |                             NA |                                     NA |                        NA |

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
Ensemble
</td>
<td style="text-align:left;">
Ensemble
</td>
<td style="text-align:left;">
Ensemble
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Grande discipline
</td>
<td style="text-align:left;">
DEG
</td>
<td style="text-align:left;">
Droit éco gestion
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Grande discipline
</td>
<td style="text-align:left;">
LLASHS
</td>
<td style="text-align:left;">
Lettres et sciences humaines
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Grande discipline
</td>
<td style="text-align:left;">
Pharma
</td>
<td style="text-align:left;">
Pharmacie
</td>
<td style="text-align:right;">
23
</td>
</tr>
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
ST
</td>
<td style="text-align:left;">
Sciences et techniques
</td>
<td style="text-align:right;">
23
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
1
</td>
<td style="text-align:left;">
Droit et science politique
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Groupe
</td>
<td style="text-align:left;">
10
</td>
<td style="text-align:left;">
Biologie et biochimie
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Groupe
</td>
<td style="text-align:left;">
11
</td>
<td style="text-align:left;">
Pharmacie
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Groupe
</td>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
Groupe interdisciplinaire et STAPS
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Groupe
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
Sciences économiques et de gestion
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Groupe
</td>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
Littératures et Langues
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Groupe
</td>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
Sciences humaines et Histoire-Géographie
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Groupe
</td>
<td style="text-align:left;">
5
</td>
<td style="text-align:left;">
Mathématiques et Informatique
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Groupe
</td>
<td style="text-align:left;">
6
</td>
<td style="text-align:left;">
Physique
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Groupe
</td>
<td style="text-align:left;">
7
</td>
<td style="text-align:left;">
Chimie
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Groupe
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
Sciences de la Terre
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Groupe
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
Mécanique, génie mécanique, génie informatique, énergétique
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Groupe
</td>
<td style="text-align:left;">
Santé
</td>
<td style="text-align:left;">
Autres santé(mono-appartenants)
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
Théologie
</td>
<td style="text-align:left;">
Théologie
</td>
<td style="text-align:right;">
8
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
2
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
Droit privé et sciences criminelles
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
10
</td>
<td style="text-align:left;">
Littératures comparées
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
11
</td>
<td style="text-align:left;">
Langues et littératures anglaises et anglo-saxonnes
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
Langues et littératures germaniques et scandinaves
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
Langues et littératures slaves
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
14
</td>
<td style="text-align:left;">
Langues et littératures romanes : espagnol, italien, portugais, autres
langues romanes
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
Langues et littératures arabes, chinoises, japonaises, hébraïques,
d’autres domaines linguistiques
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
Psychologie et Ergonomie
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
17
</td>
<td style="text-align:left;">
Philosophie
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
18
</td>
<td style="text-align:left;">
Architecture et Arts : plastiques, du spectacle, musique, musicologie,
esthétique, sciences de l’art
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
19
</td>
<td style="text-align:left;">
Sociologie, démographie
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
Droit public
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
20
</td>
<td style="text-align:left;">
Anthropologie biologique, ethnologie, préhistoire
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
21
</td>
<td style="text-align:left;">
Histoire et civilisations : histoire et archéologie des mondes anciens
et des mondes médiévaux, de l’art
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
22
</td>
<td style="text-align:left;">
Histoire et civilisations : histoire des mondes modernes, histoire du
monde contemporain, de l’art, de la musique
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
23
</td>
<td style="text-align:left;">
Géographie physique, humaine, économique et régionale
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
24
</td>
<td style="text-align:left;">
Aménagement de l’espace, urbanisme
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
25
</td>
<td style="text-align:left;">
Mathématiques
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
Mathématiques appliquées et applications des mathématiques
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
27
</td>
<td style="text-align:left;">
Informatique
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
28
</td>
<td style="text-align:left;">
Milieux denses et matériaux
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
29
</td>
<td style="text-align:left;">
Constituants élémentaires
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
Histoire du droit et des institutions
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
30
</td>
<td style="text-align:left;">
Milieux dilués et optique
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
31
</td>
<td style="text-align:left;">
Chimie théorique, physique, analytique
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
32
</td>
<td style="text-align:left;">
Chimie organique, inorganique, industrielle
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
33
</td>
<td style="text-align:left;">
Chimie des matériaux
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
34
</td>
<td style="text-align:left;">
Astronomie, astrophysique
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
35
</td>
<td style="text-align:left;">
Structure et évolution de la Terre et des autres planètes
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
36
</td>
<td style="text-align:left;">
Terre solide : géodynamique des enveloppes supérieures, paléobiosphère
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
37
</td>
<td style="text-align:left;">
Météorologie, océanographie physique et physique de l’environnement
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
Science politique
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
5
</td>
<td style="text-align:left;">
Sciences économiques
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
6
</td>
<td style="text-align:left;">
Sciences de gestion
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
60
</td>
<td style="text-align:left;">
Mécanique, génie mécanique, génie civil
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
61
</td>
<td style="text-align:left;">
Génie informatique, automatique et traitement du signal
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
62
</td>
<td style="text-align:left;">
Énergétique, génie des procédés
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
63
</td>
<td style="text-align:left;">
Génie Électrique, Électronique, optronique et systèmes
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
64
</td>
<td style="text-align:left;">
Biochimie et biologie moléculaire
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
65
</td>
<td style="text-align:left;">
Biologie cellulaire
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
66
</td>
<td style="text-align:left;">
Physiologie
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
67
</td>
<td style="text-align:left;">
Biologie des populations et écologie
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
68
</td>
<td style="text-align:left;">
Biologie des organismes
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
69
</td>
<td style="text-align:left;">
Neurosciences
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
7
</td>
<td style="text-align:left;">
Sciences du langage : linguistique et phonétique générales
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
70
</td>
<td style="text-align:left;">
Sciences de l’éducation
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
71
</td>
<td style="text-align:left;">
Sciences de l’information et de la communication
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
72
</td>
<td style="text-align:left;">
Épistémologie, histoire des sciences et des techniques
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
74
</td>
<td style="text-align:left;">
Sciences et techniques des activités physiques et sportives
</td>
<td style="text-align:right;">
23
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
8
</td>
<td style="text-align:left;">
Langues et littératures anciennes
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
85
</td>
<td style="text-align:left;">
Sciences physico-chimiques et ingénierie appliquée à la santé
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
86
</td>
<td style="text-align:left;">
Sciences du médicament et des autres produits de santé
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
87
</td>
<td style="text-align:left;">
Sciences biologiques, fondamentales et cliniques
</td>
<td style="text-align:right;">
23
</td>
</tr>
<tr>
<td style="text-align:left;">
Section
</td>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
Langue et littérature françaises
</td>
<td style="text-align:right;">
23
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
