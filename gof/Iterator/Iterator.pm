package Iterator;

use strict;
use warnings;

{
    my %_param;
    sub new {
        my $class = shift;
        my @data  = @_;

        $_param{data} = \@data;

        bless \%_param, $class;
    }

    sub has_next {
        my $self = shift;
        return 0 unless defined @{$self->{data}};
        return 0 unless scalar @{$self->{data}} > 0;

        return 1;
    }

    sub next {
        my $self = shift;
        shift @{$self->{data}};
    }
}

1; # end of this class
