#!/bin/bash
# ~/bin/pelislista.sh
# V0.1
# CRE: 17-12-2021

# USO
# Crea un listado de películas filtradas según un patrón.
# El patrón debe coincidir con algún archivo dentro de los directorios que contienen películas.
# De la ruta de ese archivo se extrae el directorio que contiene toda la info de la peli.

## PARÁMETROS
# $1 - String - Origen o directorio donde buscar las pelis
# $2 - String - Filtro de búsqueda

## EJEMPLO
# pelislista.sh Selección '*\[h265\]*spa_*\[dual\].nfo'
# pelislista.sh Selección '*\[dual\]-mediainfo.xml'
# pelislista.sh Selección '*\]-poster.???'
# pelislista.sh Selección 'poster.???'

# TODO
# Puedo pasar una primera vez buscando repeticiones con 'uniq -d'
# Luego hago una consulta sobre si quiero continuar...

# EXIT
# 2 -> Salida programada


declare -r  lista='.pelis-lista-filtro.log'

[[ -f $lista ]] && rm $lista
i=0


echo 'Buscando archivos repetidos en el mismo directorio...'
while read file 
  do
    ((i++))
    echo "$i-. $file"
  done < <(find $1 -iname "$2" | cut -d'/' --complement -f3 | sort | uniq -d)

if [[ $i -gt 0 ]]; then
    echo -e "\nSe han encontrado más de una coincidencia en $i directorios."
    read -p "¿Continuar de todas formas? Sí/no: " read_continuar
          continuar=${read_continuar,,}
          [[ "$continuar" == "no" ]] && exit 2
fi

i=0
while read dir 
  do
        ((i++))
        echo "$i-. $dir"
        echo $dir >> $lista
  done < <(find $1 -iname "$2" | cut -d'/' --complement -f3 | sort | uniq)