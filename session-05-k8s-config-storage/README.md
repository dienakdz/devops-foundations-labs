# Session 05 - K8s Config & Storage

## Ban Chat

Sau khi biet chay app tren Kubernetes, ban can biet cach dua config, secret va storage vao app.

## Object Can Nam

| Object | Dung De |
| --- | --- |
| ConfigMap | Luu config khong nhay cam |
| Secret | Luu password/token/key |
| Volume | Mount file/folder vao container |
| PersistentVolumeClaim | Xin storage ben vung tu cluster |

## Lab

Apply:

```powershell
kubectl apply -f namespace.yaml
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f pvc.yaml
kubectl apply -f deployment-with-config-storage.yaml
```

Kiem tra:

```powershell
kubectl get configmap,secret,pvc,pod -n devops-config-demo
```

Xem env trong container:

```powershell
kubectl exec -n devops-config-demo deploy/config-demo -- env
```

Xoa:

```powershell
kubectl delete namespace devops-config-demo
```

## Luu Y Ve Secret

Kubernetes Secret mac dinh chi base64 encode, khong phai encryption hoan chinh o muc ung dung. Trong production can quan ly bang AWS Secrets Manager, External Secrets, Sealed Secrets, SOPS, hoac co che tuong duong.

## Khi Nao Dung

Dung ConfigMap khi:

- APP_ENV
- LOG_LEVEL
- Feature flag khong nhay cam

Dung Secret khi:

- DATABASE_PASSWORD
- API_TOKEN
- PRIVATE_KEY

Dung PVC khi:

- Can data ton tai sau khi Pod bi xoa/recreate
- Vi du database volume, uploaded files, shared data

## Ket Luan

Session nay tra loi cau hoi:

```text
Lam sao dua config, credential va data vao app Kubernetes ma khong hardcode vao image?
```

