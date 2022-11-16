#!/bin/bash

origen=`git remote -v|head -1`
estado=`echo $origen|grep https://|wc -l`

convertirAGit(){
	echo "Convirtiendo a git"
	comando=`echo $1|sed "s/https:\/\//git@/"|sed "s/\//:/"|sed "s/(fetch)//" `
	git remote set-url $comando
}

convertirAHTTPS(){
	echo "Convirtiendo a HTTPS"
	comando=`echo $1|sed "s/:/\//"|sed "s/git@/https:\/\//"|sed "s/(fetch)//" `
	git remote set-url $comando
}

if [ "$estado" != "0" ]
then
	convertirAGit "$origen"
else
	convertirAHTTPS "$origen"
fi


echo "Finalmente"
git remote -v
