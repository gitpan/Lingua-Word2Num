#!/usr/bin/perl
# For Emacs: -*- mode:cperl; mode:folding -*-
#
# Copyright (C) PetaMem, s.r.o. 2009-present
#

# {{{ use block

use strict;
use warnings;
use utf8;
use 5.10.0;

use Test::More;

# }}}
# {{{ variable declarations

my $tests;
my $known_langs = [qw(afr ces deu eng eus fra ind
                      ita jpn nld nor pol por rus spa swe zho)];

# }}}
# {{{ basic tests

BEGIN {
   use_ok('Lingua::Word2Num');
}

$tests++;

use Lingua::Word2Num     qw(:ALL);

# }}}
# {{{ preprocess_code

my $got      = Lingua::Word2Num::preprocess_code(undef,'ces');
my $expected = q{use Lingua::CES::Word2Num ();
$result = Lingua::CES::Word2Num::w2n($word);};

chomp $got;
is($got, $expected, 'code preprocessed for Czech');
$tests++;

$got      = Lingua::Word2Num::preprocess_code();
$expected = undef;
is($got, $expected, 'undef args');
$tests++;

$got      = Lingua::Word2Num::preprocess_code(undef, 'xx'),
$expected = undef;
is($got, $expected, 'nonexisting language');
$tests++;

# }}}
# {{{ known_langs

my $bak = known_langs();
is_deeply($bak, $known_langs, 'known langs');
$tests++;

# }}}
# {{{ cardinal

$got      = cardinal('ces', 'dvacet osm');
$expected = 28;
ok($got == $expected, '28 in Czech',);
$tests++;

$got      = cardinal('eng', 'twenty two millions twenty two');
$expected = 22_000_022;
ok($got == $expected, '22 000 022 in English');
$tests++;

$got      = cardinal(undef, 'five');
$expected = q{};
is($got, $expected, 'five in undef language');
$tests++;

$got      = cardinal();
$expected = q{};
is($got, $expected, 'undef args');
$tests++;

$got      =  cardinal('ces', 'xxxxxx');
$expected = q{};
is($got, $expected, 'out of range');
$tests++;

$got      = cardinal('*', 'dvacet osm');
$expected = 28;
ok($got == $expected, 'search in all languages');
$tests++;

$got      = cardinal('nor', 'tjue');
$expected = 20;
ok($got == $expected, '2O in Norwegian');
$tests++;

$got      = cardinal('pol', 'sześćset sześćdziesiąt sześć');
$expected = 666;
ok($got == $expected, '666 in Polish');
$tests++;


$got      = cardinal('eus', 'hirurogei');
$expected = 60;
ok($got == $expected, '60 in Basque');
$tests++;

# }}}

done_testing($tests);

__END__

