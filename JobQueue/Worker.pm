package Worker;

use strict;
use warnings;
use Carp;
use base qw(TheSchwartz::Worker);

use Module::Load;

use constant WORKER_ELEMENT_BASE => 'Worker::Element::';

sub work {
    my ($class, $job) = @_;

    my $class_name = WORKER_ELEMENT_BASE. $job->arg->{class};
    unless ($class_name) {
        warn "class is required";
        return;
    }

    eval { load $class_name };
    if ($@) {
        warn "$class_name could not be required. $@";
        return;
    }

    $class_name->Execute($job)
        or confess "$class_name could not execute. ";

    $job->completed();
}

1; # end of this class
