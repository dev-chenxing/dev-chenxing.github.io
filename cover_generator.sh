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
	-resize 430 \
	-font 'simsun.ttf' -fill '#312819' -pointsize 36 -gravity North -annotate +128+70 $title_formatted \
	-font 'stfangso.ttf' -fill '#312819' -pointsize 18 -gravity North -annotate +128+340 $author_formatted \
	cover.png
