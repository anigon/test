package Person::Deutscher::Muenchner;

use strict;
use warnings;
use base qw(Person);

sub say_hello { shift->SUPER::say_hello; print "Gruess Gott!\n" }
sub behaviour { shift->SUPER::behaviour; print "---\n" }

1; # end of this class
