package Parent;

use strict;
use warnings;

sub parent_method   { print "parent method\n"   }
sub override_method { print "override parent method\n" }

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
