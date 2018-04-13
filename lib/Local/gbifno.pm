package Local::gbifno;

use 5.024003;
use strict;
use warnings;

our $VERSION = '0.01';

1;

__END__

=head1 NAME

Local::gbifno - utility functions for parsing messy coordinates

=head1 DESCRIPTION

in a saner world, we wouldn't need this package at all, and a case could
be made that, say, simply rejecting mgrs strings without grid zone designators 
would make more sense than trying to guess based on the square identifiers.

this package used to be a lot "worse", but as data quality from our various
data sources has improved, i have been able to get rid of some of the weird
exceptions and handlers here. it's still a mess... and while it could probably
benefit from refactoring and better unit tests and all that, getting to a
place where we could just get rid of all of it would be even better!

=head1 AUTHOR

umeldt, E<lt>chris@svindseth.jptE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by umeldt

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.24.3 or,
at your option, any later version of Perl 5 you may have available.

=cut
