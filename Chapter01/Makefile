#this is a comment

OUT=bin/

all: first

first: first.o
	gcc -o $OUT$@ $^

first.o: first.s
	as -o $@ $^

clean:
	rm *.o first
