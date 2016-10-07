#include <stdlib.h>
#include <libpq-fe.h>

int main()
{
  PGresult *result;
  PGconn *conn;

  /* Start an asynchronous connection */
  conn = PQconnectStart("");

  if(PQstatus(conn) == CONNECTION_BAD) {
    printf(" cannot start connect: %s\n", PQerrorMessage(conn));
  }
  else {
    /* do some work, calling PQconnectPoll from time to time */
    PostgresPollingStatusType status;
    do {
      printf("polling\n");
      status = PQconnectPoll(conn);
    }
    while(status != PGRES_POLLING_FAILED &&
	  status != PGRES_POLLING_OK);

    if(status == PGRES_POLLING_OK)
      printf("connection made!\n");
    else
      printf("connection failed: %s\n", PQerrorMessage(conn));
  }
  PQfinish(conn);
  return EXIT_SUCCESS;
}
