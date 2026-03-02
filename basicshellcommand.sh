#!/bin/bash

<< comment1
This is a multi-line comment.
Creating a shell script file to practice basic linux commands.
comment1

# Fetching two numbers as user input.

echo "Enter number 1: "
read num1

echo "Enter number 2: "
read num2

# Printing the numbers fetched by user.
echo "Values of numbers number 1: ${num1} and number 2: ${num2}"

# Performing sum of the sum of the two numbers.
sum=$((num1 + num2))

echo "The sum of the two given numbers are: ${sum}"

#Printing some built-in variables.
echo "USER: ${USER}"
echo "DATE: $(date +%Y-%m-%d-%H:%M:%S)"
echo "Current PATH: $(pwd)"

#Listing the file with ".txt" extension
echo "Listing file with .txt extension"
ls -l *.txt

echo "Task Completed"
