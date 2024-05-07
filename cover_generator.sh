#!/usr/bin/bash

# sh cover_generator.sh -t 女仙外史 -a 吕熊

usage() {
	echo "Usage: $0 \
  	[-t title] \
  	[-a author]" 1>&2
	exit 1
}

while getopts ":t:a:" option; do
	case "${option}" in
	t) title=${OPTARG} ;;
	a) author=${OPTARG} ;;
	esac
done

if [[ ! "$title" ]]; then
	usage
fi

shopt -s extglob

verticalize() {
	local tmp=${1}
	echo ${tmp//@()/\\n}
}

title_formatted=$(verticalize $title)
author_formatted=$(verticalize $author)\\n著

books_dir=$(cat books_dir)
extension=png
dir="$books_dir/$extension"
mkdir -p $dir

file=$dir/$title.$extension

echo "magick $file"
magick cover_template.png \
	-resize 430 \
	-font 'fonts/simsun.ttf' -fill '#312819' -pointsize 36 -gravity North -annotate +128+70 $title_formatted \
	-font 'fonts/stfangso.ttf' -fill '#312819' -pointsize 18 -gravity North -annotate +128+340 $author_formatted \
	$file
