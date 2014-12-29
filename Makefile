CC = gcc
CFLAGS = -O2 -march=native
CFLAGS += -Wall -Wextra -pedantic -std=c89
CFLAGS += -Wpadded -Wwrite-strings
LDFLAGS = -static
OBJECTS = lopartscan.o

.PHONY: all
all: lopartscan

lopartscan: $(OBJECTS)
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $<

.PHONY: clean
clean:
	rm -f lopartscan $(OBJECTS)
