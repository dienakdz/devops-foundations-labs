# AWS DevOps Foundations Labs

English version: [README.md](README.md)

Repository này là workspace thực hành cho khóa DevOps Foundations theo hướng AWS.

Mục tiêu là nối các session thành một luồng triển khai thực tế:

```text
source code
-> Docker image
-> Docker Compose local stack
-> Kubernetes manifests
-> hạ tầng AWS quản lý bằng Terraform
-> CI/CD pipeline
-> final project end-to-end
```

## Các Session

| Session | Chủ Đề | Câu Hỏi Chính |
| --- | --- | --- |
| 01 | DevOps Principles & GitOps | Team quản lý thay đổi qua Git như thế nào? |
| 02 | Containerization Basics | Làm sao đóng gói app thành Docker image? |
| 03 | Docker Compose Multi-Service | Làm sao chạy nhiều service local cùng nhau? |
| 04 | Kubernetes Core Objects | Làm sao chạy container trên cluster? |
| 05 | K8s Config & Storage | Làm sao quản lý config, secret, và data bền vững? |
| 06 | Terraform IaC Basics | Làm sao tạo và xóa hạ tầng AWS bằng code? |
| 07 | AWS DevOps Pipeline | Làm sao tự động test, build, push, và deploy? |
| 08 | Final Project | Làm sao ghép toàn bộ thành một luồng deploy? |

## Cấu Trúc Repository

```text
session-01-devops-gitops/
session-02-containerization-basics/
session-03-docker-compose-multi-service/
session-04-kubernetes-core-objects/
session-05-k8s-config-storage/
session-06-terraform-iac-basics/
session-07-aws-devops-pipeline/
session-08-final-project/
scripts/
```

Mỗi session dùng convention:

```text
README.md     hướng dẫn tiếng Anh
README.vi.md  hướng dẫn tiếng Việt, nếu đã dịch
```

Hiện tại session 1, 2, 3 đã có README song ngữ.

## Thứ Tự Học Khuyến Nghị

Bắt đầu với:

```text
START_HERE.md
```

Thứ tự nên học:

```text
1. session-02: Docker basics
2. session-03: Docker Compose
3. session-06/local-no-cost: Terraform không tốn chi phí AWS
4. session-04: Kubernetes core objects
5. session-05: Kubernetes config and storage
6. session-06/aws-s3-demo: Terraform với AWS
7. session-07: AWS pipeline
8. session-08: final project
9. session-01: quay lại GitOps sau khi đã thấy các tool
```

Session 01 rất quan trọng về tư duy, nhưng sẽ dễ hiểu hơn sau khi bạn đã thực hành Docker, Compose, Kubernetes, Terraform, và CI/CD.

## Bản Đồ Khái Niệm

| Lớp | Tool | Mục Đích |
| --- | --- | --- |
| Source of truth | Git | Lịch sử, review, rollback |
| Đóng gói app | Docker | Đóng gói app thành image có thể chạy ở nhiều nơi |
| Local multi-service | Docker Compose | Chạy app cùng dependency ở local |
| Container orchestration | Kubernetes | Chạy, scale, restart, update container |
| Runtime config | ConfigMap, Secret, PVC | Truyền config, credential, và data bền vững |
| Cloud infrastructure | Terraform | Tạo, sửa, xóa AWS resource bằng code |
| Automation | CI/CD pipeline | Test, build, push image, deploy tự động |

## Công Cụ Cần Có

Cài dần theo từng session:

- Git
- Docker Engine hoặc Docker Desktop
- Docker Compose
- Terraform
- kubectl
- Local Kubernetes cluster như kind, minikube, hoặc Docker Desktop Kubernetes
- AWS CLI
- Một AWS account riêng để lab, không dùng production account

Nếu dùng WSL thay vì Docker Desktop, đọc:

```text
WSL_SETUP.md
```

## Quy Tắc Tránh Tốn Tiền AWS

- Terraform tạo resource thì xóa bằng `terraform destroy`.
- Không xóa file `.tf` trước khi chạy `terraform destroy`.
- Không xóa Terraform state trước khi destroy resource.
- Luôn chạy `terraform plan` trước `terraform apply`.
- Luôn chạy `terraform plan` trước `terraform destroy`.
- Luôn kiểm tra AWS account và region trước khi tạo resource.
- Sau khi lab, kiểm tra AWS Console để tìm resource còn sót như EC2, EKS, ECS, RDS, NAT Gateway, Load Balancer, EBS, ECR, S3, và CloudWatch Logs.
- Nếu tạo resource bằng AWS Console, Terraform sẽ không tự biết resource đó, trừ khi bạn import vào Terraform state.

## License

Repository này dùng cho mục đích học và thực hành.
