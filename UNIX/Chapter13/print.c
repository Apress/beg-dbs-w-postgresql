#include <stdlib.h>
#include <libpq-fe.h>

int main()
{
  PGresult *result;
  PGconn *conn;

  conn = PQconnectdb("");

  if(PQstatus(conn) == CONNECTION_OK) {

    result = PQexec(conn, "SELECT * FROM customer \
                           WHERE town = 'Bingham'");
    { 
      PQprintOpt pqp;
      pqp.header = 1;
      pqp.align = 1;
      pqp.html3 = 1;
      pqp.expanded = 0;
      pqp.pager = 0;
      pqp.fieldSep = "";
      pqp.tableOpt = "align=center";
      pqp.caption = "Bingham Customer List";
      pqp.fieldName = NULL;
      printf("<html><head><title>Customers</title></head><body>\n");
      PQprint(stdout, result, &pqp);
      printf("</body></html>\n");
    }

  }

  PQfinish(conn);
  return EXIT_SUCCESS;
}

