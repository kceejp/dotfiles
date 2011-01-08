package Sample;

use strict;
use warnings;

use base qw/Exporter/;

my $constants;

BEGIN {
    $constants = {
    };
}

use constant $constants;

our @EXPORT_OK = keys %{ $constants };
our @EXPORT    = @EXPORT_OK;

1;
__END__

=encoding euc-jp

=head1 ̾��

podsample - PODʸ��Υ���ץ�

=head1 ����

    $here->isa(Piece::Of::Code);
    print <<"END";
    ���Υ���ǥ�Ȥ��줿�֥�å��ϥե����ޥåȤ��줿
    �����ɤ��ؼ��Τ��ᡢ�������줺�ˡ����ڡ������ݻ�
    �����Ǥ��礦��
    END

=head1 ����

�����ɸ��ƥ����ȤǤ��������B<�ܡ����>��I<������å�>��
U<��������饤��>��C<$��ƥ�륳����>�Υƥ����Ƚ񼰤�
�����˴ޤ�Ǥ��ޤ���

=head2 ��ΰ���

=over 4

=item * ��������ݥꥹ�ȤǤ���

=item * �������̸�������ޤ���

=back

=begin html

<img src="Example.png" align="right" alt="����" />
<p>
    �����ˡ����餫�������ޤ줿HTML������ޤ���
    ���Υ֥�å��Ǥϡ����������줿�ꡢ
    <span style="color: green">��������</span>��
    Ŭ�Ѥ��뤫��HTML�ǵ��Ҥ��Ƥ��ޤ���POD�ѡ�����
    HTML������ˤ��������̵�뤹�뤳�ȤϤ���ޤ���
</p>

=end html

=head1 ����

L<perlpod>, L<perldoc>, L<Pod::Parser>.

=head1 ���

Copyright 2005 J. Random Hacker <jrh@cpan.org>.

Permission is granted to copy, distribute and/or modify this 
document under the terms of the GNU Free Documentation 
License, Version 1.2 or any later version published by the 
Free Software Foundation; with no Invariant Sections, with 
no Front-Cover Texts, and with no Back-Cover Texts.

=cut
