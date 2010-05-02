#!/usr/bin/perl

use strict;
use warnings;
use lib qw(/home/anigon/gof/Adapter);

use Operator;
use Data;
use Variety;
use Data::Adapter;

# -----------------------------------

my $ope     = Operator->new;
my $data    = Data->new;

$data->left(5);
$data->right(3);
print $ope->plus($data), "\n";

# -----------------------------------

my $variety = Variety->new;
$variety->num(7);

my $adapter = Data::Adapter->new($variety);
print $ope->plus($adapter), "\n";

# -----------------------------------

exit;

# end of this script
