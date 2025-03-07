import requests
import csv
import json
import sys
import argparse
from datetime import datetime


parser = argparse.ArgumentParser(description="Charge les données de https://sciences.re/postes et les convertit en CSV")
parser.add_argument('outfile', type=str, nargs='?', help='Fichier CSV de sortie')
parser.add_argument('--update', action='store_true', help='Met à jour le fichier CSV de sortie avec les nouvelles données')
args = parser.parse_args()

# URL of the JSON data
url = "https://sciences.re/postes/media/postes.json"

# Define the CSV schema
csv_columns = [
    "etablissementLibelle",
    "id",
    "articleReference",
    "corps",
    "chaire",
    "section",
    "section2",
    "section3",
    "datePublicationPoste",
    "datePriseDePoste",
    "dateOuvertureCandidatures",
    "dateFermetureCandidatures",
    "descriptionPoste",
    "typeCandidatureConcours",
    "typeCandidatureMutation",
    "typeCandidatureDétachement",
    "typeCandidatureRecrutementEtranger",
    "typeCandidatureIntégrationDirecte",
    "typeCandidatureRecrutementSurContrat",
    "région",
    "etatPoste",
    "statutPoste",
    "typeCampagne",
    "dateScraping"
]

# Determine and read the output file to update
existing_rows = []
if args.update:
    if not args.outfile:
        print("L'option --update nécessite un fichier de sortie préexistant")
        sys.exit(1)
    print(f"Reading existing data from {args.outfile}")
    try:
        with open(args.outfile, mode='r', encoding='utf-8') as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                existing_rows.append(row)
    except FileNotFoundError:
        print(f"File {args.outfile} does not exist. It will be created.")
        pass
elif args.outfile:
    try:
        with open(args.outfile, 'r', encoding='utf-8') as f:
            print(f"Error: The file {args.outfile} already exists. Please use --update or a different output file")
            sys.exit(1)
    except FileNotFoundError:
        pass
else:
    current_date = datetime.now().strftime("%Y%m%d")
    args.outfile = f"odyssee_{current_date}.csv"
print(f"Writing data to {args.outfile}")


# Fetch the JSON data
print(f"Fetching data from {url}")
response = requests.get(url)
data = response.json()

def date_formater(date):
    return date[0:10].replace("/", "-")

# Iterate over each item in the JSON data
print(f"Processing {len(data)} items")
dateScraping = datetime.now().strftime('%Y-%m-%dT%H:%M:%SZ')
rows = []
for item in data:
    # Extract the required fields
    sections = item.get("sections", [{}])
    typeCandidatures = [ tc.get("libelle") for tc in item.get("typeCandidatures", [{}]) ]
    row = {
        "etablissementLibelle": item.get("etablissementLibelle", ""),
        "id": str(item.get("id", "")),
        "articleReference": item.get("articleReference", {}).get("libelleCourt", ""),
        "corps": item.get("corps", {}).get("libelleCourt", "NA"),
        "section": sections[0].get("code", "") if len(sections) > 0 else "NA",
        "section2": sections[1].get("code", "") if len(sections) > 1 else "NA",
        "section3": sections[2].get("code", "") if len(sections) > 2 else "NA",
        "datePublicationPoste": date_formater(item.get("datePublicationPoste", "NA")) if item.get("datePublicationPoste", "NA") is not None else "NA",
        "datePriseDePoste": date_formater(item.get("datePriseDePoste", "NA")) if item.get("datePriseDePoste", "NA") is not None else "NA",
        "dateOuvertureCandidatures": date_formater(item.get("dateOuvertureCandidatures", "NA")),
        "dateFermetureCandidatures": date_formater(item.get("dateFermetureCandidatures", "NA")),
        "descriptionPoste": item.get("descriptionPosteFrancais", "NA").replace("\n", " ") if item.get("descriptionPosteFrancais", "NA") is not None else "NA",
        "typeCandidatureConcours": "Concours" in typeCandidatures,
        "typeCandidatureMutation": "Mutation" in typeCandidatures,
        "typeCandidatureDétachement": "Détachement" in typeCandidatures,
        "typeCandidatureRecrutementEtranger": "Recrutement étranger" in typeCandidatures,
        "typeCandidatureIntégrationDirecte": "Intégration directe" in typeCandidatures,
        "typeCandidatureRecrutementSurContrat": "Recrutement sur contrat" in typeCandidatures,
        "région": item.get("region", {}).get("libelle", "NA"),
        "etatPoste": item.get("etatPosteLibelle", "NA"),
        "statutPoste": item.get("statutPoste", {}).get("libelle", "NA"),
        "typeCampagne": item.get("typeCampagne", "NA"),
        "dateScraping": dateScraping
    }
    rows.append(row)


# Open the output file for writing
with open(args.outfile, mode='w', encoding='utf-8', newline='') as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
    writer.writeheader()

    ids = set([row["id"] for row in rows])
    for row in existing_rows:
        if row["id"] not in ids:
            writer.writerow(row)
    for row in rows:
        writer.writerow(row)
