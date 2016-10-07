# Makefile for sample programs
# in Beginning PostgreSQL

# Edit the base directories for your
# PostgreSQL installation

INC=/usr/local/pgsql/include
LIB=/usr/local/pgsql/lib

CFLAGS=-I$(INC)
LDLIBS=-L$(LIB) -lpq

ALL=async1 async2 connect create cursor cursor2 print select1 select2 import

all: $(ALL)

clean:
	@rm -f *.o *~ $(ALL)
