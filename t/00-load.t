#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

BEGIN {
    require_ok('Text::Lossy');
}

diag( "Testing Text::Lossy $Text::Lossy::VERSION, Perl $], $^X" );

for my $sub (qw(
    new
    filter
    add_filters
    as_coderef

    register_filters
)) {
    can_ok('Text::Lossy', $sub);
}

done_testing();
