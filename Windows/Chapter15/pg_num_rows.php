<?php
   $db_handle = pg_connect('dbname=bpsimple user=jon password=secret');
   $query = 'SELECT * FROM customer';
   $result = pg_query($db_handle, $query);
   if ($result) {
      echo "The query executed successfully.<br />\n";
       echo "Number of rows in result: " . pg_num_rows($result) . "<br />\n";
      echo "Number of fields in result: " . pg_num_fields($result);
   } else {
      echo "The query failed with the following error:<br />\n";
      echo pg_errormessage($db_handle);
   }
   pg_close($db_handle);
?>
