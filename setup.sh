#!/bin/bash

#####################
# tangle everything #
#####################

echo Tangling Files

# Make sure globstar is enabled
shopt -s globstar
for file in **/*.org; do # Whitespace-safe and recursive
    emacs -Q --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "$file")'
done

######################
# copy certain files #
######################

src_files=("logo.txt")

echo Copying some source files

for file in ${src_files}; do
    cp "$file" ~/.emacs.d/
done    

########################
# install all packages #
########################

echo Installing packages

emacs -Q --batch --eval "(load-file ~/.emacs.d/)"

######################
# post-install tasks #
######################

post_install_tasks=() # Still working on this

echo Executing post install tasks

emacs --batch --eval "(all-the-icons-install-fonts)"
