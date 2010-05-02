package Elch::Exception;

use strict;
use warnings;

sub new   {
    my $self  = shift;
    my %arg   = @_;

    my $class = ref $self || $self;
    bless \%arg, $class;
}

sub throw {
    my $self = shift;
    my %arg  = @_;

    my @trace = caller;
    my %param = (
            %arg,
            trace => \@trace
    );
    die $self->new(%param);
}

sub get_message { shift->{message} }
sub get_trace   { shift->{trace}   }

1; # end of this class
