package Parent::Child;

use Parent;

#use vars qw(@EXPORT @ISA);
#@ISA = qw(Exporter);
#@EXPORT = qw(child_method override_method);

sub child_method    { print "child method\n"    }
sub override_method { print "override child method\n" }

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
