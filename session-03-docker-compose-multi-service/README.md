# Session 03 - Docker Compose Multi-Service

Vietnamese version: [README.vi.md](README.vi.md)

## Purpose

Real applications usually need more than one container:

```text
api
database
redis
worker
nginx
```

Docker Compose runs multiple related services from one `docker-compose.yml` file.

This session has two services:

```text
api   = FastAPI application
redis = Redis server storing visit_count
```

## Lab

Use WSL/Linux shell:

```bash
cd /mnt/d/DevOps/Ops/session-03-docker-compose-multi-service
docker compose up --build
```

Open another terminal and test:

```bash
curl http://localhost:8001
curl http://localhost:8001
```

The `visit_count` value should increase on each request.

Restart the stack and verify that the count is still present:

```bash
docker compose down
docker compose up -d
curl http://localhost:8001
```

The named `redis-data` volume survives `docker compose down`.

Stop and remove containers and the default network:

```bash
docker compose down
```

Remove volumes too, if the project has volumes:

```bash
docker compose down -v
```

After `down -v`, the next stack starts with a new Redis data volume and the counter resets.

## Useful Commands

```bash
docker compose ps
docker compose ps -a
docker compose logs api
docker compose logs redis
docker compose images
```

## Compose File Explained

```yaml
services:
  api:
    build: .
```

The `api` service is built from the `Dockerfile` in the current folder.

```yaml
ports:
  - "8001:8000"
```

Requests to `localhost:8001` on the host are forwarded to port `8000` inside the `api` container.

```yaml
environment:
  REDIS_HOST: redis
  REDIS_PORT: "6379"
```

Environment variables are passed into the `api` container. In a Compose network, services can reach each other by service name, so the API calls Redis using the hostname `redis`, not `localhost`.

```yaml
depends_on:
  redis:
    condition: service_healthy
```

Compose starts the `api` service after the `redis` service is marked healthy.

```yaml
healthcheck:
  test: ["CMD", "redis-cli", "ping"]
  interval: 5s
  timeout: 3s
  retries: 5
```

Compose checks Redis with `redis-cli ping`. When Redis is ready, it returns `PONG`.

```yaml
volumes:
  - redis-data:/data
```

Redis writes data to a named Docker volume. Container deletion does not delete the volume; `docker compose down -v` does.

## Where visit_count Is Stored

In `app.py`:

```python
count = redis_client.incr("visit_count")
```

This sends a command to Redis:

```text
increase the key visit_count by 1 and return the new value
```

`count` is a temporary Python variable for the current request. `visit_count` is the actual key stored in Redis.

## Started vs Ready

These are different states:

```text
container started = the container process has started
service ready     = the application inside the container can handle requests
```

Without a healthcheck, this can happen:

```text
00:00 redis container started
00:01 api container started
00:02 api calls redis
00:03 redis becomes ready
```

At `00:02`, the API may get a connection error.

With a healthcheck and `condition: service_healthy`, Compose waits until Redis is ready before starting the API service.

## Healthcheck Is Not A Replacement For Retry Logic

Healthchecks are useful for local development, but production applications should still have retry logic.

Reasons:

```text
Redis or a database can restart
Networking can fail temporarily
A dependency can become ready later than the app
```

A production-grade app should retry temporary dependency failures instead of immediately crashing.

## When To Use Docker Compose

Use Docker Compose when:

- You need a local development environment.
- You need several services running together.
- You want teammates to start the same local stack with one command.

Do not treat Compose as Kubernetes. Compose is great for local/simple setups. Kubernetes is designed for production orchestration at a larger scale.

## Failure Exercise

With the stack running, stop only Redis:

```bash
docker compose stop redis
curl http://localhost:8001
```

The API request fails because its dependency is unavailable. Start Redis again:

```bash
docker compose start redis
docker compose ps
curl http://localhost:8001
```

This shows why startup ordering is not enough: dependencies can fail after startup, so production applications also need clear errors, timeouts, retries, and monitoring.

## Takeaway

Docker Compose answers this question:

```text
How do we run a small multi-service system locally with one command?
```

This session also adds an important operational lesson:

```text
A started container does not always mean the service inside it is ready.
```
