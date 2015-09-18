use utf8;

package SpaceCamp::Schema::Result::Camp;

=head1 NAME

SpaceCamp::Schema::Result::Camp

=cut

use SpaceCamp::Schema::Candy -components =>
  [qw(InflateColumn::DateTime TimeStamp)];

=head1 DESCRIPTION

=head1 ACCESSORS

=head2 camps_id

Primary key.

=cut

primary_column camps_id => {
    data_type         => "integer",
    is_auto_increment => 1,
    sequence          => "camps_camps_id_seq",
};

=head2 description

=cut

column description => {
    data_type     => "varchar",
    default_value => "",
    size          => 255,
};

=head2 users_id

Foreign key constraint on L<SpaceCamp::Schema::Result::User/users_id>
via L</user> relationship.

=cut

column users_id => {
    data_type      => "integer",
    is_foreign_key => 1,
    is_nullable    => 1,
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

=head1 RELATIONS

=head2 user

Type: belongs_to

Related object: L<SpaceCamp::Schema::Result::User>

=cut

belongs_to
  user => "SpaceCamp::Schema::Result::User",
  { users_id => "users_id" },
  {
    is_deferrable => 1,
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
    join_type     => "left"
  };

1;
