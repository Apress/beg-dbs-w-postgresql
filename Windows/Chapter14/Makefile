# Makefile for sample programs
# in Beginning PostgreSQL

# Edit the base directories for your
# PostgreSQL installation

INC=/usr/local/pgsql/include
LIB=/usr/local/pgsql/lib

CFLAGS=-I$(INC)
LDLIBS=-L$(LIB) -lecpg -lpq
ECPGFLAGS= -I$(INC)

.SUFFIXES: .pgc
.pgc.c:
	ecpg $(ECPGFLAGS) $<

ALL= cursor insert insert2 select select2 select3 update update2

all: $(ALL)

clean:
	@rm -f $(ALL) *~

