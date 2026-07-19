# Session 02 - Căn Bản Về Containerization

English version: [README.md](README.md)

## Mục Tiêu

Session này giải thích cách đóng gói ứng dụng thành Docker image và chạy image đó thành container.

Nếu không dùng container, mỗi môi trường phải tự có đúng runtime và dependency:

```text
Máy A có Python 3.12 -> chạy được
Máy B có Python 3.9 -> có thể lỗi
Server thiếu thư viện -> có thể lỗi
```

Với Docker:

```text
Docker image = OS nền + runtime + dependencies + source code + lệnh start app
```

## File Quan Trọng

- `app.py`: ứng dụng FastAPI nhỏ.
- `requirements.txt`: dependency Python.
- `Dockerfile`: công thức build image.
- `.dockerignore`: những file Docker nên bỏ qua khi build.

## Khái Niệm Chính

```text
Dockerfile = công thức build
Image      = bản đóng gói của ứng dụng
Container  = instance đang chạy từ image
```

Bạn cần có image trước thì Docker mới tạo container được. Nếu image chưa có ở local, Docker có thể pull từ registry như Docker Hub hoặc AWS ECR.

## Lab

Dùng WSL/Linux shell:

```bash
cd /mnt/d/DevOps/Ops/session-02-containerization-basics
docker build -t devops-demo-api:session-02 .
```

Chạy container:

```bash
docker run --rm -p 8002:8000 devops-demo-api:session-02
```

Mở terminal khác và kiểm tra:

```bash
curl http://localhost:8002
```

Kết quả mong đợi:

```json
{"message":"Hello from Docker","session":"02-containerization-basics"}
```

Dừng container bằng `Ctrl+C`.

## Port Mapping

```text
-p 8002:8000
```

nghĩa là:

```text
cổng 8002 trên máy host -> cổng 8000 trong container
```

FastAPI app nghe ở cổng `8000` bên trong container. Bạn truy cập từ máy mình qua `localhost:8002`.

## Build Lại Sau Khi Sửa Code

Nếu sửa `app.py`, hãy build lại image:

```bash
docker build -t devops-demo-api:session-02 .
```

Sau đó dừng container cũ và chạy container mới từ image mới.

Khi dùng cùng tag, `devops-demo-api:session-02` sẽ trỏ sang image mới build. Container đang chạy không tự update theo image mới.

## Lệnh Hữu Ích

```bash
docker images
docker ps
docker ps -a
docker logs <container-name-or-id>
docker image prune
```

## Kết Luận

Docker trả lời câu hỏi:

```text
Làm sao đóng gói app để chạy nhất quán trên máy dev, server, và cloud?
```
