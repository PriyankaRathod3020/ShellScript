#!/bin/bash

<< readme
Creating a script to create a backup with rotation.
Delete backup files if there are more than 3 files.
readme

#Getting the source and destination directories through arguments

source_dir=$1
backup_dir=$2

# Function to create a backup file
function create_backup {
	filename="backup_$(date +%Y-%m-%d-%HH:%MM:%SS).tar.gz"

	tar -czf ${backup_dir}/${filename} $source_dir

	if [ $? -eq 0 ]; then
		echo "File created successfully"
	fi	
}

# Function to check the file older than the latest 3 files and delete them
function perform_rotation {
   
	backup=($(ls -t "${backup_dir}/backup_"*.tar.gz 2> /dev/null))
        
         #${#backup[@]} -> returns the number of elements in the array. '#' is used to return number of elements. '@' signifies all elements

	if [ "${#backup[@]}" -gt 3 ]; then   

		# performing slicing on array. ':3' start from index 3 i.e 4th element of array as indexing starts from zero.
		echo "${backup[@]:3}"

		backup_to_remove=("${backup[@]:3}")

		for bkp in "${backup_to_remove[0]}"
		do
			rm -f "${bkp}"
		done
	fi	
}

create_backup
perform_rotation
