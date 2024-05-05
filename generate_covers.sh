#!/usr/bin/bash

while IFS="," read -r url title author; do
    sh cover_generator.sh -t $title -a $author
done <booklist.csv
