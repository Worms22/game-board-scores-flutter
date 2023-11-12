## network

This package responsibility is to hold any thing related the networking e.g:
getting info about the device connectivity, offering a custom reusable http client methods ect.

### connectivity_info

The responsible interface off getting information about the device connectivity status.

### http_client

The adapter interface, this allows us to adapt the http client which can be the standard dart http
or dio, or http package etc. It doesn't matter because we'll have Custom client which allows us to
switch dependencies on the fly. Off coerce we're reducing the coupling with the external libraries.

simple use case: imagine that dio change a parameter name or even the method name, you'll find your
self modifying all remote_data_sources.
