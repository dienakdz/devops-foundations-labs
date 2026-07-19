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

## Lab

Chay:

```powershell
docker compose up --build
```

Kiem tra API:

```powershell
curl http://localhost:8001
```

Moi lan goi API, app se tang counter trong Redis.

Dung va xoa container:

```powershell
docker compose down
```

Dung va xoa ca volume neu co:

```powershell
docker compose down -v
```

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

