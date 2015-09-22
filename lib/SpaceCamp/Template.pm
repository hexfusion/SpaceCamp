package Space::Template;

use Moo;

=head1 NAME

Space::Template

=head1 DESCRIPTION

This module provides Space the ability to
define template files

=head1 SYNOPSIS

=cut

=head1 Attributes

=head2 token_hash

Returns the hash of template tokens

=cut

has token_hash => (
    is => 'ro',
    required => 1
);

=head2 source_path

Returns template source

=cut

has source_path => (
    is       => 'ro',
    required => 1
);

=head2 target_path

Returns template target_path

=cut

has target_path => (
    is       => 'ro',
    required => 1
);

=head2 mode

Returns the file permission of the source file

=cut

has mode => (
    is => 'ro',
    is => 'lazy'
);

sub _build_mode {
    my $self = shift;
    return ( stat( $self->source_path ) )[2];
}

1;
