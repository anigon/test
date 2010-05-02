package Operator;

use strict;
use warnings;
use Carp;

use Data;

sub new { bless {}, $_[0] }

sub plus {
    my $self = shift;
    my $data = shift;

    (ref $data) =~ /^Data/
        or confess "arg shuld be object of 'Data'";

    return $data->left + $data->right;
}

1; # end of this class
