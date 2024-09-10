#!/usr/bin/env perl

use strict;
use warnings;
use v5.14;

use LWP::UserAgent;
use JSON;

use lib qw( lib );

use Action qw(makeRequest);

my $GITHUB_TOKEN=$ENV{'GITHUB_TOKEN'};
my $repo=$ENV{'GITHUB_REPOSITORY'};
my $artifact_name = $ENV{'ARTIFACT_NAME'};
my $ua = LWP::UserAgent->new();
my $url = "https://api.github.com/repos/$repo/actions/artifacts?name=$artifact_name";
my $request = makeRequest($url, $GITHUB_TOKEN );

my $response;

eval { $response = decode_json( $ua->request($request)->decoded_content ) } || die "Can't decode $!";
my $download_url = $response->{'artifacts'}->[0]->{'archive_download_url'};

my $artifact_request = makeRequest($download_url, $GITHUB_TOKEN );
$ua->max_redirect(0);
eval { $response = $ua->request( $artifact_request ) } || die "Can't download $download_url: $!";

my $actual_download_url = $response->header('Location');

my @args = ("curl", "-o", "file.zip", $actual_download_url );
system(@args) == 0 or die "system @args failed: $?";
system('unzip', 'file.zip');




