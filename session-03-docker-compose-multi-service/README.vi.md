# Session 03 - Docker Compose Multi-Service

English version: [README.md](README.md)

## Mục Tiêu

Ứng dụng thật thường không chỉ có một container:

```text
api
database
redis
worker
nginx
```

Docker Compose dùng để chạy nhiều service liên quan với nhau từ một file `docker-compose.yml`.

Session này có hai service:

```text
api   = ứng dụng FastAPI
redis = Redis server lưu visit_count
```

## Lab

Dùng WSL/Linux shell:

```bash
cd /mnt/d/DevOps/Ops/session-03-docker-compose-multi-service
docker compose up --build
```

Mở terminal khác và kiểm tra:

```bash
curl http://localhost:8001
curl http://localhost:8001
```

Giá trị `visit_count` sẽ tăng sau mỗi request.

Dừng và xóa container cùng default network:

```bash
docker compose down
```

Nếu project có volume và muốn xóa luôn volume:

```bash
docker compose down -v
```

## Lệnh Hữu Ích

```bash
docker compose ps
docker compose ps -a
docker compose logs api
docker compose logs redis
docker compose images
```

## Giải Thích docker-compose.yml

```yaml
services:
  api:
    build: .
```

Service `api` được build từ `Dockerfile` trong folder hiện tại.

```yaml
ports:
  - "8001:8000"
```

Request vào `localhost:8001` trên máy host sẽ được chuyển vào cổng `8000` trong container `api`.

```yaml
environment:
  REDIS_HOST: redis
  REDIS_PORT: "6379"
```

Biến môi trường được truyền vào container `api`. Trong network của Compose, các service có thể gọi nhau bằng tên service, nên API gọi Redis bằng hostname `redis`, không phải `localhost`.

```yaml
depends_on:
  redis:
    condition: service_healthy
```

Compose sẽ start service `api` sau khi service `redis` được đánh dấu là healthy.

```yaml
healthcheck:
  test: ["CMD", "redis-cli", "ping"]
  interval: 5s
  timeout: 3s
  retries: 5
```

Compose kiểm tra Redis bằng lệnh `redis-cli ping`. Khi Redis sẵn sàng, nó trả về `PONG`.

## visit_count Được Lưu Ở Đâu?

Trong `app.py`:

```python
count = redis_client.incr("visit_count")
```

Dòng này gửi lệnh sang Redis:

```text
tăng key visit_count lên 1 và trả giá trị mới về
```

`count` là biến Python tạm thời trong request hiện tại. `visit_count` là key thật được lưu trong Redis.

## Started Khác Ready

Cần phân biệt:

```text
container started = container process đã được khởi động
service ready     = ứng dụng bên trong container đã sẵn sàng nhận request
```

Nếu không có healthcheck, có thể xảy ra:

```text
00:00 redis container started
00:01 api container started
00:02 api gọi redis
00:03 redis mới ready
```

Ở `00:02`, API có thể gặp lỗi connection.

Với healthcheck và `condition: service_healthy`, Compose sẽ đợi Redis ready rồi mới start API service.

## Healthcheck Không Thay Thế Retry Logic

Healthcheck hữu ích cho local development, nhưng ứng dụng production vẫn nên có retry logic.

Lý do:

```text
Redis hoặc database có thể restart
Network có thể lỗi tạm thời
Dependency có thể ready chậm hơn app
```

Ứng dụng production tốt nên thử lại khi dependency lỗi tạm thời, thay vì crash ngay.

## Khi Nào Dùng Docker Compose

Dùng Docker Compose khi:

- Cần môi trường local development.
- Cần nhiều service chạy cùng nhau.
- Muốn đồng đội start cùng một local stack bằng một lệnh.

Không nên xem Compose là Kubernetes. Compose phù hợp cho local/simple setup. Kubernetes được thiết kế cho production orchestration ở quy mô lớn hơn.

## Kết Luận

Docker Compose trả lời câu hỏi:

```text
Làm sao chạy một hệ thống nhỏ gồm nhiều service ở local bằng một lệnh?
```

Session này cũng thêm một bài học vận hành quan trọng:

```text
Container đã started không có nghĩa là service bên trong đã ready.
```
