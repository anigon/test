package Colleague::Company;

use strict;
use warnings;
use Carp;
use base qw(Colleague);

{

    sub agree {
        my $self = shift;
        return $self->candidate->competence > 10;
        return 1;
    }

    sub candidate {
        my $self      = shift;
        my $candidate = shift;

        if (defined $candidate) {
            (ref $candidate) =~ /^Colleague::Candidate/
                    or confess "arg must be object of Colleague::Candidate";

            $self->{candidate} = $candidate;
        }

        return $self->{candidate};
    }

    sub success {
        my $self = shift;

        my $company_name   = $self->name;
        my $candidate_name = $self->candidate->name;

        print "${company_name} employs ${candidate_name}\n";
    }
}

1; # end of this class
