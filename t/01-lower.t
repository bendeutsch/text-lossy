use strict;
use warnings;
use utf8;

use Test::More;

use Text::Lossy;

# ascii
is(Text::Lossy::lower('Hello, World!'), 'hello, world!', "ASCII lowercase");
is(Text::Lossy::lower('hello, world!'), 'hello, world!', "No change on already lower");

# latin1
is(Text::Lossy::lower('TÜR schließen'), 'tür schließen', "Latin1 one");
is(Text::Lossy::lower('FRÊRE ÇA JALAPEÑO'), 'frêre ça jalapeño', "Latin1 two");

# Greek
is(Text::Lossy::lower('ΑΒΓΔ'), 'αβγδ', "Greek");

# Kyrillic
is(Text::Lossy::lower('АБДЖ'), 'абдж', "Cyrillic");

done_testing();
