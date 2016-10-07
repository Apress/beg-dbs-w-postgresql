<?php
   /* Connect to the PostgreSQL database and store the connection handle. */
   $db_handle = pg_connect('dbname=bpsimple user=jon password=secret');

   /* Define and execute our SQL query string. */
   $query = 'SELECT * FROM item';
   $result = pg_query($db_handle, $query);

   /* Print the number of rows in the result using pg_num_rows(). */
   echo 'Number of rows: ' . pg_num_rows($result);

   /* Free the memory used by the result set and close the connection handle. */
   pg_free_result($result);
   pg_close($db_handle);
?>
