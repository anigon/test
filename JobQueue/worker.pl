#!/usr/bin/perl

use strict;
use warnings;
use lib qw(/home/anigon/JobQueue);

use Util;
use Worker;

my $client = Util->GetClientInstance;
$client->can_do('Worker');
$client->work();

# end of this script
