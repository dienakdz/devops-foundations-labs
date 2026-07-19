# Session 06 - Terraform IaC Basics

## Ban Chat

Terraform dung de tao va quan ly infrastructure bang code.

Thay vi vao AWS UI click:

```text
Create VPC
Create Subnet
Create Security Group
Create ECR
Create EKS
```

ban viet file `.tf`, review tren Git, roi chay:

```powershell
terraform init
terraform plan
terraform apply
```

Khi khong can nua:

```powershell
terraform destroy
```

## Terraform Khong Phai YAML

Terraform chu yeu dung file `.tf` voi ngon ngu HCL.

YAML hay gap o:

- Docker Compose: `docker-compose.yml`
- Kubernetes manifest: `*.yaml`
- GitHub Actions: `.github/workflows/*.yml`

Terraform hay gap o:

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `providers.tf`

## Folder Trong Session Nay

```text
local-no-cost/
aws-s3-demo/
```

`local-no-cost` khong tao AWS resource, phu hop hoc lenh Terraform an toan.

`aws-s3-demo` tao S3 bucket tren AWS. Chi chay khi ban da hieu billing va san sang xoa bang `terraform destroy`.

## Lab An Toan: local-no-cost

```powershell
cd local-no-cost
terraform init
terraform plan
terraform apply
terraform destroy
```

## Lab AWS: aws-s3-demo

Dang nhap AWS CLI truoc:

```powershell
aws configure
aws sts get-caller-identity
```

Chay Terraform:

```powershell
cd aws-s3-demo
terraform init
terraform plan
terraform apply
```

Xoa het resource Terraform da tao:

```powershell
terraform destroy
```

## Quy Tac Khong De Sot Bill

```text
Dung Terraform tao -> dung Terraform destroy
Dung AWS UI tao -> phai tu vao UI xoa, tru khi import vao Terraform state
Khong xoa file .tf truoc khi destroy
Khong xoa file terraform.tfstate neu chua destroy
```

## Ket Luan

Terraform tra loi cau hoi:

```text
Lam sao tao, sua, xoa ha tang cloud bang code va co the lap lai?
```

