# Session 03 - Docker Compose Multi-Service

## Ban Chat

App that thuong khong chi co mot container.

Vi du:

```text
api
database
redis
worker
nginx
```

Docker Compose dung de chay nhieu service cung luc tren local bang mot file `docker-compose.yml`.

Session nay co 2 service:

```text
api   = FastAPI app
redis = Redis server luu visit_count
```

## Lab

Chay:

```bash
docker compose up --build
```

Kiem tra API:

```bash
curl http://localhost:8001
```

Moi lan goi API, app se tang counter trong Redis.

Dung va xoa container:

```bash
docker compose down
```

Dung va xoa ca volume neu co:

```bash
docker compose down -v
```

Xem trang thai service:

```bash
docker compose ps
```

Xem log:

```bash
docker compose logs api
docker compose logs redis
```

## Giai Thich docker-compose.yml

```yaml
services:
  api:
    build: .
```

Service `api` duoc build tu `Dockerfile` trong folder hien tai.

```yaml
ports:
  - "8001:8000"
```

May host goi `localhost:8001`, request se di vao container `api` cong `8000`.

```yaml
environment:
  REDIS_HOST: redis
  REDIS_PORT: "6379"
```

Truyen config vao container `api`. Trong Compose, cac service cung network co the goi nhau bang ten service. Vi vay `api` goi Redis bang hostname `redis`, khong phai `localhost`.

```yaml
depends_on:
  redis:
    condition: service_healthy
```

Bao Compose start `api` sau khi `redis` duoc danh dau la healthy.

```yaml
healthcheck:
  test: ["CMD", "redis-cli", "ping"]
  interval: 5s
  timeout: 3s
  retries: 5
```

Compose kiem tra Redis bang lenh `redis-cli ping`. Neu Redis san sang, no tra ve `PONG`.

## Started Khac Ready

Can phan biet:

```text
container started = container da duoc khoi dong
service ready     = ung dung ben trong container da san sang nhan request
```

`depends_on` co ban chi xu ly thu tu start container. Neu khong co healthcheck, co the xay ra truong hop:

```text
00:00 redis container started
00:01 api container started
00:02 api goi redis
00:03 redis moi ready
```

Luc do API co the gap loi connection.

Voi healthcheck va `condition: service_healthy`, Compose se doi Redis ready roi moi start API.

## Healthcheck Khong Thay The Retry Logic

Healthcheck tot cho local/dev Compose, nhung production van nen co retry logic trong app.

Ly do:

```text
Redis/database co the restart
Network co the cham tam thoi
Dependency co the ready cham hon app
```

Ung dung production tot nen biet thu lai connection thay vi chet ngay khi dependency loi trong vai giay dau.

## Khi Nao Dung Docker Compose

Dung khi:

- Chay local dev.
- Can demo nhanh nhieu service.
- Muon dong doi chay cung mot moi truong local.

Khong nen xem Compose la Kubernetes. Compose tot cho local/simple setup, Kubernetes tot cho production orchestration.

## Ket Luan

Docker Compose tra loi cau hoi:

```text
Lam sao chay ca he thong nho o local bang mot lenh?
```

Va session nay them mot y quan trong:

```text
Container started khong co nghia la service ben trong da ready.
```
