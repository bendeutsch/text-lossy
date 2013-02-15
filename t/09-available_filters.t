use strict;
use warnings;
use utf8;

use Test::More;
use Test::Exception;

use Text::Lossy;

my $lossy;

# A factory for our new filters
sub all_digit {
    my ($digit) = @_;
    return sub {
        my ($text) = @_;
        $text =~ s{\d}{$digit}xmsg;
        return $text;
    }
}

is (scalar(keys %Text::Lossy::filtermap), 4, "Start with four filters");
is (join(', ',Text::Lossy->available_filters()), 'alphabetize, lower, punctuation, whitespace', "All four filters listed");

# Note: we need a code reference, and 'all_digit' gives us one!
Text::Lossy->register_filters( all_zero => all_digit(0) );
is (join(', ',Text::Lossy->available_filters()), 'all_zero, alphabetize, lower, punctuation, whitespace', "New filter listed");

Text::Lossy->register_filters( lower => undef );
is (join(', ',Text::Lossy->available_filters()), 'all_zero, alphabetize, punctuation, whitespace', "Removed filter not listed");

Text::Lossy->register_filters( all_zero => undef, alphabetize => undef, punctuation => undef, whitespace => undef );
is (join(', ',Text::Lossy->available_filters()), '', "Removed all filters, list is empty");

done_testing();
