package SpaceCamp::Schema::Populate::Role;

=head1 NAME

SpaceCamp::Schema::Populate::Role

=head1 DESCRIPTION

This module provides population capabilities for the Role result class

=cut

use strict;
use warnings;

use Moo;

=head1 METHODS

=head2 records

Returns array reference containing one hash reference per role ready to use with populate schema method. Initial roles are:

=over

=item * admin

administrator with full permissions.

=item * user

All non-anonymous users have this role.

=back

=item * base

The user where the Space camp is installed.

=back

=cut

sub records {
    return [
        {
            name        => "admin",
            label       => "Admin",
            description => "Spacecamp administrator with full permissions",
        },
        {
            name        => "user",
            label       => "User",
            description => "All users have this role",
        },
        {
            name        => "base",
            label       => "Base",
            description => "The user where the SpaceCamp is installed has this role",
        },
    ];
}

1;
