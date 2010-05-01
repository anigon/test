package B;

use strict;
use warnings;

sub new  { bless {}, $_[0] }
sub test { print "this is sub routine of b\n" }

1;
