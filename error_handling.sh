#!/bin/bash


# Creating a new folder and validating the execution status of the command
mkdir sample_folder

if [ $? -ne 0 ]; then
	echo "Error: Failed to create directory in $(pwd) path. Please check you have all the necessary permission or directory already exists"
	exit 1
fi

# Creating file in the newly created folder

touch "$(pwd)/sample_folder/file1.txt"

if [ $? -ne 0 ]; then
        echo "Error: Failed to create file in $(pwd)/sample_folder path. Please check you have all the necessary permission or file already exists"
        exit 1
fi

# Creating a trap to delete a temporary file if they exists

tempfile=$(mktemp)   # $(mktemp) -> is built-in command to create a unique temp file

echo "temp file: ${tempfile}"

#trap command with the EXIT pseudo-signal will execute at the very end of a Linux shell script's execution, regardless of whether the script finishes successfully or encounters an error.
trap "rm -f ${tempfile}" EXIT  # This statement is used to set a trap to delete the temp file

echo "This is a temporary file." > $tempfile  # inserting statements into the temporary file.

cat $tempfile

#read a non-existent file and redirects the error message to a file called error.log

<< readme
cat non_existent_file.txt 2> error.log
2> error.log: This is a standard error redirection operator in shell scripting.
2: is the file descriptor for the standard error (stderr) stream.
>: indicates that the output should be redirected to a file, overwriting any content that might already exist in error.log.
readme

cat non_existent_file.txt 2> error.log 

