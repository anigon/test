package Colleague::Candidate;

use strict;
use warnings;
use Carp;
use base qw(Colleague);

sub minimum_offer {
    my $self = shift;
    $self->{minimum_offer} = shift if scalar @_ > 0;
    return $self->{minimum_offer};
}

sub agree {
    my $self = shift;
    return if $self->offer < $self->minimum_offer;
    return 1;
}

# override
sub offer {
    my $self = shift;
    return $self->company->offer if defined $self->company;
    return 0;
}

sub company {
    my $self    = shift;
    my $company = shift;

    if (defined $company) {
        (ref $company) =~ /^Colleague::Company/
            or confess "arg shuld be class of Colleague::Company";

        $self->{company} = $company;
    }

    return $self->{company};
}

sub success {
    my $self = shift;

    my $company_name = $self->company->name;
    my $my_name      = $self->name;

    print "${my_name} is employed by ${company_name}\n";
}

1; # end of this class
