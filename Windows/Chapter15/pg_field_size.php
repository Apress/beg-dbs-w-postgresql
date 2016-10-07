<?php
   $db_handle = pg_connect('dbname=bpsimple user=jon password=secret');
   $query = 'SELECT title, fname, lname FROM customer';
   $result = pg_query($db_handle, $query);
   echo 'Field fname is number: ' . pg_field_num($result, 'fname') . "<br />\n";
   echo 'Field 1 is named: ' . pg_field_name($result, 1) . "<br />\n";
   echo 'Type of field 1: ' . pg_field_type($result, 1) . "<br />\n";
   echo 'Size of field 1: ' . pg_field_size($result, 1) . "<br />\n";
   echo 'Length of field 1: ' . pg_field_prtlen($result, $row, 1);
   pg_close($db_handle);
?>
