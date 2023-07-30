#!/bin/bash

for number in {1..100}; do
    if [[ $(expr $number % 3) -eq 0 ]] && [[ $(expr $number % 5) -eq 0 ]]; then
        echo "FizzBuzz"
    elif [[ $(expr $number % 3) -eq 0 ]]; then
        echo "Fizz"
    elif [[ $(expr $number % 5) -eq 0 ]]; then
        echo "Buzz"
    else
        echo $number
    fi
done

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
