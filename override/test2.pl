#!/usr/bin/perl

use strict;
use warnings;
use lib qw(/home/anigon/override);

use A;
use C;

my $obj = A->new;
$obj->test;
$obj->child->test;

{
    no strict 'refs';
    no warnings 'redefine';

    local *{"A::test"}  = sub { print "this is override\n" };
    local *{"A::child"} = sub { C->new };

    $obj->test;
    $obj->child->test;
}

$obj->test;
$obj->child->test;

exit;
