package Worker::Element::SplitWord;
# worker sample 1

use strict;
use warnings;

sub Execute {
    my $dummy  = shift;
    my $job    = shift;

    unless (exists $job->arg->{word} && $job->arg->{word}) {
        warn "word is empty.";
        return 0;
    }

    for (split //, $job->arg->{word}) {
        print $job->arg->{word}." $_\n";
    }

    return 1;
}

1; # end of this class
