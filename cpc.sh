#!/bin/bash
# author: satpal
# script name: evenfruit
#This script copies or zips the file into the given directory.
target=$3
sourceFile=$2
option=$1

#fucntion to print error message
function error(){
	echo "Error: $1"
	echo "Usage: cpc [-cz ] [source-file ] [target-directory ]"
}
#function to exit the program
function quit {
	echo "The program will exit due to an error!"
	exit
}  
#check if the arguments are 3 
if [ $# -eq 3 ]; then
	#check if the source file exists
	if [ -e $sourceFile ]; then 
		#check if the target directory exists
		if [ -d $target ]; then 
			#check what option has been entered by user and carry out the task according to the option
			if [ $option = "-c"  ]; then 
				echo "The $sourceFile has been copied to the $target."
				cp $sourceFile $target
			#if -z option entered zip the file
			elif [ $option = "-z" ]; then
				#if the file is zip then unzip it else zip it
				if  [[ $sourceFile == *.txt ]]; then 
					echo "The $2 has been zipped to the $target."
					gzip $sourceFile 
					mv $sourceFile".gz" $target
				elif [[ $sourceFile == *.gz ]]; then 
					echo "The $2 has been unzipped to the $target."
					gzip -d $sourceFile
					mv ${sourceFile%.*} $target
				fi
			else
				error "Correct option not found!"
				quit
			fi
		#if the target directory is file
		elif [ -e $target ]; then 
		error "$target is a file."
		quit
		#if the target directory does not exist ask the user and make one
		else 
			error "Target file not found!"
			echo "Do you want create the target file? Enter y as yes and n as no."
			read answer
				#if user answers yes create directory
				if [ $answer == "y" ]; then
					#make a target file here
					echo "The $target directory has been created for you."
					mkdir $3
					#check the option given by user
					if [ $option == "-c"  ]; then 
						echo "The $sourceFile has been copied to the $target."
						cp $sourceFile $target
					elif [ $option == "-z" ]; then
						#if the file is zip then unzip it else zip it
						if [[ $sourceFile == *.gz ]]; then  
							echo "The $2 has been unzipped to the $target."
							gzip -d $sourceFile
							mv ${sourceFile%.*} $target
						elif [[ $sourceFile == *.txt ]]; then 
							echo "The $2 has been zipped to the $target."
							gzip $sourceFile 
							mv $sourceFile".gz" $target
						fi
					else
						error "Correct option not found!"
						quit
					fi
				#no entered by user then exit the program
				else
					echo "No Directory created! The program will exit."
					exit
				fi

		fi
	#print error message if no source file
	else 
		error "Source file not found!"
		quit
	fi
#print error message if number of arguments are less or more than 3
else 
	error "Enter right amount of aguments!"
	quit
fi


