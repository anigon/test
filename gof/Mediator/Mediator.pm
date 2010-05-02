package Mediator;

use strict;
use warnings;
use Carp;

{
    my %_member;
    sub new {
        my $class = shift;
        bless \%_member, $class;
    }

    sub set_company {
        my $self  = shift;
        my $company = shift;

        (ref $company) =~ /^Colleague::Company/
            or confess "arg shuld be object of Colleague::Company";

        $self->{company} = $company;
    }

    sub add_candidate {
        my $self     = shift;
        my $candidate = shift;

        (ref $candidate) =~ /^Colleague::Candidate/
            or confess "arg shuld be object of Colleague::Candidate";

        push @{$self->{candidates}}, $candidate;
    }

    sub do_mediate {
        my $self = shift;

        defined $self->{company}
                    or confess "company is required";
        defined $self->{candidates}
                    or confess "candidate is required";

        my $company    = $self->{company};
        my $is_success = 0;

        for my $candidate (@{$self->{candidates}}) {
            $candidate->company($company);
            next unless $candidate->agree;

            $company->candidate($candidate);
            next unless $company->agree;

            $candidate->success;
            $company->success;

            $is_success = 1;
            last;
        }

        return $is_success;
    }
}

1; # end of this class
