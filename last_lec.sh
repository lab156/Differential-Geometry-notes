#! /bin/bash
#THIS FUNCTION RETURNS THE NAME OF THE FILE WITH THE LARGEST NUMERIC VALUE
function last_lecture {
regu="^[0-9]+$"
for fil in `ls`; do 
    if [[ $fil =~ $regu ]]; then 
        echo $fil;
    fi; 
done | sort -n | tail -1
}

last_lecture
