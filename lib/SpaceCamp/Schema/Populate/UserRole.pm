package SpaceCamp::Schema::Populate::UserRole;

=head1 NAME

SpaceCamp::Schema::Populate::UserRole

=head1 DESCRIPTION

This module provides population capabilities for the UserRole result class

=cut

use strict;
use warnings;

use Moo;

=head1 METHODS

=head2 records

Returns array reference containing one hash reference per user_role ready to use with populate schema method. Default user_roles are:

=over

=item * spacecamp, base

=cut

sub records {
    return [
        {
            users_id    => 1,
            roles_id    => 3
        },
    ];
}

1;
