use strict;
use warnings;
use feature qw(unicode_strings);
use utf8;
use open 'IO' => ':utf8';
use open ':std';

use Test::More;

use Text::Lossy;

is(Text::Lossy::punctuation('Hello, World!'), 'Hello World', "ASCII punctuation removed");
is(Text::Lossy::punctuation("Hello\x{2042} World\x{ff1f}"), "Hello World", "non-ASCII punctuation removed");
is(Text::Lossy::punctuation("Hello World\x{2605}"), "Hello World\x{2605}", "non-punctuation stays");

done_testing();
