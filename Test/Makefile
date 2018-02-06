#
#

hello:
	@echo Hello Makefile


all:	c fortran

make:
	@echo catch-22, the script test-make should be used

c:
	gcc -o test-c test-c.c -lm
	./test-c

fortran:
	gfortran -o test-f test-f.f
	./test-f
