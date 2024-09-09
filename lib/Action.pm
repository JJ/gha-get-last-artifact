package Action;

use HTTP::Request;

use parent Exporter;

use v5.14;

our @EXPORT_OK = qw(makeRequest);

sub makeRequest {
  my ($url,$token) = @_;
  return  new HTTP::Request('GET' => $url,
                                [
                                 'Authorization' => "Bearer $token",
                                 'Accept' =>  'application/vnd.github+json',
                                 'X-GitHub-Api-Version' => '2022-11-28'
                                ]);
}
