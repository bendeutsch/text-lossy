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

    my $lossy = Text::Lossy->new;
    $lossy->whitespace;
    my $short = $lossy->filter($long);

    my $lossy = Text::Lossy->new->lower->punctuation;  # Chaining usage

    $lossy->filter($long); # In place
    $lossy->filter();      # Filters $_ in place

=head1 DESCRIPTION

=cut

our %filtermap;

=head1 CONSTRUCTORS

=head2 new

The constructor for a new lossy text compressor. The constructor is quite 
light-weight; the only purpose of a compressor object is to accept and remember
a sequence of filters to apply to text.

=cut

sub new {
    my $class = shift;
    my $self = {
        filters => [],
    };
    return bless $self, $class;
}

=head1 METHODS

=head2 filter

=cut

sub filter {
    my ($self, $text) = @_;
    foreach my $f (@{$self->{'filters'}}) {
        $text = $f->($text);
    }
    return $text;
}

=head2 add_filters

=cut

sub add_filters {
    my ($self, @filters) = @_;
    foreach my $name (@filters) {
        my $code = $filtermap{$name};
        next unless $code; # a warning might be nice at this point...
        push @{$self->{'filters'}}, $code;
    }
}

=head2 as_coderef

=cut

sub as_coderef {
    my ($self) = @_;
    return sub {
        return $self->filter(@_);
    }
}

=head1 FUNCTIONS

=head2 register_filters

=cut

%filtermap = (
    'lower' => \&_lower,
    'whitespace' => \&_whitespace,
    'punctuation' => \&_punctuation,
    'alphabetize' => \&_alphabetize,
);

sub register_filters {
    my ($class, %mapping) = @_;
    foreach my $name (keys %mapping) {
        $filtermap{$name} = $mapping{$name};
    }
    return;
}

=head1 FILTERS

The following filters are defined by this module. Other modules may define
more filters.

Each of these filters can be added to the set via the L</add_filter> method,
or by using its name as an object method on the filtering object,
i.e. C<< $lossy->lower >>.

=head2 lower

Corresponds exactly to the L<lc|perlfun/lc> builtin in Perl, up
to and including its Unicode handling.

=cut

sub lower {
    my ($self) = @_;
    $self->add_filters('lower');
    return $self;
}

sub _lower {
    my ($text) = @_;
    return lc($text);
}

=head2 whitespace

Collapses any whitespace (C<\s> in regular expressions) to a single space, C<U+0020>.
Whitespace at the beginning and end of the text is stripped; you may need to add some
to account for line continuations or a new line marker at the end.

=cut

sub whitespace {
    my ($self) = @_;
    $self->add_filters('whitespace');
    return $self;
}

sub _whitespace {
    my ($text) = @_;
    $text =~ s{ \s+ }{ }xmsgu;
    $text =~ s{ \A \s+ }{}xmsgu;
    $text =~ s{ \s+ \z}{}xmsgu;
    return $text;
}

=head2 punctuation

Strips punctuation, that is anything matching C<\p{Punctuation}>. It is replaced by
nothing, removing it completely.

=cut

sub punctuation {
    my ($self) = @_;
    $self->add_filters('punctuation');
    return $self;
}

sub _punctuation {
    my ($text) = @_;
    $text =~ s{ \p{Punctuation} }{}xmsgu;
    return $text;
}

=head2 alphabetize

Leaves the first and last letters of a word alone, but replaces the interior letters with
the same set, sorted by the L<perlfun:sort|sort> function. This is done on the observation
(source uncertain at the time) that words can still be made out if the letters are present, but
in a different order, as long as the outer ones remain the same.

This filter may not work as proposed with every language or writing system. Specifically, it
uses end-of-word matches C<\b> to determine which letters to leave alone.

=cut

sub alphabetize {
    my ($self) = @_;
    $self->add_filters('alphabetize');
    return $self;
}
sub _alphabetize {
    my ($text) = @_;
    $text =~ s{ \b (\p{Alpha}) (\p{Alpha}+) (\p{Alpha}) \b }{ $1 . join('', sort split(//,$2)) . $3 }xmsegu;
    return $text;
}

# TODO:
# - unidecode (separate module)
# - normalize (separate module)

=head1 EXPORT

Nothing exported or exportable; use the OO interface instead.

=head1 AUTHOR

Ben Deutsch, C<< <ben at bendeutsch.de> >>

=head1 BUGS

None known so far.

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
