#!/usr/bin/perl

use strict;
use warnings;

use Person::Japaner;
use Person::Deutscher;
use Person::Deutscher::Muenchner;

my $person = Person::Japaner->new;
$person->greeting;

$person = Person::Deutscher->new;
$person->greeting;

$person = Person::Deutscher::Muenchner->new;
$person->greeting;

exit;
