#!/bin/bash
echo "##############################################################################################"
echo "Criando scrip de execução MARS"
echo "##############################################################################################"
echo ""

pathAssembly=$(pwd)				# Caminho do Diretorio de Instalação

mkdir ~/bin					# Criando pasta bin para scripts
cp $pathAssembly/.mars/mars.sh ~/bin/mars.sh	# Copiando Script para a pasta ~/bin
chmod u+x ~/bin/mars.sh				# Habilitando modo executável

echo "Para abrir execute no terminal: mars.sh"

mars.sh
