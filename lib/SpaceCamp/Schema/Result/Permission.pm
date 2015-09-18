use utf8;

package SpaceCamp::Schema::Result::Permission;

=head1 NAME

SpaceCamp::Schema::Result::Permission

=cut

use SpaceCamp::Schema::Candy;

=head1 ACCESSORS

=head2 permissions_id

Primary key.

=cut

primary_column permissions_id => {
    data_type         => "integer",
    is_auto_increment => 1,
    sequence          => "permissions_id_seq"
};

=head2 roles_id

FK on L<SpaceCamp::Schema::Result::Role/roles_id>.

=cut

column roles_id =>
  { data_type => "integer", is_foreign_key => 1 };

=head2 perm

Permission name.

=cut

column perm => {
    data_type     => "varchar",
    size          => 255
};

=head1 RELATIONS

=head2 role

Type: belongs_to

Related object: L<SpaceCamp::Schema::Result::Role>

=cut

belongs_to
  role => "SpaceCamp::Schema::Result::Role",
  "roles_id",
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" };

1;
