# WSL Setup

Vietnamese version: [WSL_SETUP.vi.md](WSL_SETUP.vi.md)

This repository is designed to run from Ubuntu on WSL2 without Docker Desktop.

## Working Directory

Open WSL and use the Linux path for the Windows workspace:

```bash
cd /mnt/d/DevOps/Ops
```

Run the tool check at any time:

```bash
bash scripts/check-tools-wsl.sh
```

The script checks Git, Docker, Docker Compose, kind, kubectl, Terraform, AWS CLI, and the current Kubernetes context.

## Tool Order

Install tools when the matching session needs them:

```text
Sessions 01-03: Git, Docker Engine, Docker Compose
Sessions 04-05: kubectl, kind
Session 06:     Terraform, then AWS CLI for the AWS lab
Sessions 07-08: GitHub repository and AWS CLI/Terraform for ECR
```

## Docker Engine And Compose

This workspace assumes Docker Engine is already running inside WSL:

```bash
docker version
docker compose version
```

If the CLI exists but the daemon is unreachable:

```bash
sudo service docker start
```

## kubectl

Install the current stable Linux AMD64 client:

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
kubectl version --client
```

`kubectl` is only a client. It needs a Kubernetes cluster context.

## kind

Install the stable kind binary used by the Session 04 guide:

```bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.32.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind version
```

Create the lab cluster only when starting Session 04:

```bash
kind create cluster --name devops-lab --wait 120s
kubectl get nodes
```

Delete it after all local Kubernetes sessions if you no longer need it:

```bash
kind delete cluster --name devops-lab
```

## Terraform

Use the official HashiCorp APT repository:

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

Start with the no-cost local lab before AWS:

```bash
cd /mnt/d/DevOps/Ops/session-06-terraform-iac-basics/local-no-cost
```

## AWS CLI

Install AWS CLI v2 inside WSL if Terraform and AWS commands will run there:

```bash
setup_dir=$(mktemp -d)
cd "$setup_dir"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
unzip awscliv2.zip
sudo ./aws/install
cd /mnt/d/DevOps/Ops
aws --version
```

Configure only a dedicated learning account, then verify it before every AWS lab:

```bash
aws configure
aws sts get-caller-identity
aws configure get region
```

## Recommended Progression

```text
01 Git and DevOps change flow
02 Docker image/container
03 Compose API + Redis
04 kind Kubernetes core objects
05 Kubernetes config and storage
06 Terraform local state, then AWS S3
07 GitHub CI, then ECR/OIDC
08 final local stack, then optional AWS artifact track
```

Do not create AWS resources until you can read `terraform plan`, preserve state, run `terraform destroy`, and verify cleanup.

## References

- [Install kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
- [kind Quick Start](https://kind.sigs.k8s.io/docs/user/quick-start/)
- [Install Terraform](https://developer.hashicorp.com/terraform/install)
- [Install AWS CLI v2 on Linux](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
