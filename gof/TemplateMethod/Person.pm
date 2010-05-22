package Person;

use strict;
use warnings;
use Carp;

# ----------------------------------------
# public

sub new { bless {}, shift }

sub greeting {
	my $self = shift;
	$self->say_hello;
	$self->behaviour;
}

# ----------------------------------------
# protected

sub say_hello { shift->_ensure_is_execute_scope }
sub behaviour { shift->_ensure_is_execute_scope }

# ----------------------------------------
# private

sub _ensure_is_execute_scope {
	my ($pkg) = caller(1);
	$pkg =~ /^Person/
		or confess "this method must be called same class or subclass";
}

1; # end of this class
