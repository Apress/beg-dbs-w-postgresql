<?php
   $db_handle = pg_connect('dbname=bpsimple user=jon password=secret');
   $query = 'SELECT * FROM customer';
   $result = pg_query($db_handle, $query);
   echo pg_num_rows($result) . ' rows were selected.';
   pg_close($db_handle);
?>
