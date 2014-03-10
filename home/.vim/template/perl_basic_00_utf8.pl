#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

__END__

=encoding utf-8

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

=head1 SEE ALSO

L<perlpod>, L<perldoc>, L<Pod::Parser>.

=head1 AUTHOR

My Name, C<< <user@example.com> >>

=cut
