# Session 08 - Final Project

## Muc Tieu

Ghep cac session truoc thanh mot flow day du:

```text
FastAPI app
-> Dockerfile
-> Docker Compose local
-> Kubernetes manifests
-> Terraform tao AWS ECR
-> Pipeline build/push image
```

## Cau Truc

```text
app/
docker-compose.yml
k8s/
terraform/ecr/
pipeline/
```

## Buoc 1: Chay Local Bang Docker Compose

```powershell
docker compose up --build
```

Kiem tra:

```powershell
curl http://localhost:8010
```

Dung:

```powershell
docker compose down
```

## Buoc 2: Build Docker Image

```powershell
docker build -t final-demo-api:local ./app
```

## Buoc 3: Deploy Local Kubernetes

Neu chua co image trong cluster local, voi Docker Desktop Kubernetes image local thuong dung duoc truc tiep. Voi kind/minikube can load image rieng.

```powershell
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl port-forward -n final-demo service/final-demo-api 8088:80
```

Kiem tra:

```powershell
curl http://localhost:8088
```

Xoa:

```powershell
kubectl delete namespace final-demo
```

## Buoc 4: Tao ECR Bang Terraform

Chi chay khi ban da login AWS CLI va hieu billing.

```powershell
cd terraform/ecr
terraform init
terraform plan
terraform apply
```

Xoa:

```powershell
terraform destroy
```

## Buoc 5: Pipeline

Tham khao `pipeline/github-actions-final-template.yml`. File nay can duoc copy vao `.github/workflows/` cua repo that khi dung GitHub Actions.

## Checklist Thanh Thuc

Ban nen tra loi duoc:

- Dockerfile dang dong goi cai gi?
- Docker Compose dang chay may service?
- Kubernetes Deployment khac Service o dau?
- Config nao nen nam trong image, config nao nen nam ngoai image?
- Terraform dang tao AWS resource nao?
- `terraform plan` khac `apply` khac `destroy` o dau?
- Pipeline build image va push len dau?

