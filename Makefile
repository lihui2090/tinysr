
CFLAGS=  -ffast-math -Wall -g -lm -I. -I../   -ltinysr -L.

APP_SOURCES := $(wildcard apps/*.c)
APPS := $(patsubst %.c,%,$(APP_SOURCES))

all: libtinysr.so $(APPS) 
libtinysr.so : tinysr.o
	arm-s3c2440-linux-gnueabi-gcc  -shared  tinysr.o -o libtinysr.so
tinysr.o : tinysr.c 
	arm-s3c2440-linux-gnueabi-gcc -c tinysr.c	
apps/%: apps/%.c 
	arm-s3c2440-linux-gnueabi-gcc -o $@ $<  $(CFLAGS)

.PHONY: clean
clean:
	rm -f *.o ${APPS}  libtinysr.so

