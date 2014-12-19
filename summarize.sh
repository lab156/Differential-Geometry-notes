#!/bin/bash

#Strips a LaTeX file of details leaving only the environments specified.
function strip_from {  
local InFile=$1 

sed -n '/\\begin{ddef}*/,/\\end{ddef}/ s/.*/&/p' < $InFile  
}

#Make an array with the lectures directories (Arrays are dangerous. Beware!!)
arr=(`find . -regex "\./[1-9]+" | cut -d / -f2 | sort -n`)


echo '\documentclass{beamer}' > $1
echo '\usepackage{summary}' >> $1
echo '\begin{document}' >> $1

for lec in ${arr[*]}; do
    echo '\begin{frame}' >> $1
    strip_from $lec/class.tex >> $1
    echo '\end{frame}' >> $1
done

echo '\end{document}' >> $1
exit 0

    
