#!/bin/bash
# compile_steps.sh -- Script to demonstrate the individual stages
#   of making a simple c++ program:
#   Preprocess --> Compile --> Assemble --> Link
# - This version modified for program 'roll' in github.com/duvall3/cpp-flags
# - Written and tested on 64-bit Ubuntu 20.04.5 using gcc/g++ 9.4.0
# Usage: compile_steps.sh [-h|-c]
# ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 11/2022 ~ #

# process options
USAGE="Usage: compile_steps.sh [-h|-c]\nBuild 'roll' in stages from 'main.cpp'.\n\n  -h\tShow this help message and exit\n  -c\tClean built files"
CLEAN_TF=false
while getopts "hc" OPTIONS; do
  case $OPTIONS in
    h)
      echo -e $USAGE
      exit 0
      ;;
    c)
      CLEAN_TF=true
      shift
      ;;
  esac
done

# init
INFILE=../main.cpp
BASENAME=$(basename $INFILE .cpp)
PREP_FILE="$BASENAME".ii
ASM_FILE="$BASENAME".s
OBJ_FILE="$BASENAME".o
TARGET=roll

# clean
if $CLEAN_TF; then
  echo -e "  /usr/bin/rm ./$BASENAME.{ii,s,o}\n  /usr/bin/rm ./$TARGET"
  for FILE in {$BASENAME.{ii,s,o},$TARGET}; do
    if [ -e ./$FILE ]; then /usr/bin/rm ./$FILE; fi
  done
  exit $?
fi

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
LINK="$GPP -o $TARGET $OBJ_FILE"
echo -e "Linking:\t$LINK"
eval $LINK
if [ $? -eq 0 ]; then echo "Done."; fi

# all pau!   )
exit 0
