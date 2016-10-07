<?php
   /* Import the PEAR DB interface. */
   require_once 'DB.php';

   /* Construct the DSN – Data Source Name. */
   $dsn = "pgsql://jon:secret@localhost+unix/bpsimple";

   /* Attempt to connect to the database. */
   $db = DB::connect($dsn);

   /* Check for any connection errors. */
   if (DB::isError($db)) {
      die ($db->getMessage());
   }
?>
