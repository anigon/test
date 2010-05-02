package Laden;

use strict;
use warnings;
use YAML;

use constant CONF_YAML_FILE_PATH => './class_member.yml';
my %class_members = ();

{
    my $_conf      = YAML::LoadFile(CONF_YAML_FILE_PATH);
    %class_members = %{$_conf->{class_members}};
}

no strict 'refs';
for my $member_name (keys %class_members) {
    my $class_name = $class_members{$member_name};
    my $file_path  = $class_name;
    $file_path     =~ s/::/\//g;

    my $accessor = sub { 
        my $self = shift;
        unless ($self->{$class_name}) {
            require "${file_path}.pm";
            $self->{$class_name} = $class_name->new;
        }
        return $self->{$class_name};
    };
    *{__PACKAGE__."::${member_name}"} = $accessor;
}

sub new { bless {}, shift }

1; # end of this class
