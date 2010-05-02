#!/usr/bin/perl

use strict;
use warnings;

use Mediator;
use Colleague::Company;
use Colleague::Candidate;

my $company     = Colleague::Company->new;
my $candidate_a = Colleague::Candidate->new;
my $candidate_b = Colleague::Candidate->new;
my $candidate_c = Colleague::Candidate->new;

$company->name('Kazte Co.');
$company->offer(1000);

$candidate_a->name('anigon');
$candidate_a->competence(3);
$candidate_a->minimum_offer(1200);

$candidate_b->name('anney');
$candidate_b->competence(12);
$candidate_b->minimum_offer(900);

$candidate_c->name('kukumama');
$candidate_c->competence(5);
$candidate_c->minimum_offer(870);

my $med = Mediator->new;
$med->set_company($company);
$med->add_candidate($candidate_a);
$med->add_candidate($candidate_b);
$med->add_candidate($candidate_c);
$med->do_mediate;


exit;

