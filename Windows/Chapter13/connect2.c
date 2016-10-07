#include <stdlib.h>
#include <libpq-fe.h>

int main()
{
  PGconn *myconnection = PQconnectdb("");
  if(PQstatus(myconnection) == CONNECTION_OK)
    printf("connection made\n");
  else
    printf("connection failed: %s", PQerrorMessage(myconnection));
  PQfinish(myconnection);
  return EXIT_SUCCESS;
}

