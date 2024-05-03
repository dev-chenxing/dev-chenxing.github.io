#!/usr/bin/bash

# sh cover_generator.sh -t 女仙外史 -a 吕熊

while getopts t:a: flag; do
	case "${flag}" in
	t) title=${OPTARG} ;;
	a) author=${OPTARG} ;;
	esac
done

shopt -s extglob

verticalize() {
	local tmp=${1}
	echo ${tmp//@()/\\n}
}

title_formatted=$(verticalize $title)
author_formatted=$(verticalize $author)\\n\\n著

magick cover_template.png \
	-font 'simsun.ttf' -fill '#312819' -pointsize 130 -gravity North -annotate -480+360 $title_formatted \
	-font 'stfangso.ttf' -fill '#312819' -pointsize 65 -gravity North -annotate -480+1420 $author_formatted \
	cover.png
