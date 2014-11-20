OUT=bin/

all: first

first: first.o
	gcc -o $(OUT)$@ $(OUT)$^

first.o: first.s
	if ! [[ -e $(OUT) ]]; then \
		mkdir $(OUT); \
	fi
	as -o $(OUT)$@ $^

clean:
	rm $OUT*.o $(OUT)first
