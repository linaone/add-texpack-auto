#!/bin/bash

# set your latex package directory and comment in
#latex_path=/usr/share/texlive/texmf-dist/tex/latex
if [ -z $latex_path ]; then
    echo "please set your latex package directory"
    exit 1;
fi

if [ -z $1 ]; then
    echo "Usage: ./addtexpack.sh hoge_dir (which has a foo.sty just below)"
    exit 1;
fi    

arg1=$1 # ./hoge_dir  # hoge_dir has a foo.sty file
sty_name=${arg1##*/} # := hoge_dir
name=${sty_name%.*} # := foo

#echo $arg1
#echo $sty_name
#echo $name

# depend on your needs
#chmod 644 $arg1/*

sudo mkdir $latex_path/$name
sudo cp -r $arg1/* $latex_path/$name/

sudo mktexlsr
kpsewhich sty_name
