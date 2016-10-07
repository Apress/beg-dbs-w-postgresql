<?php
   /* Import the PEAR DB interface. */
   require_once "DB.php";

   /* Database connection parameters. */
   $username = "jon";
   $password = "secret";
   $hostname = "localhost";
   $dbname = "bpsimple";
   $protocol = “unix”;

   /* Construct the DSN – Data Source Name. */
   $dsn = "pgsql://$username:$password@$hostname+$protocol/$dbname";

   /* Attempt to connect to the database. */
   $db = DB::connect($dsn);

   /* Check for any connection errors. */
   if (DB::isError($db)) {
      die ($db->getMessage());
   }

   /* Execute a selection query. */
   $query = 'SELECT title, fname, lname FROM customer';
   $result = $db->query($query);

   /* Check for any query execution errors. */
   if (DB::isError($result)) {
      die ($result->getMessage());
   }

   /* Fetch and display the query results. */
   while ($row = $result->fetchRow(DB_FETCHMODE_ASSOC)) {
      $fullname = $row['title'] . ' ';
      $fullname .= $row['fname'] . ' ';
      $fullname .= $row['lname'];
      echo "Customer: $fullname<br />\n";
   }

   /* Disconnect from the database. */
   $db->disconnect();
?>
