OUT=bin/

SRC=$(wildcard *.s)
OBJ=$(addprefix bin/,$(notdir $(SRC:.s=.o)))
EXE=$(OBJ:.o='')




# all: first

# first: first.o
# 	gcc -o $@ $^

# first.o: first.s
# 	if ! [[ -e $(OUT) ]]; then \
# 		mkdir $(OUT); \
# 	fi
# 	as -o $@ $^

all: $(SRC) $(EXE)

$(EXE): $(OBJ)
	gcc -o $@ $^

$(OBJ): $(SRC)
	as -o $@ $^

clean:
	rm $(OBJ) $(EXE)
