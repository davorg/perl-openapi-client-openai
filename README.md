# NAME

OpenAPI::Client::OpenAI - A client for the OpenAI API

# SYNOPSIS

    use OpenAPI::Client::OpenAI;

    # The OPENAI_API_KEY environment variable must be set
    # See https://platform.openai.com/api-keys and ENVIRONMENT VARIABLES below
    my $client = OpenAPI::Client::OpenAI->new();

      my $tx = $client->create_completion(
          {
              body => {
                  model       => 'gpt-3.5-turbo-instruct',
                  prompt      => 'What is the capital of France?'
                  temperature => 0, # optional, between 0 and 1, with 0 being the least random
                  max_tokens  => 100, # optional, the maximum number of tokens to generate
              }
          }
      );

    my $response_data = $tx->res->json;

    print Dumper($response_data);

# DESCRIPTION

OpenAPI::Client::OpenAI is a client for the OpenAI API built on
top of [OpenAPI::Client](https://metacpan.org/pod/OpenAPI%3A%3AClient). This module automatically handles the API
key authentication according to the provided environment.

Note that the OpenAI API is a paid service. You will need to sign up for an
account.

# WARNING

Due to the extremely rapid development of OpenAI's API, this module may may
not be up-to-date with the latest changes. Further releases of this module may
break your code if OpenAI changes their API.

# METHODS

## Constructor

### new

    my $client = OpenAPI::Client::OpenAI->new( $specification, %options );

Create a new OpenAI API client. The following options can be provided:

- `$specification`

    The path to the OpenAPI specification file (YAML). Defaults to the
    "openai.yaml" file in the distribution's "share" directory.

    You can find the latest version of this file at
    [https://github.com/openai/openai-openapi](https://github.com/openai/openai-openapi).

Additional options are passed to the parent class, OpenAPI::Client, with the
exception of the following extra options:

Other methods are documented in [OpenAPI::Client::OpenAI::Methods](https://metacpan.org/pod/OpenAPI%3A%3AClient%3A%3AOpenAI%3A%3AMethods).

The schema is documented in [OpenAPI::Client::OpenAI::Schema](https://metacpan.org/pod/OpenAPI%3A%3AClient%3A%3AOpenAI%3A%3ASchema).

# ENVIRONMENT VARIABLES

The following environment variables are used by this module:

- OPENAI\_API\_KEY

    The API key used to authenticate requests to the OpenAI API.

# SEE ALSO

[OpenAPI::Client](https://metacpan.org/pod/OpenAPI%3A%3AClient) - the deprecated precursor to this module.

# AUTHOR

Nelson Ferraz, <nferraz@gmail.com>

# CONTRIBUTORS

- Curtis "Ovid" Poe, https://github.com/Ovid
- Veesh Goldman, https://github.com/rabbiveesh
- David Farrell,

# COPYRIGHT AND LICENSE

Copyright (C) 2023-2024 by Nelson Ferraz

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.0 or,
at your option, any later version of Perl 5 you may have available.
