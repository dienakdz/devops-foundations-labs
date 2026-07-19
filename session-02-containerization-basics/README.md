# Session 02 - Containerization Basics

## Ban Chat

Docker dung de dong goi app thanh mot image. Image nay co the chay giong nhau tren may ban, may dong doi, server, hoac cloud.

Khong Docker:

```text
May A co Python 3.11 -> chay duoc
May B co Python 3.9 -> loi
Server thieu thu vien -> loi
```

Co Docker:

```text
Docker image = app + runtime + dependencies + command chay
```

## File Quan Trong

- `app.py`: ung dung Python nho.
- `requirements.txt`: dependency cua app.
- `Dockerfile`: cong thuc build image.
- `.dockerignore`: bo qua file khong can copy vao image.

## Lab

Build image:

```powershell
docker build -t devops-demo-api:session-02 .
```

Run container:

```powershell
docker run --rm -p 8000:8000 devops-demo-api:session-02
```

Kiem tra:

```powershell
curl http://localhost:8000
```

Dung container bang `Ctrl+C`.

## Khi Nao Dung Docker

Dung khi:

- Ban co app can chay on dinh o nhieu moi truong.
- Ban muon deploy bang image thay vi copy source code len server.
- Ban muon CI/CD build mot artifact ro rang.

## Ket Luan

Docker tra loi cau hoi:

```text
Lam sao dong goi app de chay giong nhau moi noi?
```

