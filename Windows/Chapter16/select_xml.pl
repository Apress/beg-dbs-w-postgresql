#!/usr/bin/perl -w

use DBI;
use DBIx::XML_RDB;
use strict;

# Function for non-query commands
sub doSQL
{
    my ($conn, $command) = @_;

    print $command, "\n";

    my $sth = $conn->prepare($command);
    my $nrows = $sth->execute;
    print "status is ", $DBI::err, "\n" if $DBI::err;
    print "#rows affected is ", $nrows, "\n";
    print "error message: ", $DBI::errstr, "\n" if $DBI::err;
}

# Function specifically for queries
sub doSQLquery
{
    my ($conn, $command) = @_;

    print $command, "\n";

    $conn->DoSql($command);

    print $conn->GetData;
}


my $connXml = DBIx::XML_RDB->new("bpfinal", "PgPP") or die $DBI::errstr;
my $conn = $connXml->{dbh};

doSQL($conn, "DROP TABLE number");
doSQL($conn, "CREATE TABLE number ( value INTEGER, name  VARCHAR )");
doSQL($conn, "INSERT INTO number values(42, 'The Answer')");
doSQL($conn, "INSERT INTO number values(29, 'My Age')");
doSQL($conn, "INSERT INTO number values(29, 'Anniversary')");
doSQL($conn, "INSERT INTO number values(66, 'Clickety-Click')");
doSQLquery($connXml, "SELECT * FROM number WHERE value = 29");
doSQL($conn, "UPDATE number SET name = 'Zaphod' WHERE value = 42");
doSQL($conn, "DELETE FROM number WHERE value = 29");

