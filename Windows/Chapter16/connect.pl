#!/usr/bin/perl -w

use DBI;
use strict;

my $dsn = $ARGV[0] if defined $ARGV[0];
my $conn = DBI->connect($dsn,"neil","", {RaiseError => 1}) || die "Error $DBI::err [$DBI::errstr]";
printf "Connected: State is %s\n", $conn -> state || "OK";
$conn -> disconnect;
