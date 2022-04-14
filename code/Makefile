GRM=compil.y
LEX=compil.l
BIN=compil

CC=gcc
CFLAGS=-Wall -g

OBJ=y.tab.o lex.yy.o ts.o ta.o

all: $(BIN)

y.tab.c: $(GRM)
	yacc -d $<

lex.yy.c: $(LEX)
	flex --debug $<

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) $(CPPFLAGS) $^ -o $@

test: test.o ts.o

%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

clean:
	rm $(OBJ) y.tab.c y.tab.h lex.yy.c

