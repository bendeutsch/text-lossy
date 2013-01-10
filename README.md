Text::Lossy
===========

This is a Perl 5 module which implements lossy text compression. Specifically, it implements the "lossy" part to
transform any text to a form which is better compressible by standard entropy-based compression algorithms.

Several different lossy text filters are supplied.

Is this a joke?
---------------

No, it's serious. Well, ok, barely serious – I can't really see this being used "in production", but it does what it says
on the wrapper. Every available filter preserves at least some of the readability and comprehensibility of the text.

But the text stays the same length!
-----------------------------------

This module only supplies the entropy reduction via lossy transformation of the text. This text is meant to be further
processed by a lossless compression, e.g. gzip, 7zip or similar.
