package Laden::Artikel::AbstractElement;
# super class of Element
use strict;
use warnings;

sub new {
    bless {
        _name  => undef,
        _preis => undef,
    }, shift;
}

sub name {
    my $self = shift;
    $self->{_name} = shift if scalar @_ > 0;
    return $self->{_name};
}

sub preis {
    my $self = shift;
    $self->{_preis} = shift if scalar @_ > 0;
    return $self->{_preis};
}

1; # end of this class
