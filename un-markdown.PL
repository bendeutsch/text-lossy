#!/usr/bin/perl

use File::Copy qw( copy );

my $goal = $ARGV[0];
my $source = $goal . '.md';
copy ($source, $goal) or die "Copy to $goal failed: $!";
