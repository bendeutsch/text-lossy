use strict;
use warnings;
use utf8;

use Test::More;

use Text::Lossy;

my $lossy = Text::Lossy->new;

is($lossy->process('Unchanged  text...'), 'Unchanged  text...', "Empty object does nothing");

$lossy->add('lower');
is($lossy->process('Unchanged  text...'), 'unchanged  text...', "Added one filter");

$lossy->add('punctuation', 'whitespace');
is($lossy->process('Unchanged  text...'), 'unchanged text', "Added two more filters");

$lossy = Text::Lossy->new;

$lossy->add('punctuation')->add('whitespace');
is($lossy->process('Unchanged  text...'), 'Unchanged text', "Added two filters with chaining");

$lossy = Text::Lossy->new;
$lossy->add('lower', 'lower', 'lower');
is($lossy->process('Unchanged  text...'), 'unchanged  text...', "Added one filter three times");
is(scalar(@{$lossy->{filters}}), 3, "Counts three filters");

done_testing();
