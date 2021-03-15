# Ferienwohnung Management
# File: Makefile
#
# Last modified: 18.08.2017

TARGET=fewo-blacklist
TARGET_STATIC=fewo-blacklist-static
LIBS=
CC=g++
CFLAGS=-march=native -O2 -g -Wall

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.cpp, %.o, $(wildcard *.cpp))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -Wall $(LIBS) -o $@
	#strip $@

$(TARGET_STATIC): $(OBJECTS)
	$(CC) $(OBJECTS) -Wall $(LIBS) --static -o $@
	#strip $@

clean:
	-rm -f *.o
	-rm -f $(TARGET)
	-rm -f $(TARGET_STATIC)

mrproper:
	-rm -f *.o
	-rm -f $(TARGET)
	-rm -f $(TARGET_STATIC)
	-rm -f daten.txt
	-rm -f counter.txt

run:
	./$(TARGET)

reset:
	-echo   > daten.txt
	-echo 0 > counter.txt
