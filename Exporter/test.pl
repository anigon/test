#!/usr/bin/perl

use strict;
use warnings;

use lib qw(/home/anigon/git/Exporter);
use Parent::Child::GrandChild;

&parent_method;
&child_method;
&grand_child_method;
&override_method;

exit;
