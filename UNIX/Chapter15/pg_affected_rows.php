<?php
   $db_handle = pg_connect('dbname=bpsimple user=jon password=secret');
   $query = 'DELETE FROM item WHERE cost_price > 10.00';
   $result = pg_query($db_handle, $query);
   if ($result) {
      echo "The query executed successfully.<br />\n";
      echo "Number of rows deleted: " . pg_affected_rows($result);
   } else {
      echo "The query failed with the following error:<br />\n";
      echo pg_errormessage($db_handle);
   }
   pg_close($db_handle);
?>
