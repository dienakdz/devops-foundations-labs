# Bắt Đầu Ở Đây

English version: [START_HERE.md](START_HERE.md)

Nếu bạn đang mơ hồ, đừng bắt đầu bằng cách học thuộc tên tool. Hãy bắt đầu từ câu hỏi vận hành.

## 1. Lộ Trình Theo Câu Hỏi

### Câu Hỏi 1: App của mình chạy bằng gì?

Học:

```text
session-02-containerization-basics
```

Bạn cần hiểu:

```text
Dockerfile biến source code thành Docker image.
Docker image là artifact dùng để deploy.
Container là instance đang chạy từ image.
```

### Câu Hỏi 2: Làm sao chạy nhiều service ở local?

Học:

```text
session-03-docker-compose-multi-service
```

Bạn cần hiểu:

```text
docker-compose.yml có thể chạy API cùng Redis/database/cache bằng một lệnh.
Tên service hoạt động như DNS nội bộ trong Compose network.
```

### Câu Hỏi 3: Lên production thì ai quản lý container?

Học:

```text
session-04-kubernetes-core-objects
```

Bạn cần hiểu:

```text
Deployment quản lý Pod.
Service tạo endpoint ổn định cho Pod.
Ingress expose HTTP/domain traffic.
```

### Câu Hỏi 4: Password, config, data để đâu?

Học:

```text
session-05-k8s-config-storage
```

Bạn cần hiểu:

```text
ConfigMap lưu config không nhạy cảm.
Secret lưu credential.
PVC lưu data bền vững.
```

### Câu Hỏi 5: Tạo AWS resource an toàn bằng cách nào?

Học:

```text
session-06-terraform-iac-basics
```

Bạn cần hiểu:

```text
Terraform tạo, sửa, xóa infrastructure từ file .tf.
terraform plan xem trước thay đổi.
terraform apply tạo hoặc sửa resource.
terraform destroy xóa resource do Terraform quản lý.
```

### Câu Hỏi 6: Mỗi lần push code có deploy tay không?

Học:

```text
session-07-aws-devops-pipeline
```

Bạn cần hiểu:

```text
Pipeline có thể test code, build Docker image và publish immutable artifact lên ECR. Session 08 dùng artifact đó cho deployment.
```

### Câu Hỏi 7: Tất cả ghép lại ra sao?

Học:

```text
session-08-final-project
```

Bạn cần hiểu:

```text
Local: source -> image -> Compose -> kind Kubernetes
AWS: source -> CI test -> ECR image artifact
Infrastructure và pipeline identity -> Terraform
```

## 2. Thứ Tự Học Khuyến Nghị

Học theo thứ tự:

```text
1. README.md và START_HERE.md
2. session-01 đọc lần đầu
3. session-02
4. session-03
5. session-04
6. session-05
7. session-06 local-no-cost, rồi aws-s3-demo
8. session-07 CI, rồi ECR
9. session-08 local track, rồi optional AWS artifact track
10. quay lại session-01 với toàn bộ flow trong đầu
```

Lý do nên quay lại session 01 sau: GitOps là mô hình vận hành. Nó dễ hiểu hơn sau khi bạn đã thấy Docker, Compose, Kubernetes, Terraform, và CI/CD chạy thực tế.

Nếu dùng WSL, đọc thêm:

[Đọc hướng dẫn cài đặt WSL](WSL_SETUP.vi.md).

## 3. Câu Ghi Nhớ

```text
Docker đóng gói app.
Compose chạy nhiều service local.
Kubernetes vận hành container trên cluster.
ConfigMap/Secret/PVC đưa config và data vào app.
Terraform tạo hạ tầng cloud.
Pipeline tự động các stage build, test và publish artifact lặp lại.
GitOps giữ trạng thái mong muốn trong Git.
```

## 4. Quy Trình AWS An Toàn

Trước khi tạo resource AWS:

```bash
aws sts get-caller-identity
```

Xác nhận account đúng.

Trước khi tạo hoặc sửa resource:

```bash
terraform plan
```

Chỉ apply khi bạn hiểu plan sẽ tạo hoặc sửa gì:

```bash
terraform apply
```

Sau lab:

```bash
terraform destroy
```

Sau destroy, kiểm tra AWS Console xem còn sót gì không:

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

## 5. Checklist Thành Thục

Bạn có thể xem là đã nắm nền tảng khi tự làm được:

- Viết Dockerfile cho một app nhỏ.
- Chạy app cùng database/cache bằng Docker Compose.
- Viết Kubernetes Deployment và Service.
- Truyền config bằng ConfigMap và Secret.
- Tạo một AWS resource nhỏ bằng Terraform.
- Destroy resource đó bằng Terraform.
- Giải thích pipeline build image và push lên ECR như thế nào.
- Giải thích GitHub OIDC tránh AWS access key dài hạn như thế nào.
- Verify Kubernetes rollout và persistent data sau Pod recreation.
- Giải thích vì sao Terraform không tự xóa được resource tạo tay trong AWS Console.
