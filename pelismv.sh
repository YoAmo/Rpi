#!/bin/bash
# ~/bin/pelismv.sh
# V0.1
# CRE: 17-12-2021

declare -r  lista='pelis_h265_spa_dual.log'
[[ -f $lista ]] && rm $lista
i=0

while read file 
  do
    ((i++))
    echo "$i-. $file"
    echo $file >> $lista
  #done < <(find $1 -iname '*\[h265\]*spa_*\[dual\].nfo' -type f)
  done < <(find ./Selección/ -iname '*\[h265\]*spa_*\[dual\].nfo' | cut -d'/' --complement -f4 | sort)


while read peli
  do
    #mv -iu ${peli} ./HEVC
    echo "x - $peli"
    mv -iu "$peli" -t ./HEVC
  done < <(cat $lista)

rm $lista