#!/usr/bin/bash

books_dir=$(cat books_dir)

while IFS="," read -r url title author; do
    mutool convert -o $books_dir/$title/$title.pdf $books_dir/$title/$title.epub
done <booklist.csv
