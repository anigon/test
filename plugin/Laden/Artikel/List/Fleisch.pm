package Laden::Artikel::List::Fleisch;

use strict;
use warnings;
use base qw(Laden::Artikel::AbstractList);

sub element_class_name { "Laden::Artikel::Element::Fleisch" }

1; # end of this class;
