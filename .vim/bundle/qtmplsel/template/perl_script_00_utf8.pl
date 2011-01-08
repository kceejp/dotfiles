#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

use Getopt::Long;
use Pod::Usage;
use Time::HiRes;

# default values
my %options = (
    'man'  => 0,
    'help' => 0,
);

my $result = Getopt::Long::GetOptions(
    'man'    => \$options{'man' },
    'help|?' => \$options{'help'},
);

Pod::Usage::pod2usage(
    -verbose => 2, # print everything
    -exitval => 2, # fatal
) if not $result;

Pod::Usage::pod2usage(
    -verbose => 1, # print SYNOPSIS AND OPTIONS
    -exitval => 1, # abnormal
) if $options{'help'};

Pod::Usage::pod2usage(
    -verbose => 2,
    -exitval => 1,
) if $options{'man' };

my $start_time = Time::HiRes::time;

my $process_time = sprintf('%.2f', Time::HiRes::time - $start_time);

__END__

=encoding utf8

=head1 NAME

sample.pl - Sample

=head1 SYNOPSIS

sample.pl [options] [file ...]

  Options:
    -help       brief help message
    -man        full documentation

=head1 OPTIONS

=over 2

=item B<-help>

Print a brief help message and exits.

=item B<-man>

Prints the manual page and exits.

=back

=head1 DESCRIPTION

=cut
