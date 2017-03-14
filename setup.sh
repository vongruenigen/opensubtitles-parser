#!/bin/bash

echo 'Downloading dataset...'

OUT_NAME='opensubtitles.tar.gz'

if [ ! -f $OUT_NAME ]; then
  # download dataset if necessary
  wget http://opus.lingfil.uu.se/download.php?f=OpenSubtitles/en.tar.gz -O $OUT_NAME
fi

echo 'Unzipping dataset...'

tar -zxvf $OUT_NAME

echo 'Extracting dataset...'

# extract all files in sub-directories
find . -name '*.gz' -exec gunzip '{}' \;

echo 'Running python preprocessor...'

# run python pre-processor
python opensubtitleparser.py

