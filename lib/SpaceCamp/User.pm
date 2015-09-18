package SpaceCamp::User;

use Moo;

=head1 NAME

SpaceCamp::User

=head1 DESCRIPTION

This module provides SpaceCamp user data

=head1 SYNOPSIS

=cut

=head1 Attributes

=head2 name

Returns attribute name

=cut

has name => (
    is => 'ro',
    is => 'lazy'
);

sub _build_name {
    my ($self) = @_;
    my $name = $ENV{LOGNAME} || $ENV{USER} || getpwuid($<);

    my $user = $self->schema->resultset('User')->find({ username => $name });

    die "User $name is not a valid SpaceCamp user; aborting!\n"
        unless $user;

    return $name;
}

=head2 dir

Returns attribute name

=cut

has dir => (
    is => 'ro',
    is => 'lazy'
);

sub _build_dir {
   my ($self) = @_;
   return (getpwnam $self->name)[7];
}

=head2 schema

Returns SpaceCamp schema

=cut

has schema => (
    is => 'ro',
    required => 1
);

1;
