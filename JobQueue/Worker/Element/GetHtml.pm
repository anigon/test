package Worker::Element::GetHtml;
# worker sample 2

use strict;
use warnings;
use LWP::UserAgent;

{
    my $_ua = LWP::UserAgent->new;
    sub GetUserAgent { return $_ua }
}

sub Execute {
    my $dummy = shift;
    my $job   = shift;

    unless (exists $job->arg->{url} && $job->arg->{url}) {
        warn "url is empty.";
        return 0;
    }

    my $ua  = __PACKAGE__->GetUserAgent;
    my $res = $ua->get($job->arg->{url});

    unless ($res->is_success) {
        warn $res->status_line;
        return 0;
    }

    print $res->decoded_content;

    return 1;
}

1; # end of this class
