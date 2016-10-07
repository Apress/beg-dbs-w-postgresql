#include <stdlib.h>
#include <libpq-fe.h>

void printTuples(PGresult *result)
{
      int r, n;
      int nrows = PQntuples(result);
      int nfields = PQnfields(result);
      printf("number of rows returned = %d\n", nrows);
      printf("number of fields returned = %d\n", nfields);
      for(r = 0; r < nrows; r++) {
	for(n = 0; n < nfields; n++)
	  printf(" %s = %s(%d),", 
		 PQfname(result, n), 
		 PQgetvalue(result, r, n),
		 PQgetlength(result, r, n));
	printf("\n");
      }
}

int main()
{
  PGresult *result;
  PGconn *conn;

  conn = PQconnectdb("");

  if(PQstatus(conn) == CONNECTION_OK &&
     PQsetnonblocking(conn,1) == 0) {
    printf("connection made\n");

    PQsendQuery(conn, "SELECT * FROM customer");
    while(result = PQgetResult(conn)) {
      printTuples(result);
      PQclear(result);
    }
  }
  else 
    printf("connection failed\n");

  PQfinish(conn);
  return EXIT_SUCCESS;
}
