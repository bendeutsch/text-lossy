package Text::Lossy;

use 5.006;
use strict;
use warnings;
use utf8;

=head1 NAME

Text::Lossy - Lossy text compression

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

    use Text::Lossy;

    my $foo = Text::Lossy->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

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

sub alphabetize {
    my ($text) = @_;
    $text =~ s{ \b (\p{Alpha}) (\p{Alpha}+) (\p{Alpha})}{ $1 . join('', sort split(//,$2)) . $3 }xmsegu;
    return $text;
}

sub unidecode {
    # TODO!
}

sub normalize {
    # TODO!
}

=head1 AUTHOR

Ben Deutsch, C<< <ben at bendeutsch.de> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-text-lossy at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Text-Lossy>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Text::Lossy


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Text-Lossy>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Text-Lossy>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Text-Lossy>

=item * Search CPAN

L<http://search.cpan.org/dist/Text-Lossy/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2012 Ben Deutsch.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Text::Lossy
