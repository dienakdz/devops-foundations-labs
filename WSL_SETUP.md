# WSL Setup For This DevOps Workspace

May hien tai:

```text
WSL distro: Ubuntu 24.04 LTS
WSL version: 2
Docker Engine: installed and running in WSL
Docker Compose: installed in WSL
Missing in WSL: terraform, kubectl, aws
```

## Nen Lam Viec O Dau?

Dung WSL terminal cho cac lab DevOps:

```bash
cd /mnt/d/DevOps/Ops
```

Ly do:

```text
Docker Engine dang chay trong WSL.
Docker/Kubernetes/Terraform ecosystem hop voi Linux shell hon PowerShell.
Lenh trong course/AWS docs thuong viet cho Linux.
```

PowerShell van dung duoc de mo file, nhung nen chay lab bang WSL.

## Buoc 1: Kiem Tra Tool

Trong WSL:

```bash
cd /mnt/d/DevOps/Ops
bash scripts/check-tools-wsl.sh
```

## Buoc 2: Chay Session 02 Truoc

Vi Docker da co, bat dau bang:

```bash
cd /mnt/d/DevOps/Ops/session-02-containerization-basics
docker build -t devops-demo-api:session-02 .
docker run --rm -p 8000:8000 devops-demo-api:session-02
```

Mo terminal WSL khac:

```bash
curl http://localhost:8000
```

Neu thay JSON tra ve la dung.

## Buoc 3: Chay Session 03

```bash
cd /mnt/d/DevOps/Ops/session-03-docker-compose-multi-service
docker compose up --build
```

Mo terminal WSL khac:

```bash
curl http://localhost:8001
```

Dung:

```bash
docker compose down
```

## Buoc 4: Cai Terraform Trong WSL

Chay trong WSL:

```bash
sudo apt-get update
sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(. /etc/os-release && echo "$VERSION_CODENAME") main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update
sudo apt-get install -y terraform
terraform version
```

Sau do hoc:

```bash
cd /mnt/d/DevOps/Ops/session-06-terraform-iac-basics/local-no-cost
terraform init
terraform plan
terraform apply
terraform destroy
```

## Buoc 5: Cai kubectl Trong WSL

Chay trong WSL:

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
kubectl version --client=true
```

Luu y: `kubectl` chi la CLI. Muon co Kubernetes cluster local thi can them `kind`, `minikube`, hoac cluster EKS tren AWS.

## Buoc 6: Cai AWS CLI Trong WSL

Windows da co AWS CLI, nhung WSL chua co. Neu chay Terraform/AWS command trong WSL thi nen cai AWS CLI trong WSL luon:

```bash
sudo apt-get update
sudo apt-get install -y unzip curl
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip
aws --version
```

Dang nhap/cau hinh:

```bash
aws configure
aws sts get-caller-identity
```

## Thu Tu Tiep Theo

```text
1. Chay session-02 thanh cong
2. Chay session-03 thanh cong
3. Cai Terraform
4. Chay session-06/local-no-cost
5. Cai kubectl
6. Hoc session-04 va session-05 khi co local Kubernetes cluster
7. Cai AWS CLI trong WSL
8. Moi dung session-06/aws-s3-demo
```

Khong nen nhay vao AWS truoc khi lam duoc session-02, session-03 va Terraform local no-cost.

