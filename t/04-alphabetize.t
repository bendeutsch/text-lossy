use strict;
use warnings;
use feature qw(unicode_strings);
use utf8;
use open 'IO' => ':utf8';
use open ':std';

use Test::More;

use Text::Lossy;

is(Text::Lossy::alphabetize('Hello, World!'), 'Hello, Wlord!', "Internally sorted");
is(Text::Lossy::alphabetize('alphabetization'), 'aaabehiilopttzn', "Long word internally sorted");
is(Text::Lossy::alphabetize("!!::..::!! \t\t\r\n 162534"), "!!::..::!! \t\t\r\n 162534", "Whitespace, punctuation and numbers unaffected");
is(Text::Lossy::alphabetize("drüben señor"), "dberün seoñr", "Unicode sorting");
is(Text::Lossy::alphabetize("こんにちは"), "こちにんは", "More unicode sorting");

done_testing();
