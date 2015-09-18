use utf8;

package SpaceCamp::Schema::Result::User;

=head1 NAME

SpaceCamp::Schema::Result::User

=cut

use SpaceCamp::Schema::Candy -components =>
  [qw(EncodedColumn InflateColumn::DateTime TimeStamp)];

use DateTime;

=head1 ACCESSORS

=head2 users_id

Primary key.

=cut 

primary_column users_id => {
    data_type         => "integer",
    is_auto_increment => 1,
    sequence          => "users_users_id_seq",
};

=head2 username

The username is automatically converted to lowercase so
we make sure that the unique constraint on username works.

=cut

unique_column username => {
    data_type   => "varchar",
    size        => 255,
    accessor    => '_username',
};

sub username {
    my $self = shift;
    if ( @_ ) {
        my $value = shift;
        $value = check_username($value);
        $self->_username($value);
    }
    return $self->_username();
}

=head2 nickname

Unique nickname for user.

=cut

unique_column nickname => {
    data_type   => "varchar",
    is_nullable => 1,
    size        => 255,
};

=head2 email

email address.

=cut

column email => {
    data_type     => "varchar",
    default_value => "",
    size          => 255,
};

=head2 first_name

User's first name.

=cut

column first_name => {
    data_type     => "varchar",
    default_value => "",
    size          => 255,
};

=head2 last_name

User's last name.

=cut

column last_name => {
    data_type     => "varchar",
    default_value => "",
    size          => 255,
};

=head2 created

Date and time when this record was created returned as L<DateTime> object.
Value is auto-set on insert.

=cut

column created => {
    data_type     => "datetime",
    set_on_create => 1,
};

=head2 last_modified

Date and time when this record was last modified returned as L<DateTime> object.
Value is auto-set on insert and update.

=cut

column last_modified => {
    data_type     => "datetime",
    set_on_create => 1,
    set_on_update => 1,
};

=head2 active

Is this user account active? Default is yes.

=cut

column active => {
    data_type     => "boolean",
    default_value => 1,
};

=head1 RELATIONS

=head2 camps

Type: has_many

Related object: L<SpaceCamp::Schema::Result::Camp>

=cut

has_many
  camps => "SpaceCamp::Schema::Result::Camp",
  "users_id",
  { cascade_copy => 0, cascade_delete => 0 };

sub name {
    my $self = shift;
    return join( " ", $self->first_name, $self->last_name );
}

=head1 METHODS

=head2 check_username( $username )

Die if C<$username> is undef or empty string. Otherwise return C<lc($username)>

=cut

sub check_username {
    my $value = shift;
    die "username cannot be undef" unless defined $value;
    $value =~ s/(^\s+|\s+$)//g;
    die "username cannot be empty string" if $value eq '';
    return lc($value);
}

1;
