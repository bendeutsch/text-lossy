package Text::Lossy;

use strict;
use warnings;
use utf8;

# TODO:
# in-place vs. copy (context)
# linewise versions (parameters: is_start, is_end)

sub lower {
    my ($text) = @_;
    return lc($text);
}

sub whitespace {
    my ($text) = @_;
    $text =~ s{ \s+ }{ }xmsgu;
    $text =~ s{ \A \s+ }{}xmsgu;
    $text =~ s{ \s+ \z}{}xmsgu;
    return $text;
}

sub punctuation {
    my ($text) = @_;
    $text =~ s{ \p{Punctuation} }{}xmsgu;
    return $text;
}

sub unidecode {
    # TODO!
}

sub normalize {
    # TODO!
}

sub alphabetize {
    # TODO!
}

1;
