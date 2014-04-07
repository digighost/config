#!/usr/bin/env bash

FichierTmp=""
ListeRep="$(find * -type d -prune)"   # liste des repertoires sans leurs sous-repertoires
for Rep in ${ListeRep}; do
  cd ${Rep}
  git pull origin master
  cd ..
done
