#!/usr/bin/perl

use strict;
use warnings;
use lib qw(/home/anigon/override);

use A;

my $obj = A->new;
$obj->test;
$obj->child->test;

print $obj->random, "\n";

{
    no strict 'refs';
    no warnings 'redefine';

    local *{"A::test"}   = sub { print "this is override\n" };
    local *{"B::test"}   = sub { print "this is override\n" };

    local *{"A::random"} = sub { 1 };

    $obj->test;
    $obj->child->test;
    print $obj->random, "\n";
}

$obj->test;
$obj->child->test;
print $obj->random, "\n";

exit;
