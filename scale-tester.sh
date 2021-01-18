#!/bin/zsh
# This script is equivalent to the logic found in 
# the India MEL Slot 2 function change_scale. It is extracted
# here for easier testing because the cycolmatic complexity of 
# just reading it is quite high!!
#
# Usage:
# ./scale-tester.sh <7 space separated values, either 0,1,2>
# 
# for example for Asavari
# ./scale-tester.sh 0 1 1 0 0 0 1

declare -A notes_data
declare -A scale_data

notes_data[0]=$1
notes_data[1]=$2
notes_data[2]=$3
notes_data[3]=$4
notes_data[4]=$5
notes_data[5]=$6
notes_data[6]=$7

#RHS:
#copy into %scale_data, 0: in scale, 1: not in scale

#I
scale_data[0]=0

#0 means in scale

#II
if ((notes_data[1] == 0)); then #Db
	scale_data[1]=0
	scale_data[2]=1
fi

if ((notes_data[1] == 1)); then #D
	scale_data[1]=1
	scale_data[2]=0
fi

if ((notes_data[1] == 2)); then #D
	scale_data[1]=1
	scale_data[2]=1
	scale_data[3]=0
	scale_data[4]=0
fi


#III

if ((notes_data[2] == 0)); then #D
	scale_data[2]=0
	scale_data[3]=1
	scale_data[4]=1
fi

if ((notes_data[2] == 1)); then #Eb
	scale_data[3]=0
	scale_data[4]=1
fi

if ((notes_data[2] == 2 && notes_data[1] != 2)); then #E
	scale_data[3]=1
	scale_data[4]=0
fi

#IV
if ((notes_data[3] == 0)); then #i.e. F
	scale_data[5]=0
	scale_data[6]=1
else
	scale_data[5]=1
	scale_data[6]=0
fi

#V
scale_data[7]=0

#VI
if ((notes_data[5] == 0)); then #Ab
	scale_data[8]=0
	scale_data[9]=1
fi

if ((notes_data[5] == 1)); then #A
	scale_data[8]=1
	scale_data[9]=0
fi

if ((notes_data[5] == 2)); then #A
	scale_data[8]=1
	scale_data[9]=1
	scale_data[10]=0
	scale_data[11]=0
fi

#VII
if ((notes_data[6] == 0)); then #0
	scale_data[9]=0
	scale_data[10]=1
	scale_data[11]=1
fi

if ((notes_data[6] == 1)); then #Bb
	scale_data[10]=0
	scale_data[11]=1
fi

if ((notes_data[6] == 2 && notes_data[5] != 2)); then #B
	scale_data[10]=1
	scale_data[11]=0
fi

s=
for key value in ${(kv)scale_data}; do
    # echo "$key -> $value"
    STRLENGTH=$(echo -n $key | wc -m)
    if ((STRLENGTH == 1)); then
    	s="${s}0$key->$value\n"
    else
    	s="${s}$key->$value\n"
    fi
done

## Various Printing Options, uncomment as needed

# analyze all (0 thru 11)
echo $s | sort

# analyze 2 thru 4
# echo $s | sort | head -6 | tail -3

# analyze 5 and 6
# echo $s | sort | head -8 | tail -2

# analyze 8 thru 11
# echo $s | sort | tail -4
