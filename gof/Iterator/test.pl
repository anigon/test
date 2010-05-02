#!/usr/bin/perl

use strict;
use warnings;
use lib qw(/home/anigon/gof/Iterator);

use Iterator;

my @data = qw(a b c d e f g);
my $ite  = Iterator->new(@data);

while ($ite->has_next) {
    print $ite->next, "\n";
}

exit;
