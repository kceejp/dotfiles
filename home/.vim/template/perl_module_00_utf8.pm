package Sample;

use strict;
use warnings;
use utf8;

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

=cut

=head1 ACCESSORS

=over 4

=item $self->one

accessor one

=item $self->two

accessor two

=item $self->three

accessor three

=item $self->four

accessor four

=back

=cut
use base qw/Class::Accessor::Fast/;

__PACKAGE__->mk_accessors(qw/
    one
    two
    three
    four
/);

=head1 METHODS

=cut

=head2 method_one

this is method one

=cut
sub method_one { }

=head2 method_two

this is method two

=cut
sub method_two { }

1;
__END__

=head1 SEE ALSO

L<perlpod>, L<perldoc>, L<Pod::Parser>.

=head1 AUTHOR

My Name, C<< <user@example.com> >>

=cut
