# grpc-docker-lb

GRPC Automatic server-side load balancing using docker, consul ,registrator and nghttp2.


## How it works:

1. Registrator finds grpc-server containers and signs them into consul.
2. The load balancer (nghttp2) configuration is being refreshed by consul-template.
3. The client logs in to the load balancer, which sends the request to a grpc-server container.


## How to build it:

```
cd ./insecure
docker-compose up -d
```

Then, open a shell and run:

```
docker-compose log -f grpc-client (You should see responses from servers with their hostnames)
```

And in a different one, run:

```
docker-compose scale grpc-server=5
```

And you will see that the client recieves responses with the new containers.
