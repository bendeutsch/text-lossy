use strict;
use warnings;

use Test::More;

use Text::Lossy;

is(Text::Lossy::whitespace('Hello,   World!'), 'Hello, World!', "Multiple spaces collapsed");
is(Text::Lossy::whitespace('Hello, World!  '), 'Hello, World!', "Spaces at end removed");
is(Text::Lossy::whitespace('  Hello, World!'), 'Hello, World!', "Spaces at beginning removed");

is(Text::Lossy::whitespace(" \t Hello, \n\r\n World!\x{A0}\x{A0}"), 'Hello, World!', "Various whitespace removed");

is(Text::Lossy::whitespace("Hello, Wo\x{2060}rld!"), "Hello, Wo\x{2060}rld!", "Word Joiner left alone");

done_testing();
