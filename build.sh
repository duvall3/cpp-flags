#!/bin/bash
# build.sh -- simple build script using CMake
# ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 11/2022 ~ #

# Note: The steps are spaced out for clarity and automation here;
#   a typical interactive usage might look like this:
#       mkdir -p build && cd build
#       CXX=g++ CXXFLAGS="-Wall -g" cmake -S .. -B .
#       cmake --build . --target install

# clean check
if [[ $1 =~ clean ]]; then
  make clean
  if [ -d build ]; then
    echo "/usr/bin/rm -rf build/"
    /usr/bin/rm -rf build/
  fi
  exit 0
fi

# init
mkdir -p build
cd build/

# set compiler and flags
CXX=g++
CXXFLAGS="-Wall -g"
export CXX CXXFLAGS

# configure the build
cmake -S .. -B .

# make
if [ $? -eq 0 ]; then
  cmake --build .
else
  echo "Build configuration problem detected."
  exit 10
fi

# install
if [ $? -eq 0 ]; then
  cmake --install .
else
  echo "Build problem detected."
  exit 11
fi

# all pau!   )
exit $?
