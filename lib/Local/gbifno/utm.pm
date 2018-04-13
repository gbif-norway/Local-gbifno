use strict;
use warnings;
use utf8;

package Local::gbifno::utm;

sub parse {
  my $zone;
  local $_ = shift;
  s/^UTM-ref\.\s*\(WGS84\)\s*//;
  s/^\s+//; s/\s*$//; s/^UTM\:\s*//i; s/^UTM\(\),,\s*//i; s/^UTM\s*//i;
  s/^\(\s//; s/^\(\),$//; s/^[VW,]\s+//i;
  $zone = $1 if(s/^\((\d\d\w?)\)\s*//);
  $zone = $1 if(s/^(\d\d\s*\w?)\s+//);
  s/^,$//;

  my ($easting, $northing);
  if (/^$/) {
    return;
  } elsif(/^(\d+)[\s,]*(\d+)$/) {
    ($easting, $northing) = ($1, $2);
  } elsif(/^(\d+)[A-Z](\d+),(\d+)$/) {
    ($zone, $easting, $northing) = ($1, $2, $3);
  } elsif(/^[A-Z]\s*(\d+),(\d+)/) {
    ($easting, $northing) = ($1, $2);
  } elsif(/^([\d-]+)[\s,]*([\d-]+)$/) {
    die "unable to handle utm coordinates ($_)";
    ($easting, $northing) = ($1, $2);
  } elsif(/^sone (\d+): N:?(\d+)[\s,]+[EØ]:?(\d+)/i) {
    ($zone, $northing, $easting) = ($1, $2, $3);
  } else {
    die "unable to parse utm coordinates ($_)";
  }

  if($zone && $easting && $northing) {
    return "$zone $easting $northing";
  }
}

1;

