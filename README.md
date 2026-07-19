# DevOps Foundations Practice Workspace

Muc tieu cua workspace nay la bien 8 session thanh mot lo trinh thuc hanh co thu tu:

```text
01 DevOps/GitOps mindset
02 Dockerize mot app
03 Chay nhieu service bang Docker Compose
04 Dua container len Kubernetes
05 Quan ly config, secret, storage tren Kubernetes
06 Tao ha tang AWS bang Terraform
07 Tu dong build/deploy bang pipeline
08 Ghep tat ca thanh final project
```

## Cach Hoc

Moi session co mot thu muc rieng:

```text
session-01-devops-gitops/
session-02-containerization-basics/
session-03-docker-compose-multi-service/
session-04-kubernetes-core-objects/
session-05-k8s-config-storage/
session-06-terraform-iac-basics/
session-07-aws-devops-pipeline/
session-08-final-project/
```

Nen hoc theo vong lap nay:

```text
1. Doc README cua session
2. Chay lenh trong phan lab
3. Sua mot gia tri nho
4. Chay lai va quan sat ket qua
5. Ghi lai: "Khi nao dung cai nay?"
```

## Ban Do Tong Quan

| Lop | Cong cu | Dung de lam gi |
| --- | --- | --- |
| Source of truth | Git | Luu code, lich su thay doi, review |
| Package app | Docker | Dong goi app thanh image |
| Local multi-service | Docker Compose | Chay app + database/cache o may local |
| Container orchestration | Kubernetes | Chay, scale, restart, update app tren cluster |
| App runtime config | ConfigMap/Secret/PVC | Truyen config, credential, luu data |
| Cloud infrastructure | Terraform | Tao/xoa AWS resource bang code |
| Automation | CI/CD Pipeline | Test, build, push image, deploy tu dong |

## Nguyen Tac Tranh Bi Tru Tien AWS

- Tao resource bang Terraform thi xoa bang `terraform destroy`.
- Khong xoa file `.tf` truoc khi `destroy`.
- Luon chay `terraform plan` truoc `apply` va `destroy`.
- Luon kiem tra dung AWS region.
- Sau khi lab xong, vao AWS Console kiem tra lai EC2, EKS, ECS, RDS, NAT Gateway, Load Balancer, EBS, ECR, S3.
- Neu tao thu gi bang UI AWS thi Terraform se khong tu biet de xoa, tru khi ban import vao state.

## Prerequisites

Can cai dan cac cong cu sau:

- Git
- Docker Desktop
- kubectl
- mot local Kubernetes cluster: Docker Desktop Kubernetes, minikube, hoac kind
- Terraform
- AWS CLI
- Mot AWS account rieng cho lab, khong dung account production

