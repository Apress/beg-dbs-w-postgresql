<?php
   $db_handle = pg_connect('dbname=bpsimple user=jon password=secret');
   echo "<h1>Connection Information</h1>\n";
   echo 'Database name: ' . pg_dbname($db_handle) . "<br />\n";
   echo 'Hostname: ' . pg_host($db_handle) . "<br />\n";
   echo 'Options: ' . pg_options($db_handle) . "<br />\n";
   echo 'Port: ' . pg_port($db_handle) . "<br />\n";
   echo 'TTY name: ' . pg_tty($db_handle) . "<br />\n";
   pg_close($db_handle);
?>
