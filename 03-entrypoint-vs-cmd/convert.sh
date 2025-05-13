#!/bin/sh
INPUT=$1
OUTPUT_FORMAT=$2
ffmpeg -i "$INPUT" "output.$OUTPUT_FORMAT"

