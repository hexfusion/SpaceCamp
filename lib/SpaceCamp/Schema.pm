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

=head1 METHODS

=head2 deploy

Overload L<DBIx::Class::Schema/deploy> in order to add some core fixtures
via the following classes:

=over

=item * SpaceCamp::Schema::Populate::Role

=item * SpaceCamp::Schema::Populate::User

=item * SpaceCamp::Schema::Populate::UserRole

=back

=cut

{
    use SpaceCamp::Schema::Populate::Role;
    use SpaceCamp::Schema::Populate::User;
    use SpaceCamp::Schema::Populate::UserRole;

    sub deploy {
        my $self = shift;
        my $new  = $self->next::method(@_);

        my $pop_role =
          SpaceCamp::Schema::Populate::Role->new->records;
        $self->resultset('Role')->populate($pop_role)
          or die "Failed to populate Role";

        my $pop_user =
          SpaceCamp::Schema::Populate::User->new->records;
        $self->resultset('User')->populate($pop_user)
          or die "Failed to populate User";

        my $pop_user_role =
          SpaceCamp::Schema::Populate::UserRole->new->records;
        $self->resultset('UserRole')->populate($pop_user_role)
          or die "Failed to populate UseRole";
    }
}

1;

__END__

