use strict;

my @functions = qw(
    zmq_proxy
    zmq_device
);

my @DEFINES;
foreach my $func (@functions) {
    # run make has_$func. If it exits with 0 (success), then
    # func is there
    my $has_func = system("make", "has_$func") == 0;
    if ($has_func) {
        push @DEFINES, uc "-DHAS_$func";
    }

    print STDERR "your installation of zmq has $func...\n";
}

use Data::Dumper::Concise;
warn Dumper(\@DEFINES);