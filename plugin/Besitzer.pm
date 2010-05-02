package Besitzer;
# handler class of Laden

use strict;
use warnings;
use Carp;

sub new {
    my $class = shift;
    my %arg   = @_;

    my $gast  = $arg{gast};
    my $laden = $arg{laden};

    (ref $gast) =~ /^Gast/
        or confess "gast must be class of Gast";

    (ref $laden) =~ /^Laden/
        or confess "laden must be class of Laden";

    bless {
        _gast  => $gast,
        _laden => $laden,
    }, $class;
}

sub exec {
    my $self = shift;

    for my $member_name (keys %{$self->{_laden}->class_members}) {
        $self->{_laden}->$member_name->exec($self->{_gast});
    }
}

1; # end of this class
