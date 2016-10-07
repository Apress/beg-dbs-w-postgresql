#!/usr/bin/perl -w

use DBI;
use strict;

foreach my $driver (DBI->available_drivers())
{
    print "Driver ", $driver;

    eval { print "\n", join("\n ", DBI->data_sources($driver)), "\n\n" };
    print " - error ", $@, "\n\n" if ($@);
}
