#!/bin/bash
# build.sh -- simple build script using CMake
# ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 11/2022 ~ #

# Note: The steps are spaced out for clarity and automation here;
#   a typical interactive usage might look like this:
#       mkdir -p build && cd build
#       CXX=g++ CXXFLAGS="-m64 -Wall -g" cmake -S .. -B .
#       cmake --build . --target install

#Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
CXXFLAGS="-m64 -Wall -g"
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
