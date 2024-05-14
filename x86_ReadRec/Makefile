#Name: Brett Emory

gcc_Copt = -std=c99 -pedantic -g -Wimplicit-function-declaration -Wreturn-type -Wformat -c
gcc_Sopt = -lc -m64 -c -g

# target 'all' is for all targets currently defined in this file
all: lab7.zip readrec

# you must have a subsequent target for each file listed above on the right side of the colon

lab7.zip: Makefile lab7Readme readrec.s readlines.s compute.s printlines.s
	zip lab7.zip Makefile lab7Readme readrec.s readlines.s compute.s printlines.s

readrec: readrec.o readlines.o compute.o printlines.o
	gcc readrec.o readlines.o compute.o printlines.o -o readrec

readrec.o: readrec.s
	gcc $(gcc_Sopt) readrec.s

readlines.o: readlines.s
	gcc $(gcc_Sopt) readlines.s

compute.o: compute.s
	gcc $(gcc_Sopt) compute.s

printlines.o: printlines.s
	gcc $(gcc_Sopt) printlines.s

clean:
	rm -f readrec lab7.zip readrec.o readlines.o compute.o


