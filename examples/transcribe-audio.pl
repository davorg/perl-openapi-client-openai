#!/usr/bin/env perl

use strict;
use warnings;
use lib 'lib';
use OpenAPI::Client::OpenAI;
use Data::Dumper;
use JSON::XS qw( decode_json );
use Feature::Compat::Try;

my $file = @ARGV ? shift : 'examples/data/speech.mp3';
unless ( -e $file ) {
    die "File not found: $file\n";
}
my $client   = OpenAPI::Client::OpenAI->new;
my $response = $client->createTranscription(
    {},
    file_upload => {
        file     => $file,
        model    => 'whisper-1',
        language => 'en',
    },
);

if ( $response->res->is_success ) {
    try {
        my $result = decode_json( $response->res->content->asset->slurp );
        print "Transcription: $result->{text}\n";
    } catch ($e) {
        print "Error decoding JSON: $e\n";
    }
} else {
    print Dumper( $response->res );
}

__END__

=head1 NAME

transcribe-audio.pl - Transcribe an audio file

=head1 SYNOPSIS

    perl transcribe-audio.pl [FILE]

=head1 DESCRIPTION

This script transcribes an audio file using the OpenAI API.o

At the present time, this example does not work, giving us the following error:

    "message": "Unrecognized file format. Supported formats: [\'flac\', \'m4a\', \'mp3\', \'mp4\', \'mpeg\', \'mpga\', \'oga\', \'ogg\', \'wav\', \'webm\']",

But this curl command does, so we assume it's a bug in the OpenAI client:

    curl https://api.openai.com/v1/audio/transcriptions \
      -H "Authorization: Bearer $OPENAI_API_KEY" \
      -H "Content-Type: multipart/form-data" \
      -F file="@./examples/data/speech.mp3" \
      -F model="whisper-1"
