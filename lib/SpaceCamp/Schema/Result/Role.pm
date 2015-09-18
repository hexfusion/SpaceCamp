use utf8;

package SpaceCamp::Schema::Result::Role;

=head1 NAME

SpaceCamp::Schema::Result::Role

=cut

use SpaceCamp::Schema::Candy;

=head1 ACCESSORS

=head2 roles_id

Primary key.

=cut

primary_column roles_id => {
    data_type         => "integer",
    is_auto_increment => 1,
    sequence          => "roles_roles_id_seq",
};

=head2 name

Role name, e.g.: spacecamp.

Unique constraint.

=cut

unique_column name => { data_type => "varchar", size => 32 };

=head2 label

Label, e.g.: SpaceCamp base user.

=cut

column label => { data_type => "varchar", size => 255 };

=head2 description

Description, e.g.: SpaceCamp user where app is installed.

=cut

column description => { data_type => "text" };

=head1 RELATIONS

=head2 permissions

Type: has_many

Related object: L<SpaceCamp::Schema::Result::Permission>

=cut

has_many
  permissions => "SpaceCamp::Schema::Result::Permission",
  "roles_id",
  { cascade_copy => 0, cascade_delete => 0 };

=head2 user_roles

Type: has_many

Related object: L<SpaceCamp::Schema::Result::UserRole>

=cut

has_many
  user_roles => "SpaceCamp::Schema::Result::UserRole",
  "roles_id",
  { cascade_copy => 0, cascade_delete => 0 };

=head2 users

Type: many_to_many

Composing rels: L</user_roles> -> user

=cut

many_to_many users => "user_roles", "user";

1;
