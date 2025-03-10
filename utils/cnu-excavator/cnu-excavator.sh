#! /bin/bash

# Ce script nécessite tabulapdf
# https://github.com/tabulapdf/tabula-java

urls=(
['2023']="
https://www.enseignementsup-recherche.gouv.fr/fr/fiches-demographiques-des-sections-de-droit-annee-2023-97618
https://www.enseignementsup-recherche.gouv.fr/fr/fiches-demographiques-des-sections-de-lettres-annee-2023-97620
https://www.enseignementsup-recherche.gouv.fr/fr/fiches-demographiques-des-sections-de-sciences-annee-2023-97621
https://www.enseignementsup-recherche.gouv.fr/fr/fiches-demographiques-des-sections-de-pharmacie-annee-2023-97622
"
['2022']="
https://www.enseignementsup-recherche.gouv.fr/fr/fiches-demographiques-des-sections-de-droit-annee-2022-92934
https://www.enseignementsup-recherche.gouv.fr/fr/fiches-demographiques-des-sections-de-lettres-annee-2022-92967
https://www.enseignementsup-recherche.gouv.fr/fr/fiches-demographiques-des-sections-de-sciences-annee-2022-92994
https://www.enseignementsup-recherche.gouv.fr/fr/fiches-demographiques-des-sections-de-pharmacie-annee-2022-92937
"
['2021']="
https://www.enseignementsup-recherche.gouv.fr/fr/fiches-demographiques-des-sections-de-droit-annee-2021-87620
https://www.enseignementsup-recherche.gouv.fr/fr/fiches-demographiques-des-sections-de-lettres-annee-2021-87623
https://www.enseignementsup-recherche.gouv.fr/fr/fiches-demographiques-des-sections-de-sciences-annee-2021-87629
https://www.enseignementsup-recherche.gouv.fr/fr/fiches-demographiques-des-sections-de-pharmacie-annee-2021-87635
"
['2020']="
https://www.enseignementsup-recherche.gouv.fr/cid159553/fiches-demographiques-des-sections-de-droit-2020.html
https://www.enseignementsup-recherche.gouv.fr/cid159556/fiches-demographiques-des-sections-de-lettres-2020.html
https://www.enseignementsup-recherche.gouv.fr/cid159558/fiches-demographiques-des-sections-de-sciences-2020.htm
https://www.enseignementsup-recherche.gouv.fr/cid159559/fiches-demographiques-des-sections-de-pharmacie-2020.html
"
['2019']="
https://www.enseignementsup-recherche.gouv.fr/cid153532/fiches-demographiques-des-sections-de-droit-2019.html
https://www.enseignementsup-recherche.gouv.fr/cid153534/fiches-demographiques-des-sections-de-lettres-2019.html
https://www.enseignementsup-recherche.gouv.fr/cid153536/fiches-demographiques-des-sections-de-sciences-2019.html
https://www.enseignementsup-recherche.gouv.fr/cid153535/fiches-demographiques-des-sections-de-pharmacie-2019.html
"
['2015']="
https://www.enseignementsup-recherche.gouv.fr/cid101540/fiches-demographiques-des-sections-droit-2015.html
https://www.enseignementsup-recherche.gouv.fr/cid101539/fiches-demographiques-des-sections-lettres-2015.html
https://www.enseignementsup-recherche.gouv.fr/cid101541/fiches-demographiques-des-sections-sciences-2015.html
https://www.enseignementsup-recherche.gouv.fr/cid101542/fiches-demographiques-des-sections-pharmacie-2015.html
"
['2013']="
https://www.enseignementsup-recherche.gouv.fr/cid85092/fiches-demographiques-des-sections-de-droit-2013.html
https://www.enseignementsup-recherche.gouv.fr/cid85097/fiches-demographiques-des-sections-de-lettres-2013.html
https://www.enseignementsup-recherche.gouv.fr/cid85103/fiches-demographiques-des-sections-de-sciences-2013.html
https://www.enseignementsup-recherche.gouv.fr/cid85105/fiches-demographiques-des-sections-de-pharmacie-2013.html
"
)

# top,left,bottom,right i.e. y1,x1,y2,x2
secnum=(['2023']=17 ['2022']=17 ['2021']=17 ['2020']=9 ['2019']=9 ['2015']=17 ['2013']=17)
posqualif=(['2023']="324,30,510,564" ['2022']="324,30,510,564" ['2021']="324,30,510,564" ['2020']="324,30,506,564" ['2019']="313,37,493,557" ['2015']="313,37,493,5557" ['2013']="325,31,531,562")
posrecrut=(['2023']="586,30,768,564" ['2022']="586,30,768,564" ['2021']="586,30,768,564" ['2020']="586,30,768,564" ['2019']="313,37,493,557" ['2015']="568,37,747,5557" ['2013']="595,31,797,562")
poscols=(
  ['2023']="67,90,113,154,178,200,224,249,289,345,370,393,432,454,477,499,525"
  ['2022']="67,90,113,154,178,200,224,249,289,345,370,393,432,454,477,499,525"
  ['2021']="67,90,113,154,178,200,224,249,289,345,370,393,432,454,477,499,525"
  ['2020']="67,90,113,154,178,200,224,249,289,345,370,393,432,454,477,499,525"
  ['2019']="75,96,119,159,183,203,227,249,289,343,367,391,429,450,470,493,518"
  ['2015']="75,96,119,159,183,203,227,249,289,343,367,391,429,450,470,493,518"
  ['2013']="68,92,114,156,177,198,223,247,288,341,365,389,428,452,473,496,522")

for annee in 2013 2015 2019 2020 2023; do
  mkdir -p pdf/$annee
  cd pdf/$annee
  if [ -z "$1" ] && [ $1 == "--download" ]; then
    rm -rf *
    for url in ${urls[$annee]} ; do
      echo "Download $url"
      wget -A pdf -nc -r -l 1 -nd -e robots=off $url
    done
  fi
  cd ../..

  rm cnu-excavation-qualification-$annee.csv
  for pdf in pdf/$annee/* ; do
    cnu=${pdf:${secnum[$annee]}:2}
    echo "Qualification $annee Section $cnu"
    java -jar tabula-1.0.5-jar-with-dependencies.jar $pdf --page 4 --area ${posqualif[$annee]} --columns ${poscols[$annee]} 2> /dev/null | \
    sed "s/^/$cnu,/" >> cnu-excavation-qualification-$annee.csv
  done

  rm cnu-excavation-recrutement-$annee.csv
  for pdf in pdf/$annee/* ; do
    cnu=${pdf:${secnum[$annee]}:2}
    echo "Recrutement $annee Section $cnu"
    java -jar tabula-1.0.5-jar-with-dependencies.jar $pdf --page 4 --area ${posrecrut[$annee]}  --columns ${poscols[$annee]} 2> /dev/null | \
    sed "s/^/$cnu,/" >> cnu-excavation-recrutement-$annee.csv
  done

done
