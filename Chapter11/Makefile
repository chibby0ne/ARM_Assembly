EXES=$(shell ls | xargs -n 1 | grep .s$ | cut -d '.' -f 1)
CFLAGS=-march=armv6

all: $(EXES)

%: %.o
	gcc -o $@ $^ 

% : %.s

%.o : %.s
	as -o $@ $< $(CFLAGS)

clean: 
	rm $(EXES)


