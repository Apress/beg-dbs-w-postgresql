<?php
   $db_handle = pg_connect('dbname=bpsimple user=jon password=secret');
   $query = 'SELECT title, fname, lname FROM customer';
   $result = pg_query($db_handle, $query);
   echo 'Field 1 is named: ' . pg_field_name($result, 1) . "<br />\n";
   echo 'Field item_id is number: ' . pg_field_num($result, 'fname');
   pg_close($db_handle);
?>
