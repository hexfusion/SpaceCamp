use utf8;

package SpaceCamp::Schema;

=encoding utf8

=head1 NAME

SpaceCamp::Schema - Database Schema for SpaceCamp

=head1 VERSION

0.001

=cut

our $VERSION = '0.001';

use strict;
use warnings;

use base 'DBIx::Class::Schema::Config';

__PACKAGE__->load_components( 'Helper::Schema::DateTime',
    'Helper::Schema::QuoteNames', 'Schema::Config' );

__PACKAGE__->load_namespaces(
    default_resultset_class => 'ResultSet',
);

1;

__END__

