#!/bin/bash
echo ""
echo "##############################################################################################"
echo "Criando scrip de execução MARS"
echo "##############################################################################################"
echo ""
sleep 2

pathAssembly=$(pwd)				# Caminho do Diretorio de Instalação

mkdir ~/bin					# Criando pasta bin para scripts
cp $pathAssembly/.mars/mars.sh ~/bin/mars.sh	# Copiando Script para a pasta ~/bin
chmod u+x ~/bin/mars.sh				# Habilitando modo executável

echo "Para abrir o programa, execute no terminal: mars.sh"

sleep 2

echo "Abrindo Mars em 3s ..."

sleep 3

mars.sh

