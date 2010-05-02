package A;

use strict;
use warnings;
use Carp;

use Data::Dumper;

use constant BASE_DIR =>  __FILE__ =~ /^([^\.]+\/)[^\/]+$/;

sub new {
    my $class = shift;
    my %arg   = @_;

    my $self = bless {
        plugins => [],
    }, $class;

    $self->init;
}

sub init {
    my $self = shift;
    $self->load_plugin;
}

sub plugin_dir {
    my $self = shift;
    return $self->{plugin_dir} if defined $self->{plugin_dir};

    my ($path) = __FILE__ =~ /^(.*\/[^\/\.]+)\..+$/;
    $self->{plugin_dir} = "${path}/Plugin/";

    return $self->{plugin_dir};
}

sub load_plugin {
    my $self = shift;

    my $plugin_dir = $self->plugin_dir;
    return unless -d $plugin_dir;

    $self->_load_plugin($plugin_dir);

warn Dumper $self->{plugins};
}

sub _load_plugin {
    my $self       = shift;
    my $plugin_dir = shift;

    my $base_dir     = BASE_DIR;
    my $package_name = $plugin_dir;
    $package_name    =~ s/^${base_dir}//;
    $package_name    =~ s/\/+/::/g;
    $package_name .= '::' if $package_name !~ /::$/;

    opendir my $dir, $plugin_dir
        or confess "can't open dir ${plugin_dir}";

    while (my $path = readdir $dir) {
        next if $path =~ /^\.+$/;

        if (-d "${plugin_dir}/${path}") {
            $self->_load_plugin("${plugin_dir}/${path}");
            next;
        }

        my ($plugin) = $path =~ /^([^\.]+)/;
        push @{$self->{plugins}}, "${package_name}${plugin}";
    }

    closedir $dir;
}


1; # end of this class
