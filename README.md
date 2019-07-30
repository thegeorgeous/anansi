# Pascal

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

You can also specify a delay in seconds
```shell
# This will return delay the response by 4 seconds
curl -i http://localhost:4567/crm/delay/4
```

If no query params are specified, it will delay by 3 seconds
```shell
# This will delay response by 3 seconds
curl -i http://localhost:4567/crm/delay
```

You can also specify delay with a probability
```shell
# This will delay response by 4 seconds with 80% probability
curl -i http://localhost:4567/crm/80/4
```

The server accepts GET and POST requests
