#!/bin/bash
#
# Copyright (C) 2014 Wenva <lvyexuwenfa100@126.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is furnished
# to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

set -e

SRC_FILE="$1"
DST_PATH="$2"

VERSION=1.0.0

info() {
     local green="\033[1;32m"
     local normal="\033[0m"
     echo -e "[${green}INFO${normal}] $1"
}

error() {
     local red="\033[1;31m"
     local normal="\033[0m"
     echo -e "[${red}ERROR${normal}] $1"
}

usage() {
cat << EOF
VERSION: $VERSION
USAGE:
    $0 srcfile dstpath

DESCRIPTION:
    This script aim to generate ios app icons easier and simply.

    srcfile - The source png image. Preferably above 1024x1024
    dstpath - The destination path where the icons generate to.

    This script is depend on ImageMagick. So you must install ImageMagick first
    You can use 'sudo brew install ImageMagick' to install it

AUTHOR:
    Pawpaw<lvyexuwenfa100@126.com>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    $0 1024.png ~/123
EOF
}

# Check ImageMagick
command -v convert >/dev/null 2>&1 || { error >&2 "The ImageMagick is not installed. Please use brew to install it first."; exit -1; }

# Check param
if [ $# != 2 ];then
    usage
    exit -1
fi

# Check dst path whether exist.
if [ ! -d "$DST_PATH" ];then
    mkdir -p "$DST_PATH"
fi

if [ ! -d "$DST_PATH/Circular.imageset" ];then
    mkdir -p "$DST_PATH/Circular.imageset"
fi

if [ ! -d "$DST_PATH/Utilitarian.imageset" ];then
    mkdir -p "$DST_PATH/Utilitarian.imageset"
fi

if [ ! -d "$DST_PATH/Extra Large.imageset" ];then
    mkdir -p "$DST_PATH/Extra Large.imageset"
fi

if [ ! -d "$DST_PATH/Graphic Bezel.imageset" ];then
    mkdir -p "$DST_PATH/Graphic Bezel.imageset"
fi

# Generate, refer to: https://developer.apple.com/watchos/human-interface-guidelines/icons-and-images/home-screen-icons/
info 'Generate Icon-16@2x.png ...'
convert "$SRC_FILE" -colors 2 -resize 32x32 -alpha on "$DST_PATH/Circular.imageset/Icon-16@2x.png"

info 'Generate Icon-18@2x.png ...'
convert "$SRC_FILE" -colors 2 -resize 36x36 -alpha on "$DST_PATH/Circular.imageset/Icon-18@2x.png"

info 'Generate Icon-20@2x.png ...'
convert "$SRC_FILE" -colors 2 -resize 40x40 -alpha on "$DST_PATH/Circular.imageset/Icon-20@2x.png"

info 'Generate Icon-26@2x.png ...'
convert "$SRC_FILE" -colors 2 -resize 52x52 -alpha on "$DST_PATH/Circular.imageset/Icon-26@2x.png"

info 'Generate Icon-29@2x.png ...'
convert "$SRC_FILE" -colors 2 -resize 58x58 -alpha on "$DST_PATH/Circular.imageset/Icon-29@2x.png"

info 'Generate Icon-32@2x.png ...'
convert "$SRC_FILE" -colors 2 -resize 64x64 -alpha on "$DST_PATH/Circular.imageset/Icon-32@2x.png"

info 'Generate Icon-20@2x.png ...'
convert "$SRC_FILE" -colors 2 -resize 40x40 -alpha on "$DST_PATH/Utilitarian.imageset/Icon-20@2x.png"

info 'Generate Icon-22@2x.png ...'
convert "$SRC_FILE" -colors 2 -resize 44x44 -alpha on "$DST_PATH/Utilitarian.imageset/Icon-22@2x.png"

info 'Generate Icon-25@2x.png ...'
convert "$SRC_FILE" -colors 2 -resize 50x50 -alpha on "$DST_PATH/Utilitarian.imageset/Icon-25@2x.png"

info 'Generate Icon-91@2x.png ...'
convert "$SRC_FILE" -colors 2 -resize 182x182 -alpha on "$DST_PATH/Extra Large.imageset/Icon-91@2x.png"

info 'Generate Icon-101.5@2x.png ...'
convert "$SRC_FILE" -colors 2 -resize 203x203 -alpha on "$DST_PATH/Extra Large.imageset/Icon-101.5@2x.png"

info 'Generate Icon-112@2x.png ...'
convert "$SRC_FILE" -colors 2 -resize 224x224 -alpha on "$DST_PATH/Extra Large.imageset/Icon-112@2x.png"

info 'Generate Icon-42@2x.png ...'
convert "$SRC_FILE" -resize 84x84 -alpha on "$DST_PATH/Graphic Bezel.imageset/Icon-42@2x.png"

info 'Generate Icon-47@2x.png ...'
convert "$SRC_FILE" -resize 94x94 -alpha on "$DST_PATH/Graphic Bezel.imageset/Icon-47@2x.png"

info 'Generate Icon-36@2x.png ...'
convert "$SRC_FILE" -resize 72x72 -alpha on "$DST_PATH/Graphic Bezel.imageset/Icon-36@2x.png"

info 'Generate Done.'
