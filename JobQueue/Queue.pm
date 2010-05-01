package Queue;

use strict;
use warnings;
use Carp;
use Util;

sub Add {
    my $class = shift;
    my %arg   = @_;

    my $worker_class = delete $arg{worker_class};
    $worker_class or confess "worker_class is required.";

    my $client = Util->GetClientInstance;
    $client->insert(
        'Worker' => { class => $worker_class, %arg }
    );
}

1; # end of this class
