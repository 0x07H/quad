CC = gcc
CFLAGS = -Wall -pedantic -std=c99
LIBS = -lm

qsolve: main.c get_input.c quad.c quad.h get_input.h
	${CC} ${CFLAGS} main.c quad.c get_input.c -o qsolve.out ${LIBS}
clean: qsolve
	rm qsolve.out
butch: main.c
	${CC} ${CFLAGS} main.c
	