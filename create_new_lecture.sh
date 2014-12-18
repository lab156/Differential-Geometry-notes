#!/bin/bash

#   Usage:
#     $ create_new_clase.sh [number of the class you want to create]
#   Example:
#   To create the file of class 4 quickly:
#    $ ./create_new_clase.sh 4

#THIS FUNCTION RETURNS THE NAME OF THE FILE WITH THE LARGEST NUMERIC VALUE
function last_lecture {
regu="^[0-9]+$"
for fil in `ls`; do 
    if [[ $fil =~ $regu ]]; then 
        echo $fil;
    fi; 
done | sort -n | tail -1
}

#FUNCTION THAT CREATES A DIRECTORY AND ITS LINKS 
function new_dir {
    mkdir $1 &&\
        cp ./templates/this_class.tex $1 &&\
        touch $1/class.tex &&\
        #It appears that ln only works when they are created from 
        #the inside of the directory
        cd $1 &&\
        ln -s ../general.sty .
    }

if [ "$1" == "" ] ; then
    new_name=$(( 1 + `last_lecture` ))
    echo Creating new dir $new_name
   new_dir $new_name 
    exit 0
elif [ -a $1 ] ; then
    echo "The file already exists!!!"
    exit 1
else
    new_dir $1
    exit 0
fi
