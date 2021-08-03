#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#Richard's html2csv converter
#rbarnes@umn.edu
#modified by gossa@unistra.fr
#

from bs4 import BeautifulSoup
import sys
import csv
import argparse

parser = argparse.ArgumentParser(description='Reads in an HTML and attempts to convert all tables into CSV files.')
parser.add_argument('--delimiter', '-d', action='store', default=',',help="Character with which to separate CSV columns")
parser.add_argument('--quotechar', '-q', action='store', default='"',help="Character within which to nest CSV text")
parser.add_argument('filename',nargs="?",help="HTML file from which to extract tables")
args = parser.parse_args()

if sys.stdin.isatty() and not args.filename:
  parser.print_help()
  sys.exit(-1)
elif not sys.stdin.isatty():
  args.filename = sys.stdin
else:
  args.filename = open(sys.argv[1],'r')

print("Opening file")
fin  = args.filename.read()

print("Parsing file")
soup = BeautifulSoup(fin,"html.parser")

print("Preemptively removing unnecessary tags")
[s.extract() for s in soup('script')]

print("CSVing file")
tablecount = -1
for table in soup.findAll("table"):
  tablecount += 1
  print("Processing Table #%d" % (tablecount))
  with open(sys.argv[1]+str(tablecount)+'.csv', 'w', newline='') as csvfile:
    fout = csv.writer(csvfile, delimiter=args.delimiter, quotechar=args.quotechar, quoting=csv.QUOTE_MINIMAL)
    for row in table.findAll('tr'):
      cols = row.findAll(['td','th'])
      if cols:
        cols = [str(x.text).strip().replace('\n','') for x in cols]
        fout.writerow(cols)
