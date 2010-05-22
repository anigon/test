package Parent::Child::GrandChild;

use strict;
use warnings;

use Parent::Child;

no warnings "redefine";
sub grand_child_method { print "grand child method\n"          }
sub override_method    { print "override grand child method\n" }

sub import {
    my ($pkg) = caller;

    no strict "refs";
    for my $member (keys %{__PACKAGE__."::"}) {
        next unless __PACKAGE__->can($member);
        next if $member =~ /^import$/;

        *{"${pkg}::${member}"} = \&{$member};
    }
}

1; # end of this class
