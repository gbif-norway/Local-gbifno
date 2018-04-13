use 5.024003;
use ExtUtils::MakeMaker;
WriteMakefile(
  NAME              => 'Local::gbifno',
  VERSION_FROM      => 'lib/Local/gbifno.pm',
  PREREQ_PM         => { 'Geo::Proj4' => 0.11,'Geo::Coordinates::UTM' => 0.11},
  ABSTRACT_FROM     => 'lib/Local/gbifno.pm',
  AUTHOR            => 'umeldt <chris@svindseth.jp>',
  LICENSE           => 'perl',
);
