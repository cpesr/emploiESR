#!/bin/sh
#Télécharge la liste des postes EC sur galaxy
#Corrige à l'arrache le html
#Converti en csv et nettoie les noms de fichers

RENTREE="2024"
WD=$PWD

cd /tmp
rm Emplois_publies_TrieParCorps.html
wget https://www.galaxie.enseignementsup-recherche.gouv.fr/ensup/ListesPostesPublies/Emplois_publies_TrieParCorps.html
cat Emplois_publies_TrieParCorps.html | sed 's/<th /<td /' > Emplois_publies_TrieParCorps.$RENTREE.html
#cp Emplois_publies_TrieParCorps.html Emplois_publies_TrieParCorps.$RENTREE.html
$WD/html2csv.py Emplois_publies_TrieParCorps.$RENTREE.html

cp Emplois_publies_TrieParCorps.$RENTREE.html $WD
cp Emplois_publies_TrieParCorps.$RENTREE.html $WD/Emplois_publies_TrieParCorps.${RENTREE}_`date +%Y-%m-%d`.html
cp Emplois_publies_TrieParCorps.$RENTREE.html1.csv $WD/galaxie.$RENTREE.csv

cd $WD
wc -l galaxie.*.csv


# Rscript galaxie.R
