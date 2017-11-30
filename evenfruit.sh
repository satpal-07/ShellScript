#!/bin/bash
# This script 
# author: satpal
# script name: evenfruit
# print all the even number, if the number is divisible 7, 11, and 13 prints orange, banana and pear respectively 
#checks if the first argument is zero
if [ $# -lt 1 ]; then 
	echo -n "Please enter starting integer: "
	read start
	echo -n "Please enter ending integer: " 
	read end
#checks if only one argument is entered
elif [ $# -eq 1 ]; then 
	start=$1
	echo -n "Please enter ending integer: "
	read end
#checks if the arguments are more than 2
elif [ $# -gt 2 ]; then
	echo "More than two inputs detected, first two will be chosen."
	start=$1
	end=$2
#else the arguments are two only
else
	start=$1
	end=$2
fi
#if the first argument is less than the second print an error and exit the program
if [ $start -gt $end ]; then 
	echo "First value must be less than second!"
	exit
fi

#while loop to print out the values
number=$start
while [ $number -lt $((end-2)) ]; do
	#if the provided value is even then adds two each time and print out the value
	if [ $((number %2)) -eq 0 ]; then

		# if the number is divisable by 7 then print orange
		if [ $((number %7)) -eq 0 ]; then 
			echo -en " Orange"
		fi

		# if the number is divisable by 11 then print banana
		if [ $((number %11)) -eq 0 ]; then 
			echo -en " Banana"
		fi

		# if the number is divisable by 13 then print pear
		if [ $((number %13)) -eq 0 ]; then 
			echo -en " Pear"
		fi
		#increment the number by two to make it even
		number=$((number+2))
		echo ""
		echo -en $number 

	#else if the number is odd plus one to make it even
	elif [ $((number %2)) -eq 1 ]; then
		number=$((number+1))
		echo -en $number
	fi 
done
echo ""
echo "What is with the fruit obsession?"
