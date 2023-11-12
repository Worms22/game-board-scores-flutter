### Api

This package responsible of every thing related to the APIs except handling calls.

#### Handling Calls

Or in other words the methods which handle action to the server based on user action e.g:
getting all users, deleting a certain user ect. Never put those here under API package they have to
be in there dedicated feature under the {feature_name}/data/data_source