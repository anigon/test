#!/usr/bin/perl
# add queue for TheSchwartz

use strict;
use warnings;
use Queue;

Queue->Add(worker_class => 'GetHtml', url => $ARGV[0]);

# end of this script
