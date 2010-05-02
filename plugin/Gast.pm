package Gast;

use strict;
use warnings;
use Carp;

sub new {
    my $class = shift;
    my %arg   = @_;

    my $name = $arg{name};
    my $geld = $arg{geld};

    $name =~ /^.+$/
        or confess "name is required";

    $geld =~ /^[0-9]+$/
        or confess "geld must be integer";

    bless {
        _name => $name,
        _geld => $geld,
    }, $class;
}

sub name { shift->{_name} }
sub geld {
    my $self = shift;
    $self->{_geld} = shift if scalar @_ > 0;
    return $self->{_geld};
}

1; # end of this class
