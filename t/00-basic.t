# -*- mode: cperl -*-

use strict;
use warnings;

use LWP::UserAgent;
use Test::More;

use lib qw( ../lib lib );
use Action;

die "To be run in CI" unless $ENV{'CI'};

my $token = $ENV{'GITHUB_TOKEN'}; # Run only in CI

my $ua = LWP::UserAgent->new();
my $request = makeRequest( "https://api.github.com/emojis", $token );

my $response = $ua->request($request);

is( $response->status, 200, "Request made correctly" );
