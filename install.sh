#!/bin/bash
echo ""
echo "##############################################################################################"
echo "Criando script de execução MARS"
echo "##############################################################################################"
echo ""
sleep 2

pathAssembly=$(pwd)				# Caminho do Diretorio de Instalação

echo "creating ~/bin directory ..."
mkdir ~/bin					# Criando pasta bin para scripts
echo ""

cp $pathAssembly/.mars/mars.sh ~/bin/mars.sh	# Copiando Script para a pasta ~/bin
chmod u+x ~/bin/mars.sh				# Habilitando modo executável

echo "Para abrir o programa, execute no terminal: mars.sh"
echo ""
sleep 2

not_answer=true

while $not_answer
do
  echo ""
  read -n1 -p "Deseja abrir o MARS agora? [ y , n ]" doit
  case $doit in
    y|Y)
	open_mars=true
	not_answer=false
      ;;

    n|N)
	open_mars=false
	not_answer=false
	;;

    *)
	echo ""
	echo "APENAS Y para SIM e N para NAO ..."
	echo ""
        ;;
  esac
done

if $open_mars
then
  echo ""
  echo "Abrindo Mars em 3s ..."
  sleep 3

  mars.sh
fi
echo ""
