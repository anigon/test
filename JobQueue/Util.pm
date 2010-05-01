package Util;

use strict;
use warnings;

use constant YAML_FILE_PATH => './setting.yml';

{
    require 'TheSchwartz.pm';
    require 'YAML.pm';

    my $_client = do {
        my $_conf = YAML::LoadFile(YAML_FILE_PATH);
        TheSchwartz->new(databases => [$_conf->{database}]);
    };

    sub GetClientInstance { return $_client }
}


1; # end of this script
