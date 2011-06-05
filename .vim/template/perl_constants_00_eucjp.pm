package Sample;

use strict;
use warnings;

use base qw/Exporter/;

=encoding euc-jp

=head1 NAME

podsample - A sample pod document

=head1 SYNOPSIS

  $here->isa(Piece::Of::Code);
  print <<"END";
  This indented block will not be scanned for formatting
  codes or directives, and spacing will be preserved.
  END

=head1 DESCRIPTION

Here's some normal text.  It includes text that is
B<bolded>, I<italicized>, U<underlined>, and
C<$code>-formatted.

=cut
my $CONSTANTS;

BEGIN {
    $CONSTANTS = +{
    };
}

use constant $CONSTANTS;

our @EXPORT_OK = keys %{ $CONSTANTS };
our @EXPORT    = @EXPORT_OK;

1;
__END__

=head1 SEE ALSO

L<perlpod>, L<perldoc>, L<Pod::Parser>.

=head1 AUTHOR

My Name, C<< <user@example.com> >>

=cut
