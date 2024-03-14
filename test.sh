#!/bin/bash

name_age() {
    read -rp "What is your name? " name
    read -rp "how old r u? " age

    greet="hi $name"

    echo "$greet"

    if [ $age -gt 18 ]; then
        echo "u r an adult"

    else
        echo "u r a kid"

    fi

    i=10
    # while [true]
    # until [false]
    while [ $i -ne 0 ] && [ $# -gt 1 ]; do
        echo "$i"
        ((i--))
        sleep 1s

    done

}

name_age 23
# printf "Name:\t%s\nID:\t%04d\n" "Omar" "1231"

# echo -e "\033[5;31;40mERROR: \033[0m\033[31;40mSomthing went wrong.\033[0m"
# date -u +%Y-%m-%dT%H:%M:%S%Z
# date -u +%d-%m-%Y
# a=omar
# c=abdo
# v="$a $c"
# echo ${#v}
# d=${v: -4:-2}
# echo $d

# echo $v
# w=${v/${v:5:2}/tata}
# echo $w
# read a

# if [ -z $a ]; then
#     echo it is null \(embty\)
# else
#     echo it not is null \(embty\)
# fi

# [[ "omar" == "omr" ]]
# echo $?
# a="omer"
# c="abdo"
# echo $a $c
# echo ${#a}
# echo ${#c}
# declare -i ik=2
# echo $ik
# ik=$((55+23))
# echo $ik

# [[ 6 -gt 3 ]]
# echo $?
# dirc=$(find $1 -type d | wc -l)
# filec=$(find $1 -type f | wc -l)
# echo "Dirs:"$dirc "  Files:"$filec "  "

# ec/ho $#

# l=$(ls -lh $1 | wc -l)

# echo "there are $(("$l"-1)) lines"

# echo hi $1 u r $2 y/o

# echo "hi" > resttest

# release=/etc/os-release
# logfile=/var/log/uptest.log
# errorlog=/var/log/uperrors.log
# # sudo chmod u+rw $errorlog $logfile
# check-exit() {
#     if $? -ne 0; then
#         echo "an error occurred check $errorlog file"
#     fi
# }

# if grep -q "fedora" $release; then

#     sudo dnf5 upgrade -y 1>>$logfile 2>>$errorlog
#     check-exit
# fi
# if grep -q "debian" $release; then

#     sudo apt upgrade -y 1>>$logfile 2>>$errorlog
#     check-exit

# fi
# cat $logfile
# echo " " >> $logfile
# echo " " >> $errorlog
# cat $release
# echo enter name
# read -r name
# echo "hi $name"

# m=0
# for i in {0..22}; do
# sleep .2
#     echo "$i"
#     ((m++))
# done
# echo
# echo $m

# r=/etc/os-release
# cat /etc/os-release
# if grep -q "debian" $r; then
#     echo it is deb
# fi
# comm

# while [ -f "$(pwd)"/t ]; do
#     echo "exist"
#     sleep 3s

# done
# echo the file t gone missing
#  m=0
# while [ $m -lt 10 ]
#  do
#     echo $m
#     m=$(( m-1 ))
#     sleep .5s

# done

# dasd
# d=$?
# echo jo

# echo $d

# age=23
# if [ $age -eq 20 ]; then
# 	echo "u r old enough"
# else
# 	echo "u r old"
# fi

# if [  -d /etc ]
# then
# 	echo "it exists"
# else
# echo "the file dose not exsist"
# fi

# expr 10 + 23
# int1=23
# int2=230
# result=($(( $int1 \* $int2 + 10 )))
# result=$(($int2 / $int1))
# echo "$result"

# omer=12
# echo "hello world $omer times"
# # echo $SHELL
# echo $omer
# name="omer"
# age=20
# echo "hi ma name is $name and im $age y/o"
# echo "the date is $(date)"

# echo
# env
