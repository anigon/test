package Data::Adapter;

use strict;
use warnings;
use Carp;

use base qw(Data);

{
    my %_data;
    sub new {
        my $class   = shift;
        my $variety = shift;

        ref $variety eq 'Variety'
            or confess "arg shuld be object of class 'Variety'";

        $_data{variety} = $variety;

        bless \%_data, $class;
    }

    sub left {
        shift->{variety}->num;
    }

    sub right {
        return 0;
    }
}

1; # end of this class
