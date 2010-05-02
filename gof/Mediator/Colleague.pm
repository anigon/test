package Colleague; # as interface

use strict;
use warnings;

{
    sub new { bless {}, $_[0] }

    sub agree      {} # it shuld be override
    sub success    {} # it shuld be override
    sub offer      {
        my $self = shift;
        $self->{offer} = shift if scalar @_ > 0;
        return $self->{offer};
    }
    sub competence {
        my $self = shift;
        $self->{competence} = shift if scalar @_ > 0;
        return $self->{competence};
    }
    sub name       {
        my $self = shift;
        $self->{name} = shift if scalar @_ > 0;
        return $self->{name};
    }
}

1; # end of this class
