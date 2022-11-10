# Makefile -- for building with GNU Make
# ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 11/2022 ~ #

# Written and tested using: g++ 9.4.0 // GNU Make 4.2.1 // cmake 3.16.3 
# This was written and tested on a system running 64-bit Ubuntu 20.04.5 LTS
#   using the following list of common debugging compiler flags:
# "Common" = "-std=c++11 -pedantic-errors -Wall -Wextra -Wshadow -m64 -DDEBUG -g"

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

## basics
TARGET = roll
SHELL=/usr/bin/sh
CXX = g++
OBJ = main.o
BUILDDIR = build/		# only used for 'clean' target (see build.sh)
RM = -/usr/bin/rm -f


## compiler flags

# | Combination			Description						Behavior			  ID
# | Common (see above)		"give me warnings and keep compiling"			compiles with warning		  C
# | Common  - Format		"give me non-format warnings and keep compiling"	compiles quietly		  C-F
# | Common  + Error		"stop compiling if there are warnings"			terminates at error		  C+E
# | (above) - Format		"stop compiling if there are non-format warnings"	compiles quietly		  C+E-F

# Uncomment one of the following lines to enable desired combination of flags:
CXXFLAGS := -std=c++11 -pedantic-errors -Wall -Wextra -Wshadow -m64 -DDEBUG -g					# C      
# CXXFLAGS := -std=c++11 -pedantic-errors -Wall -Wextra -Wshadow -m64 -DDEBUG -g -Wno-format				# C-F    
# CXXFLAGS := -std=c++11 -pedantic-errors -Wall -Wextra -Wshadow -m64 -DDEBUG -g -Werror				# C+E    
# CXXFLAGS := -std=c++11 -pedantic-errors -Wall -Wextra -Wshadow -m64 -DDEBUG -g -Werror -Wno-format			# C+E-F  

# more compiler-flag combinations:
# CXXFLAGS := -std=c++11 -m64 #-Werror -Wno-format
# CXXFLAGS := -std=c++11 -m64 -W -Wall -Werror


## targets and rules

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJ)

clean:
	$(RM) $(TARGET) *.o
	$(RM) -r $(BUILDDIR)

