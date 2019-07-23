# Anansi

A simple Sinatra server that will return a random http status

## Usage

Run `./run` to start the server. You can then access the server at `http://localhost:4567/crm`

You can specify the probability of success by providing a query params
```shell
# This will return HTTP status 200 with 80% probability
curl -i http://localhost:4567/crm/80
```

If no query params are specified, it will always return succcess
```shell
# This will always return HTTP status 200
curl -i http://localhost:4567/crm/
```

The server accepts GET and POST requests
