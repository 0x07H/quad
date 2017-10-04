CC = gcc
CFLAGS = -Wall -pedantic -std=c99
LIBS = -lm

butch: main.c
	${CC} ${CFLAGS} main.c ${LIBS}
clean: a.out
	rm a.out