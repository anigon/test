package Laden::Plugin;
# super class of plugin

use strict;
use warnings;
use Carp;

sub new {
    my $class = shift;
    bless {
        _list => [],
    }, $class;
}

sub append {
    confess "append must be overridden";
}

sub exec {
    confess "exec must be overridden";
}

1; # end of this class
