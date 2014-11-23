EXES=$(shell ls | xargs -n 1 | grep .s$ | cut -d '.' -f 1)

all: $(EXES)

%: %.o
	gcc -o $@ $^

% : %.s

%.o : %.s
	as -o $@ $<

clean: 
	rm $(EXES)
