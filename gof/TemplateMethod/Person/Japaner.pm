package Person::Japaner;

use strict;
use warnings;
use base qw(Person);

sub say_hello { shift->SUPER::say_hello; print "Konnichiwa!\n" }
sub behaviour { shift->SUPER::behaviour; print "bow\n" }

1; # end of this class
