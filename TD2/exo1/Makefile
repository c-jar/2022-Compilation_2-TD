CC=gcc
LDFLAGS=-lfl -lm
EXEC_NAME=contact_syntaxique
OBJETS=syntaxique.o lexical.o

.y.c:
	bison -d $< --graph=desc.dot
	dot -Tsvg desc.dot > desc.svg
	mv $*.tab.c $*.c
	mv $*.tab.h $*.h

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
