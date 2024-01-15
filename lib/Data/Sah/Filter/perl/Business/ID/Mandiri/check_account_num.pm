package Data::Sah::Filter::perl::Business::ID::Mandiri::check_account_num;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

sub meta {
    +{
        v => 1,
        summary => 'Check that string is a well-formed Mandiri account number',
        description => <<'MARKDOWN',

Note that this does not check whether a well-formed 13 digit actually has an
associated account number. This does not contact a Mandiri API or online
database of any form.

MARKDOWN
        might_fail => 1,
    };
}

sub filter {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{modules}{"Business::ID::Mandiri"} //= 0;

    $res->{expr_filter} = join(
        "",
        "do { my \$tmp = $dt; my \$res = Business::ID::Mandiri::parse_mandiri_account(account => \$tmp); \$res->[0] == 200 ? [undef,\$tmp] : [\$res->[1], \$tmp] }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$

=head1 DESCRIPTION

=cut
