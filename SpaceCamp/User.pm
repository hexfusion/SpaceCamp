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

1;
