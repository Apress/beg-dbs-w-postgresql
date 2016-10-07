#!/usr/bin/perl  -w

use DBI;
use strict;

# Function for non query commands
sub doSQL
{
    my ($conn, $command) = @_;

    print $command, "\n";

    my $sth = $conn->prepare($command);
    my $nrows = $sth->execute;
    print "status is ", $conn->err, "\n" if $conn->err;
    print "#rows affected is ", $nrows, "\n";
    print "error message: ", $conn->errstr, "\n" if $conn->err;
}

my $conn = DBI->connect("DBI:ODBC:PostgreSQL") or die $DBI::errstr;

doSQL($conn, "DROP TABLE number");
doSQL($conn, "CREATE TABLE number ( value INTEGER, name  VARCHAR )");
doSQL($conn, "INSERT INTO number values(42, 'The Answer')");
doSQL($conn, "INSERT INTO number values(29, 'My Age')");
doSQL($conn, "INSERT INTO number values(29, 'Anniversary')");
doSQL($conn, "INSERT INTO number values(66, 'Clickety Click')");
doSQL($conn, "UPDATE number SET name = 'Zaphod' WHERE value = 42");
doSQL($conn, "DELETE FROM number WHERE value = 29");

$conn->disconnect;
