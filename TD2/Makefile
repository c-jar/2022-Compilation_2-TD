%.y.c %.y.h: %.y
	bison -d $<

%.c: %.l %.y.h
	flex -o $@ $<

%.y.o: %.y.c
	gcc -c $< -o $@

%.l.o: %.l.c
	gcc -c $< -o $@

%: %.y.o %.l.o
	gcc -o $@ $@.y.o $@.l.o -lfl -lm
