CC = gcc
CFLAGS = -Og -Wall -Werror -Wextra -pedantic -fsanitize=address
OBJ = test.o
HEADER = strfmt.h

TESTEXE = test

all: test

$(TESTEXE): $(OBJ)
	$(CC) $(CFLAGS) -o $(TESTEXE) $(OBJ)
	./$(TESTEXE)

%.o: %.c $(HEADER)
	$(CC) -c $(CFLAGS) $<

clean:
	rm -f *.o
	rm -f $(TESTEXE)

lint:
	clang-tidy -checks="*,-llvm-header-guard" -header-filter=".*" *.c

.PHONY: clean all lint
