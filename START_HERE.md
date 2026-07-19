# Start Here

Neu ban dang mo ho, dung co hoc theo ten tool truoc. Hay hoc theo cau hoi van hanh.

## 1. Lo Trinh De Hieu

### Cau Hoi 1: App cua minh chay bang gi?

Hoc:

```text
session-02-containerization-basics
```

Ket qua can nam:

```text
Dockerfile bien source code thanh Docker image.
Docker image la artifact de deploy.
```

### Cau Hoi 2: Local can nhieu service thi chay sao?

Hoc:

```text
session-03-docker-compose-multi-service
```

Ket qua can nam:

```text
docker-compose.yml chay api + redis/database/cache bang mot lenh.
```

### Cau Hoi 3: Len production thi ai quan ly container?

Hoc:

```text
session-04-kubernetes-core-objects
```

Ket qua can nam:

```text
Deployment quan ly Pod.
Service tao dia chi on dinh de goi Pod.
Ingress expose HTTP/domain.
```

### Cau Hoi 4: Password, config, data de dau?

Hoc:

```text
session-05-k8s-config-storage
```

Ket qua can nam:

```text
ConfigMap cho config thuong.
Secret cho credential.
PVC cho data can ton tai.
```

### Cau Hoi 5: AWS resource tao bang cach nao?

Hoc:

```text
session-06-terraform-iac-basics
```

Ket qua can nam:

```text
Terraform tao/sua/xoa infrastructure bang file .tf.
terraform plan de xem truoc.
terraform apply de tao/sua.
terraform destroy de xoa nhung thu Terraform quan ly.
```

### Cau Hoi 6: Moi lan push code co deploy tay khong?

Hoc:

```text
session-07-aws-devops-pipeline
```

Ket qua can nam:

```text
Pipeline tu dong test, build image, push len ECR, deploy.
```

### Cau Hoi 7: Tat ca ghep lai ra sao?

Hoc:

```text
session-08-final-project
```

Ket qua can nam:

```text
Source -> Docker image -> ECR -> Kubernetes/ECS/EKS -> Pipeline.
Infrastructure AWS -> Terraform.
```

## 2. Thu Tu Hoc De Khong Bi Roi

Hoc theo thu tu nay:

```text
1. README.md tong quan
2. START_HERE.md
3. session-02
4. session-03
5. session-04
6. session-05
7. session-06 local-no-cost
8. session-06 aws-s3-demo
9. session-07
10. session-08
11. Quay lai session-01 de hieu GitOps sau khi da thay cac tool
```

Ly do de session-01 doc lai sau: GitOps la tu duy van hanh. Khi chua thay Docker/K8s/Terraform thi nghe rat tru tuong.

Neu hoc bang WSL, doc them:

```text
WSL_SETUP.md
```

## 3. Cau Than Chu De Nho

```text
Docker dong goi app.
Compose chay nhieu service local.
Kubernetes van hanh container.
ConfigMap/Secret/PVC dua config va data vao app.
Terraform tao ha tang cloud.
Pipeline tu dong hoa build/deploy.
GitOps bat moi thay doi di qua Git.
```

## 4. Quy Trinh AWS An Toan

Truoc khi tao resource AWS:

```powershell
aws sts get-caller-identity
```

Kiem tra account co dung khong.

Truoc khi tao:

```powershell
terraform plan
```

Chi khi doc plan va hieu no tao gi moi chay:

```powershell
terraform apply
```

Sau lab:

```powershell
terraform destroy
```

Sau destroy, vao AWS Console kiem tra lai:

```text
EC2
EKS
ECS
RDS
Load Balancer
NAT Gateway
EBS Volume
ECR
S3
CloudWatch Logs
```

## 5. Checklist Thanh Thuc

Ban tam coi la nam duoc nen tang DevOps khi co the tu lam:

- Viet Dockerfile cho mot app don gian.
- Chay app + database/cache bang Docker Compose.
- Viet Deployment + Service Kubernetes.
- Truyen config bang ConfigMap va Secret.
- Tao mot AWS resource nho bang Terraform.
- Destroy dung resource do bang Terraform.
- Giai thich duoc pipeline build image va push len ECR.
- Biet resource nao tao bang UI thi Terraform khong tu xoa duoc.
