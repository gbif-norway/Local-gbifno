# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;
use utf8;

use Test::More tests => 14;
BEGIN { use_ok('Local::gbifno') };
BEGIN { use_ok('Local::gbifno::latlon') };
BEGIN { use_ok('Local::gbifno::mgrs') };
BEGIN { use_ok('Local::gbifno::utm') };

my $gzd = Local::gbifno::mgrs::zone("JH3232");
ok($gzd eq "32V");

my ($mgrs, $d, @boz) = Local::gbifno::mgrs::parse("JH 320 320");
ok($mgrs eq "32VJH3205032050");
ok($d == 71);

($mgrs, $d, @boz) = Local::gbifno::mgrs::parse("WQ-JH 17-22 11-16");
ok($mgrs eq "33WWQ2000014000");
ok($d == 4243);

my ($lat, $lon) = Local::gbifno::latlon::parsedec("32.3214°E 84.231°S");
ok($lat eq "-84.231");
ok($lon eq "32.3214");

($lat, $lon) = Local::gbifno::latlon::parsedeg("42° 4' 18\"E 12° 9' 1\"");
ok($lat eq "12.1502777777778");
ok($lon eq "42.0716666666667");

my $utm = Local::gbifno::utm::parse("UTM: 32V 630084 4833438");
ok($utm eq "32V 630084 4833438");

