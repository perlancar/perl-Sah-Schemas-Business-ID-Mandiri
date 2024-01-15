package Sah::Schema::business::id::mandiri::account_num;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'Mandiri account number',
    prefilters => ['Str::remove_nondigit', 'Business::ID::Mandiri::check_account_num'],
    description => <<'MARKDOWN',

Note that this schema only accepts 13-digit regular account number and not
virtual account number.

MARKDOWN
    examples => [
        {value=>'', valid=>0, summary=>'Empty string'},
        {value=>'123', valid=>0, summary=>'Too short'},
        {value=>'006-00-1710201-7', valid=>1, validated_value=>'0060017102017'},
    ],
}];

1;

# ABSTRACT:
