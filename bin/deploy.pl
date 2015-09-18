#!/usr/bin/env perl

package main;
use warnings;
use strict;
use FindBin;
use lib "$FindBin::Bin/../lib";

use SpaceCamp::Schema;

my $schema = SpaceCamp::Schema->connect('space');

$schema->deploy({add_drop_table => 1});
