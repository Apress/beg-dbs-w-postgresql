<?php
   $db_handle = pg_connect('dbname=bpsimple user=jon password=secret');
   if ($db_handle) {
      echo 'Connection attempt succeeded.';
   } else {
      echo 'Connection attempt failed.';
   }
   pg_close($db_handle);
?>
