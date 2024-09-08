#!/usr/bin/env perl

use strict;
use warnings;
use v5.14;

use LWP::UserAgent;
use JSON;

my $GITHUB_TOKEN=$ENV{'GITHUB_TOKEN'};
my $repo=$ENV{'GITHUB_REPOSITORY'};
my $ua = LWP::UserAgent->new();
my $request = new HTTP::Request('GET' => "https://api.github.com/repos/$repo/actions/artifacts",
                                [
                                 'Authorization' => "Bearer $GITHUB_TOKEN",
                                 'Accept' =>  'application/vnd.github+json',
                                 'X-GitHub-Api-Version' => '2022-11-28'
                                ]);

my $response;

eval { $response = decode_json( $ua->request($request)->decoded_content ) } || die "Can't decode $!";

say %{$response->{'artifacts'}->[0]};
