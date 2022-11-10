# GDB with *ROLL*
***Simple C++ program with intentional segfault trigger to test the GNU Debugger***

**Files should include:**  
- `Makefile`  
- `CMakeLists.txt`  
- `build.sh`  
- `main.cpp`  
- `README.md`  
- `README.html`  

## Main Program: `roll`

1. In this directory, compile with either of the following:  
   - to use `GNU make` directly, run **`make`**  
   - to use `CMake`, run **`./build.sh`**  
2. Add the current directory to your *PATH* by running **`PATH=$PWD:$PATH`**  
3. Test its normal usage(s) with the commands below (details are located in the comments at the top of `main.cpp` if needed)  
4. Confirm intentional segfault is present by running **`roll crash`**  

## With GNU Debugger

1. Start `gdb` by running **`gdb roll`** at the shell prompt; use the `gdb` prompt for the steps below
2. Invoke `roll [ARGS]` with the command **`run [ARGS]`**;
     for example, **`run 2 6`** will execute **`roll 2 6`**  
3. Cause a segfault / core-dump by running **`run crash`**  
4. Examine the stack trace with the command **`bt`**  
5. Instruct the program to finish running with the command **`finish`**  
6. Exit `gdb` with the command **`q`**  

## Code Block

```bash
# compile
make
# normal tests
roll
roll 20
roll 3 8
roll 2 6 4
roll 1 2 3 4
# confirm segfault
roll crash
# start gdb
gdb roll
# repeat normal tests (optional)
run
run 20
run 3 8
run 2 6 4
run 1 2 3 4
# trigger segfault and examine stack trace
run crash
bt
# finish and exit
finish
q
```

## Additional Resources

Beyond the information in `man gdb` and `info gdb` (which may require the `gdb-doc` package), I found the following helpful:  
- [GDB Introduction at Geeks For Geeks](https://www.geeksforgeeks.org/gdb-step-by-step-introduction/)  
- [GDB Quick Guide at Tutorials Point](https://www.tutorialspoint.com/gnu_debugger/gdb_quick_guide.htm)  
- [Debugging with GDB at How-To Geek](https://www.howtogeek.com/devops/debugging-with-gdb-getting-started/)  
- [GDB Project Homepage at GNU.org](https://www.sourceware.org/gdb/)  

