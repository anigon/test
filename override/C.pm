package C;

use strict;
use warnings;

sub new  { bless {}, $_[0] }
sub test { print "this is sub routine of c\n" }

1;
