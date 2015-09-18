package SpaceCamp::Schema::Populate::User;

=head1 NAME

SpaceCamp::Schema::Populate::User

=head1 DESCRIPTION

This module provides population capabilities for the User result class

=cut

use strict;
use warnings;

use Moo;

=head1 METHODS

=head2 records

Returns array reference containing one hash reference per user ready to use with populate schema method. Default users are:

=over

=item * spacecamp

User where SpaceCamp is installed.

=cut

sub records {
    return [
        {
            username    => "spacecamp",
        },
    ];
}

1;
