#!/bin/bash
# compile_steps.sh -- Script to demonstrate the individual stages
#   of making a simple c++ program:
#   Preprocess --> Compile --> Assemble --> Link
# - This version modified for program 'roll' in github.com/duvall3/cpp-flags
# - Written and tested on 64-bit Ubuntu 20.04.5 using gcc/g++ 9.4.0
# Usage: compile_steps.sh [clean]
# ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 11/2022 ~ #

# clean check
if [[ $1 =~ clean ]]; then
  echo -e "rm main.{ii,s,o}\nrm roll"
  for FILE in {main.{ii,s,o},roll}; do
    if [ -f ./$FILE ]; then
      /usr/bin/rm ./$FILE
    fi
  done
  exit 0
fi

# init
INFILE=../main.cpp
BASENAME=$(basename $INFILE .cpp)
PREP_FILE="$BASENAME".ii
ASM_FILE="$BASENAME".s
OBJ_FILE="$BASENAME".o

# set any desired options
GCC="gcc -Wno-format"
GPP="g++"

# main:
# preprocess only: original source code --> preprocessed source code
PREP="$GCC $INFILE -E -o $PREP_FILE"
echo -e "Preprocessing:\t$PREP"
eval $PREP
# compile only: preprocessed source code --> assembler code
COMP="$GCC $PREP_FILE -S"
echo -e "Compiling:\t$COMP"
eval $COMP
# assemble only: assembler code --> object file
ASSM="$GCC $ASM_FILE -c"
echo -e "Assembling:\t$ASSM"
eval $ASSM
# link: object file --> binary executable
LINK="$GPP -o roll $OBJ_FILE"
echo -e "Linking:\t$LINK"
eval $LINK
if [ $? -eq 0 ]; then echo "Done."; fi

# all pau!   )
exit 0
