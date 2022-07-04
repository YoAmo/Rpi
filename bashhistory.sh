#!/bin/bash
# ~/bin/bash-history.sh
# release v1.0

## USO ##
# Crea un registro infinito de los comandos ejecutados en el equipo

# PARÁMETROS
# $1 -> 
# $2 -> 
# EJEMPLO: 

# Modifico el número de registros a guardar en cada archivo:
sed -i 's/HISTSIZE=*/HISTSIZE=10000/g' "$HOME/.bashrc"
sed -i 's/HISTFILESIZE=*/HISTFILESIZE=20000/g' "$HOME/.bashrc"

# Creo el directorio donde guardar los archivos:
mkdir -p ~/.history
