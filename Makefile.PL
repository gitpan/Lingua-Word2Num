
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Wrapper for text to number conversion modules of various languages in the Lingua::XXX hierarchy.",
  "AUTHOR" => "PetaMem s.r.o. <info\@petamem.com>",
  "BUILD_REQUIRES" => {
    "Test::More" => 0,
    "utf8" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Lingua-Word2Num",
  "EXE_FILES" => [],
  "LICENSE" => "open_source",
  "NAME" => "Lingua::Word2Num",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Lingua::AFR::Word2Num" => 0,
    "Lingua::CES::Word2Num" => 0,
    "Lingua::DEU::Word2Num" => 0,
    "Lingua::ENG::Word2Num" => 0,
    "Lingua::EUS::Word2Num" => 0,
    "Lingua::FRA::Word2Num" => 0,
    "Lingua::IND::Words2Nums" => 0,
    "Lingua::ITA::Word2Num" => 0,
    "Lingua::JPN::Word2Num" => 0,
    "Lingua::NLD::Word2Num" => 0,
    "Lingua::NOR::Word2Num" => 0,
    "Lingua::POL::Word2Num" => 0,
    "Lingua::POR::Words2Nums" => 0,
    "Lingua::RUS::Word2Num" => 0,
    "Lingua::SPA::Word2Num" => 0,
    "Lingua::SWE::Word2Num" => 0,
    "Lingua::ZHO::Word2Num" => 0,
    "Perl6::Export::Attrs" => 0,
    "Readonly" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.0477",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



