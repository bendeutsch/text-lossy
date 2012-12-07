#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

BEGIN {
    require_ok('Text::Lossy');
}

for my $sub (qw(
    lower
    whitespace
    punctuation
)) {
    can_ok('Text::Lossy', $sub);
}

done_testing();
