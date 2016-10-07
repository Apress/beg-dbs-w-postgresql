<?php
   $db_handle = pg_connect('dbname=bpsimple user=jon password=secret');
   $query = 'SELECT * FROM customer';
   $result = pg_query($db_handle, $query);
   if ($result) {
      echo "The query executed successfully.<br />\n";
   } else {
      echo "The query failed with the following error:<br />\n";
      echo pg_last_error($db_handle);
   }
   pg_close($db_handle);
?>
