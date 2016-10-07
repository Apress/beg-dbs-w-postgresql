#!/usr/bin/perl -w

use Pg;
use strict;

sub doSQL
{
    my ($conn, $command) = @_;

    print $command, "\n";

    my $result = $conn->exec($command);
    print "status is ", $result->resultStatus, "\n";
    print "#rows affected ", $result->cmdTuples, "\n";
    print "result message: ", $conn->errorMessage, "\n";

    if($result->resultStatus eq PGRES_TUPLES_OK) {
        print "number of rows returned = ", $result->ntuples, "\n";
        print "number of fields returned = ", $result->nfields, "\n";

        for(my $r = 0; $r < $result->ntuples; ++$r) {
            for(my $n = 0; $n < $result->nfields; ++$n) {
                print " ", $result->fname($n), " = ",
                      $result->getvalue($r, $n), "(",
                      $result->getlength($r, $n), "),";
            }
            print "\n";
        }
    }
}

my $conn = Pg::connectdb("");
	
if($conn->status eq PGRES_CONNECTION_OK) {
    print "connection made\n";

    doSQL($conn, "DROP TABLE number");
    doSQL($conn, "CREATE TABLE number ( value INTEGER, name  VARCHAR )");
    doSQL($conn, "INSERT INTO number values(42, 'The Answer')");
    doSQL($conn, "INSERT INTO number values(29, 'My Age')");
    doSQL($conn, "INSERT INTO number values(29, 'Anniversary')");
    doSQL($conn, "INSERT INTO number values(66, 'Clickety-Click')");
    doSQL($conn, "SELECT * FROM number WHERE value = 29");
    doSQL($conn, "UPDATE number SET name = 'Zaphod' WHERE value = 42");
    doSQL($conn, "DELETE FROM number WHERE value = 29");
} else {
    print "connection failed\n";
}
