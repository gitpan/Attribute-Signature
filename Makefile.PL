use 5.006;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile1(
    'NAME'		=> 'Attribute::Signature',
    'VERSION_FROM'	=> 'lib/Attribute/Signature.pm', # finds $VERSION
    'PREREQ_PM'		=> {
			    Attribute::Handlers => 0.70,
			    Scalar::Util        => 0.01,
			   }, # e.g., Module::Name => 1.1
    #'LIBS'		=> [''], # e.g., '-lm'
    #'DEFINE'		=> '', # e.g., '-DHAVE_SOMETHING'
    #'INC'		=> '', # e.g., '-I/usr/include/other'
    MIN_PERL_VERSION => '5.006',
    BUILD_REQUIRES => {
			    Test::More => 0,
    },
    LICENSE             => 'perl',
    META_MERGE => {
        resources => {
            repository => 'http://github.com/chorny/Attribute-Signature',
            'Repository-clone' => 'git://github.com/chorny/Attribute-Signature.git',
        },
    },
);

sub WriteMakefile1 {  #Written by Alexandr Ciornii, version 0.21. Added by eumm-upgrade.
    my %params=@_;
    my $eumm_version=$ExtUtils::MakeMaker::VERSION;
    $eumm_version=eval $eumm_version;
    die "EXTRA_META is deprecated" if exists $params{EXTRA_META};
    die "License not specified" if not exists $params{LICENSE};
    if ($params{BUILD_REQUIRES} and $eumm_version < 6.5503) {
        #EUMM 6.5502 has problems with BUILD_REQUIRES
        $params{PREREQ_PM}={ %{$params{PREREQ_PM} || {}} , %{$params{BUILD_REQUIRES}} };
        delete $params{BUILD_REQUIRES};
    }
    delete $params{CONFIGURE_REQUIRES} if $eumm_version < 6.52;
    delete $params{MIN_PERL_VERSION} if $eumm_version < 6.48;
    delete $params{META_MERGE} if $eumm_version < 6.46;
    delete $params{META_ADD} if $eumm_version < 6.46;
    delete $params{LICENSE} if $eumm_version < 6.31;
    delete $params{AUTHOR} if $] < 5.005;
    delete $params{ABSTRACT_FROM} if $] < 5.005;
    delete $params{BINARY_LOCATION} if $] < 5.005;

    WriteMakefile(%params);
}

