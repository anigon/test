package Variety;

use strict;
use warnings;

{
    my %_data;
    sub new {
        my $class = shift;

        $_data{num} = undef;

        bless \%_data, $class;
    }

    sub num {
        my $self = shift;
        $self->{num} = shift if scalar @_ > 0;
        return $self->{num};
    }
}

1; # end of this class
