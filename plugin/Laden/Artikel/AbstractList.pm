package Laden::Artikel::AbstractList;

use strict;
use warnings;
use Carp;
use base qw(Laden::Plugin);

sub new {
    my $class = shift;
    bless {
        _list => [],
    }, $class;
}

sub append {
    my $self    = shift;
    my $artikel = shift;

    my $element_class = $self->element_class_name;

    (ref $artikel) =~ /^$element_class/
        or confess "arg must be class of ${element_class}";

    push @{$self->{_list}}, $artikel;

    return $self;
}

sub exec {
    my $self = shift;

    for my $artikel (@{$self->{_list}}) {
        print $artikel->name, " - ", $artikel->preis, "\n";
    }

    return $self;
}

1; # end of this class
