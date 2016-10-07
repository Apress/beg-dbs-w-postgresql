<?php
   $db_handle = pg_connect('dbname=bpsimple user=jon password=secret');
   $query = 'SELECT title, fname, lname FROM customer';
   $result = pg_query($db_handle, $query);
   if ($result) {
      echo "The query executed successfully.<br />\n";
         for ($row = 0; $row < pg_num_rows($result); $row++) {
            $fullname = '';
            for ($col = 0; $col < pg_num_fields($result); $col++) {
               $fullname .= pg_fetch_result($result, $row, $col) . ' ';
            }
            echo "Customer: $fullname<br />\n";
         }
   } else {
      echo "The query failed with the following error:<br />\n";
      echo pg_errormessage($db_handle);
   }
   pg_close($db_handle);
?>
