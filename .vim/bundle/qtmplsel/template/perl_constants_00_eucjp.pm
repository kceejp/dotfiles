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

=head1 名前

podsample - POD文書のサンプル

=head1 概要

    $here->isa(Piece::Of::Code);
    print <<"END";
    このインデントされたブロックはフォーマットされた
    コードか指示のため、走査されずに、スペースは保持
    されるでしょう。
    END

=head1 記述

これは標準テキストです。これはB<ボールド>、I<イタリック>、
U<アンダーライン>、C<$リテラルコード>のテキスト書式を
内部に含んでいます。

=head2 例の一覧

=over 4

=item * これは正丸リストです。

=item * ここに別口があります。

=back

=begin html

<img src="Example.png" align="right" alt="範例" />
<p>
    ここに、何らかの埋め込まれたHTMLがあります。
    このブロックでは、画像を入れたり、
    <span style="color: green">スタイル</span>を
    適用するか、HTMLで記述しています。PODパーサは
    HTML出力中にそれを完全に無視することはありません。
</p>

=end html

=head1 参照

L<perlpod>, L<perldoc>, L<Pod::Parser>.

=head1 著作権

Copyright 2005 J. Random Hacker <jrh@cpan.org>.

Permission is granted to copy, distribute and/or modify this 
document under the terms of the GNU Free Documentation 
License, Version 1.2 or any later version published by the 
Free Software Foundation; with no Invariant Sections, with 
no Front-Cover Texts, and with no Back-Cover Texts.

=cut
