%.c: %.l
	flex -o $@ $<

%: %.c
	gcc -o $@ $< -lfl
