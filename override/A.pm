package A;

use strict;
use warnings;

use B;

sub new   { bless {}, $_[0] }
sub child { B->new }
sub test  { print "this is sub routine of a\n" }

sub random { int(rand(100)) }

1;
