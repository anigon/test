package Data;

use strict;
use warnings;

{
    my %_data;
    sub new {
        my $class = shift;

        %_data = (
                right => undef,
                left  => undef
        );

        bless \%_data, $class;
    }

    sub left {
        my $self = shift;
        $self->{left} = shift if scalar @_ > 0;
        return $self->{left};
    }

    sub right {
        my $self = shift;
        $self->{right} = shift if scalar @_ > 0;
        return $self->{right};
    }
}

1; # end of this class
