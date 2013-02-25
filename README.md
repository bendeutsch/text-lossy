Text::Lossy
===========

This is a Perl 5 module which implements lossy text compression.
Specifically, it implements the "lossy" part to transform any text to a
form which is better compressible by standard entropy-based compression
algorithms.

Several different lossy text filters are supplied.

Is this a joke?
---------------

No, it's serious. Well, ok, partially serious – I can't really see this
being used "in production", but it does what it says on the wrapper.
Every available filter preserves at least some of the readability and
comprehensibility of the text.

But the text stays the same length!
-----------------------------------

This module only supplies the entropy reduction via lossy transformation
of the text. This text is meant to be further processed by a lossless
compression, e.g. gzip, 7zip or similar.

INSTALLATION
------------

This distribution uses `ExtUtils::MakeMaker` for building and installation.
Refer to the included `README` for detailed installation procedures.

SUPPORT AND DOCUMENTATION
-------------------------

The main documentation for the module is the POD included in `Text::Lossy`:

    perldoc Text::Lossy

Issues with development, including suggestions and pull requests, should
be handled through github.

You can also look for information at:

    RT, CPAN's request tracker (report bugs here)
        http://rt.cpan.org/NoAuth/Bugs.html?Dist=Text-Lossy

and the included `README` file.


LICENSE AND COPYRIGHT
---------------------

Copyright (C) 2012-2013 Ben Deutsch

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

