#!/usr/bin/perl -w

use DBIx::Easy;
use strict;

sub myErrorHandler
{
    my( $statement, $err, $msg ) = @_;
    die"Oops, \"$statement\" failed ($err) - $msg";
}

# Note: we have to specify the DB type and the dbname explicitly
my $conn = new DBIx::Easy("Pg", "bpfinal");

$conn->install_handler(\&myErrorHandler);

$conn->process("DROP TABLE number");
$conn->process("CREATE TABLE number ( value INTEGER, name  VARCHAR )");
$conn->insert("number", name => "The Answer",     value => 42);
$conn->insert("number", name => "My Age",         value => 29);
$conn->insert("number", name => "Anniversary",    value => 29);
$conn->insert("number", name => "Clickety-Click", value => 66);

my $numbers = $conn->makemap("number", "name", "value", "value = 29");
foreach my $name (keys(%$numbers)) {
    print $name, " has value ", $$numbers{$name}, "\n";
}

$conn->update("number", "value = 42", name => "Zaphod");
$conn->process("DELETE FROM number WHERE value = 29");
$conn->commit;
