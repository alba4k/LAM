CC := clang
CFLAGS := -Wall -Wextra -O2

OBJ := obj/core.o obj/error.o obj/lists.o obj/main.o obj/stdlib.o obj/utils.o obj/variables.o

ifeq ($(DEBUG),1)
	OBJ := obj/core.o obj/debug.o obj/error.o obj/lists.o obj/main.o obj/stdlib.o obj/utils.o obj/variables.o
	CFLAGS := -Wall -Wextra -O2 -DDEBUG -g
endif

build/albalang: $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o build/albalang -lm

obj/core.o: src/core.c
	$(CC) $(CFLAGS) -c src/core.c -o obj/core.o

obj/debug.o: src/debug.c
	$(CC) $(CFLAGS) -c src/debug.c -o obj/debug.o

obj/error.o: src/error.c
	$(CC) $(CFLAGS) -c src/error.c -o obj/error.o

obj/lists.o: src/datastructures/lists.c
	$(CC) $(CFLAGS) -c src/datastructures/lists.c -o obj/lists.o

obj/main.o: src/main.c
	$(CC) $(CFLAGS) -c src/main.c -o obj/main.o

obj/stdlib.o: src/stdlib.c
	$(CC) $(CFLAGS) -c src/stdlib.c -o obj/stdlib.o

obj/utils.o: src/utils.c
	$(CC) $(CFLAGS) -c src/utils.c -o obj/utils.o

obj/variables.o: src/datastructures/variables.c
	$(CC) $(CFLAGS) -c src/datastructures/variables.c -o obj/variables.o

clean:
	rm -rf obj/* build/*