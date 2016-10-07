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

   /* Set up the $items array. */
   $items = array(
      '6241527836190' => 1,
      '7241427238373' => 2,
      '7093454306788' => 3
   );

   /* Prepare our template SQL statement. */
   $statement = $db->prepare('INSERT INTO barcode VALUES(?,?)');

   /* Execute the statement for each entry in the $items array. */
   while (list($barcode, $item_id) = each($items)) {
      $db->execute($statement, array($barcode, $item_id));
   }

   /* Execute a selection query. */
   $query = 'SELECT * FROM barcode';
   $result = $db->query($query);

   /* Fetch and display the query results. */
   while ($row = $result->fetchRow(DB_FETCHMODE_ASSOC)) {
      echo $row['item_id'] . ' -> ' . $row['barcode_ean'] . "<br />\n";
   }

   /* Disconnect from the database. */
   $db->disconnect();
?>
