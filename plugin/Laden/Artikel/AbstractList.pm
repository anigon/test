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
    my $gast = shift;

    (ref $gast) =~ /^Gast/
        or confess "gast must be class of Gast";

    my $geld_des_gasts = $gast->geld;

    for my $artikel (@{$self->{_list}}) {
        my ($type) = (ref $artikel) =~ /([^:]+)$/;
        print $artikel->name, "(${type}) - ", $artikel->preis, "\n";
        $geld_des_gasts -= $artikel->preis;
    }

    $gast->geld($geld_des_gasts);

    return $self;
}

1; # end of this class
