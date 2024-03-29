// roll -- simulate and add k rolls of an n-sided die, with overall bonus b
// ~ Mark J. Duvall ~ duvall3@github.com ~ 11/2021 ~ //

// USAGE: roll <SIDES>
//        roll <ROLLS> <SIDES> [BONUS]
// -- Or, in nerd lingo:
//      roll a dN --> 'roll N'
//      roll KdN --> 'roll K N'
//      roll KdN + B --> 'roll K N B'
// Examples:
// -- to roll  d6:         roll 6
// -- to roll 2d6:         roll 2 6
// -- to roll 2d6 + 8:     roll 2 6 8
// NOTE: This debug-testing version includes an intentional segfault
//   which can be triggered by calling the program as 'roll crash'

//Copyright (C) 2021 Mark J. Duvall / T. Rocks Science
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.


#include <string>
#include <cstring>
#include <vector>


using namespace std;


// FUNCTIONS


// primary
int roll( int k, int n, int b = 0 ) {

  // init
  srand( time(NULL) ); // seed
  int total(0);
  vector<int> rolls(k);
  int j;

  // MAIN
  // print requested calculation
  printf("%dd%d + {%d}  ==>  ", k, n, b);
  // loop over rolls
  for ( j=0; j<k; j++ ) {
    // generate and store appropriate random integers
    rolls[j] = 1 + rand() % n;
    // get running sum
    total += rolls[j];
    // print results
    printf("%d ", rolls[j]);
    if ( j < k-1 ) {
      printf("+ ");
    } else {
      printf("+ {%d}  =  ", b);
    } // end if -- print "+" signs
  } // end rolls loop
  // finally, add bonus
  total += b;
  printf("%d\n", total);

  return total;
}

// overload for single roll
int roll( int n )
{
  // init
  int total(0);
  srand( time(NULL) ); // seed
  // roll
  total = 1 + rand() % n;
  // print
  printf("%d\n", total);
  return total;
}

// MAIN
int main( int argc, char *argv[] )
{
  int k, n, b;
  // INTENTIONAL SEGFAULT TO TEST DEBUGGING
  if ( (argc>1) && (! isdigit(argv[1][0])) ) {
    const char* s1 = argv[1];
    const char* s2 = "crash";
    if ( strcmp(s1, s2) == 0 ) {
      printf("Triggering intentional segfault...\n");
      printf("k = %s\n", argc); // SEGFAULT IS HERE: int argc will not print as %s
      return 10;
    } else {
      printf( "Usage: roll <SIDES>\n       roll <ROLLS> <SIDES> [BONUS]\n" );
      return 2;
    }
  }
  // check arguments (i.e., confirm numeric)
  char* testarg;
  for ( int m=1; m<argc; m++ ) {
    testarg = argv[m];
    for ( size_t j=0; j<strlen(testarg); j++ ) {
      if (! isdigit(testarg[j])) {
	printf( "Usage: roll <SIDES>\n       roll <ROLLS> <SIDES> [BONUS]\n" );
	return 2;
      }
    }
  }
  // main function
  switch (argc) {
    case 2:
      n = stoi(argv[1]);
      roll(n);
      break;
    case 3:
      k = stoi(argv[1]);
      n = stoi(argv[2]);
      roll( k, n, 0 );
      break;
    case 4:
      k = stoi(argv[1]);
      n = stoi(argv[2]);
      b = stoi(argv[3]);
      roll( k, n, b );
      break;
    default:
      printf( "Usage: roll <SIDES>\n       roll <ROLLS> <SIDES> [BONUS]\n" );
      return 2;
  }
  return 0;
}


// all pau!   )
