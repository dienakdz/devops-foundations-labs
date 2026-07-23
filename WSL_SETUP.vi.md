# Cài Đặt WSL

English version: [WSL_SETUP.md](WSL_SETUP.md)

Repository này được thiết kế để chạy bằng Ubuntu trên WSL2 mà không cần Docker Desktop.

## Working Directory

Mở WSL và dùng Linux path của workspace Windows:

```bash
cd /mnt/d/DevOps/Ops
```

Kiểm tra tool bất cứ lúc nào:

```bash
bash scripts/check-tools-wsl.sh
```

Script kiểm tra Git, Docker, Docker Compose, kind, kubectl, Terraform, AWS CLI và Kubernetes context hiện tại.

## Thứ Tự Cài Tool

Chỉ cài tool khi session tương ứng cần:

```text
Session 01-03: Git, Docker Engine, Docker Compose
Session 04-05: kubectl, kind
Session 06:    Terraform, rồi AWS CLI cho AWS lab
Session 07-08: GitHub repository và AWS CLI/Terraform cho ECR
```

## Docker Engine Và Compose

Workspace giả định Docker Engine đang chạy bên trong WSL:

```bash
docker version
docker compose version
```

Nếu có Docker CLI nhưng daemon chưa chạy:

```bash
sudo service docker start
```

## kubectl

Cài stable Linux AMD64 client hiện tại:

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
kubectl version --client
```

`kubectl` chỉ là client. Nó cần Kubernetes cluster context.

## kind

Cài stable kind binary dùng trong Session 04:

```bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.32.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind version
```

Chỉ tạo cluster khi bắt đầu Session 04:

```bash
kind create cluster --name devops-lab --wait 120s
kubectl get nodes
```

Sau các Kubernetes lab, xóa cluster nếu không cần nữa:

```bash
kind delete cluster --name devops-lab
```

## Terraform

Dùng HashiCorp APT repository chính thức:

```bash
sudo apt-get update
sudo apt-get install -y gpg wget
wget -O - https://apt.releases.hashicorp.com/gpg \
  | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" \
  | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update
sudo apt-get install -y terraform
terraform version
```

Học local lab không tốn AWS trước:

```bash
cd /mnt/d/DevOps/Ops/session-06-terraform-iac-basics/local-no-cost
```

## AWS CLI

Cài AWS CLI v2 trong WSL nếu Terraform và AWS command chạy tại đó:

```bash
setup_dir=$(mktemp -d)
cd "$setup_dir"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
unzip awscliv2.zip
sudo ./aws/install
cd /mnt/d/DevOps/Ops
aws --version
```

Chỉ cấu hình account riêng để học, rồi kiểm tra trước mỗi AWS lab:

```bash
aws configure
aws sts get-caller-identity
aws configure get region
```

## Lộ Trình

```text
01 Git và DevOps change flow
02 Docker image/container
03 Compose API + Redis
04 kind Kubernetes core objects
05 Kubernetes config và storage
06 Terraform local state, rồi AWS S3
07 GitHub CI, rồi ECR/OIDC
08 final local stack, rồi optional AWS artifact track
```

Không tạo AWS resource cho đến khi bạn đọc được `terraform plan`, biết giữ state, chạy `terraform destroy` và verify cleanup.

## Tham Khảo

- [Cài kubectl trên Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
- [kind Quick Start](https://kind.sigs.k8s.io/docs/user/quick-start/)
- [Cài Terraform](https://developer.hashicorp.com/terraform/install)
- [Cài AWS CLI v2 trên Linux](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
