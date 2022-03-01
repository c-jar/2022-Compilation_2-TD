CC=gcc
LDFLAGS=-lfl -lm
EXEC_NAME=geometrie_syntaxique
OBJETS=geometrie_syntaxique.o geometrie_lexical.o

.y.c:
	bison -d $< --graph=desc.dot
	dot -Tsvg desc.dot > desc.svg
	mv $*.tab.c $*.c
	mv $*.tab.h mes_tokens.h

.l.c:
	flex $<
	mv lex.yy.c $*.c

.c.o:
	$(CC) -c $<

all: $(EXEC_NAME)

$(EXEC_NAME): $(OBJETS)
	$(CC) -o $@ $^ $(LDFLAGS)

clean:
	rm $(OBJETS) $(EXEC_NAME)
