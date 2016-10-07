#include <stdlib.h>
#include <libpq-fe.h>

int main()
{
  PGconn *myconnection = PQconnectdb("");
  PGresult *res;
  Oid blob;

  if(PQstatus(myconnection) == CONNECTION_OK)
    printf("connection made\n");
  else
    printf("connection failed\n");

  res = PQexec(myconnection, "begin");
  PQclear(res);

  blob = lo_import(myconnection, "image.jpg");
  printf("import returned oid %d\n", blob);

  res = PQexec(myconnection, "end");
  PQclear(res);

  PQfinish(myconnection);
  return EXIT_SUCCESS;
}

