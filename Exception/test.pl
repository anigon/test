#!/usr/bin/perl -w

use strict;
use warnings;

use Data::Dumper;
use Elch::Exception;

eval {
    Elch::Exception->new->throw(message => "test exception");
};
if ($@) {
    if ($@->isa('Elch::Exception')) {
        print $@->get_message, "\n";
        print @{$@->get_trace}, "\n";
    } else { die $@ }
}

exit;
