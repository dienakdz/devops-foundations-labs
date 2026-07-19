# Session 04 - Kubernetes Core Objects

## Ban Chat

Kubernetes dung de van hanh container tren cluster.

Docker chay container. Kubernetes quan ly container:

```text
Tu restart khi loi
Scale nhieu replica
Rolling update
Service discovery
Expose app ra ngoai
```

## Object Can Nam

| Object | Hieu Don Gian |
| --- | --- |
| Namespace | Thu muc logic trong cluster |
| Pod | Noi container that su chay |
| Deployment | Khai bao app can may replica, image nao |
| Service | Dia chi on dinh de goi Pod |
| Ingress | Dinh tuyen HTTP/domain vao Service |

## Lab Local

Can co Kubernetes local truoc: Docker Desktop Kubernetes, minikube, hoac kind.

Apply manifest:

```powershell
kubectl apply -f namespace.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

Kiem tra:

```powershell
kubectl get all -n devops-demo
```

Forward port:

```powershell
kubectl port-forward -n devops-demo service/demo-api 8080:80
```

Mo terminal khac:

```powershell
curl http://localhost:8080
```

Xoa:

```powershell
kubectl delete namespace devops-demo
```

## Khi Nao Dung Kubernetes

Dung khi:

- App co nhieu service.
- Can scale.
- Can rolling deployment.
- Can self-healing.
- Can chay tren cluster production nhu EKS.

## Ket Luan

Kubernetes tra loi cau hoi:

```text
Lam sao van hanh container o production mot cach on dinh?
```

