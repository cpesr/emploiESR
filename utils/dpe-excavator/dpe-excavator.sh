#!/bin/bash

urls=(
['2001']="https://www.enseignementsup-recherche.gouv.fr/sites/default/files/content_migration/document/bilrec011_36275.pdf"
['2002']="https://www.enseignementsup-recherche.gouv.fr/sites/default/files/content_migration/document/bilrec02_36273.pdf"
['2003']="https://www.enseignementsup-recherche.gouv.fr/sites/default/files/content_migration/document/bilrec03_36271.pdf"
['2004']="https://www.enseignementsup-recherche.gouv.fr/sites/default/files/content_migration/document/bilrec04_36269.pdf"
['2005']="https://www.enseignementsup-recherche.gouv.fr/sites/default/files/content_migration/document/bilrec052_36267.pdf"
['2006']="https://www.enseignementsup-recherche.gouv.fr/sites/default/files/content_migration/document/bilrec061_36265.pdf"
['2007']="https://www.enseignementsup-recherche.gouv.fr/sites/default/files/content_migration/document/bilrec072_36263.pdf"
['2008']="https://www.enseignementsup-recherche.gouv.fr/sites/default/files/content_migration/document/bilan-de-la-campagne-de-recrutement-et-d-affectation-des-ma-tres-de-conf-rences-et-des-professeurs-des-universit-s---premi-re-session-2008-11513.pdf"
)

qualif_page=(['2001']="28" ['2002']="33" ['2003']="37" ['2004']="37" ['2005']="32" ['2006']="37" ['2007']="21" ['2008']="46")
qualif_pos=(['2001']="120,18,720,575" ['2002']="130,18,720,575" ['2003']="130,18,770,575" ['2004']="130,10,770,600" ['2005']="130,18,740,600" ['2006']="150,18,670,600" ['2007']="150,18,670,600" ['2008']="150,18,670,600")

postes_page=(['2001']="27" ['2002']="30" ['2003']="36" ['2004']="36" ['2005']="31" ['2006']="36" ['2007']="19" ['2008']="44")
postes_pos=(['2001']="120,18,740,575" ['2002']="135,18,730,575" ['2003']="135,18,770,575" ['2004']="115,10,780,600" ['2005']="140,18,750,600" ['2006']="140,18,670,600" ['2007']="140,18,670,600" ['2008']="150,18,670,600")


mkdir -p pdf/
mkdir -p csv/
for annee in `seq 2001 2008` ; do
  echo "Annee $annee"
  cd pdf
  #rm -rf *
  url=${urls[$annee]}
  echo "Download $url"
  #wget -A pdf -r -l 1 -nd --span-hosts --domains=cache.media.enseignementsup-recherche.gouv.fr  -e robots=off $url
  cd ..

  pdf=`basename $url`
  java -jar tabula-1.0.4-jar-with-dependencies.jar pdf/$pdf -t --page ${qualif_page[$annee]} --area ${qualif_pos[$annee]} 2> /dev/null \
  | grep -v '""' \
  > csv/dpe-excavation-$annee-qualif.csv

  java -jar tabula-1.0.4-jar-with-dependencies.jar pdf/$pdf -t --page ${postes_page[$annee]} --area ${postes_pos[$annee]} 2> /dev/null \
  | grep -v '""' \
  > csv/dpe-excavation-$annee-postes.csv

done
