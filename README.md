# AWS DevOps Foundations Labs

Vietnamese version: [README.vi.md](README.vi.md)

This repository is a hands-on practice workspace for an AWS-focused DevOps foundations course.

The goal is to connect the sessions into one practical deployment path:

```text
source code
-> Docker image
-> Docker Compose local stack
-> Kubernetes manifests
-> Terraform-managed AWS infrastructure
-> CI/CD pipeline
-> final end-to-end project
```

## Sessions

| Session | Topic | Main Question |
| --- | --- | --- |
| 01 | DevOps Principles & GitOps | How do teams manage changes through Git? |
| 02 | Containerization Basics | How do we package an app into a Docker image? |
| 03 | Docker Compose Multi-Service | How do we run multiple local services together? |
| 04 | Kubernetes Core Objects | How do we run containers on a cluster? |
| 05 | K8s Config & Storage | How do we manage config, secrets, and persistent data? |
| 06 | Terraform IaC Basics | How do we create and destroy AWS infrastructure with code? |
| 07 | AWS DevOps Pipeline | How do we automate test, build, push, and deploy? |
| 08 | Final Project | How do all pieces fit into one deployment flow? |

## Repository Structure

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

Each session has:

```text
README.md     English guide
README.vi.md  Vietnamese guide, when translated
```

Sessions 1, 2, 3, and 4 currently have bilingual README files.

## Recommended Learning Order

Start with:

```text
START_HERE.md
```

Recommended order:

```text
1. session-02: Docker basics
2. session-03: Docker Compose
3. session-06/local-no-cost: Terraform without AWS cost
4. session-04: Kubernetes core objects
5. session-05: Kubernetes config and storage
6. session-06/aws-s3-demo: Terraform with AWS
7. session-07: AWS pipeline
8. session-08: final project
9. session-01: revisit GitOps after seeing the tools
```

Session 01 is conceptually important, but it is easier to understand after you have seen Docker, Compose, Kubernetes, Terraform, and CI/CD in practice.

## Concept Map

| Layer | Tool | Purpose |
| --- | --- | --- |
| Source of truth | Git | History, review, rollback |
| App packaging | Docker | Package app into a portable image |
| Local multi-service | Docker Compose | Run app plus dependencies locally |
| Container orchestration | Kubernetes | Run, scale, restart, and update containers |
| Runtime config | ConfigMap, Secret, PVC | Provide config, credentials, and persistent data |
| Cloud infrastructure | Terraform | Create, update, and destroy AWS resources with code |
| Automation | CI/CD pipeline | Test, build, push image, and deploy automatically |

## Prerequisites

Install the tools gradually as you reach each session:

- Git
- Docker Engine or Docker Desktop
- Docker Compose
- Terraform
- kubectl
- A local Kubernetes cluster such as kind, minikube, or Docker Desktop Kubernetes
- AWS CLI
- A personal AWS account for labs, not a production account

If you use WSL instead of Docker Desktop, read:

```text
WSL_SETUP.md
```

## AWS Cost Safety Rules

- If Terraform creates a resource, destroy it with `terraform destroy`.
- Do not delete `.tf` files before running `terraform destroy`.
- Do not delete Terraform state files before destroying resources.
- Always run `terraform plan` before `terraform apply`.
- Always run `terraform plan` before `terraform destroy`.
- Always check the AWS account and region before creating resources.
- After a lab, check AWS Console for leftover resources such as EC2, EKS, ECS, RDS, NAT Gateway, Load Balancer, EBS, ECR, S3, and CloudWatch Logs.
- If you create something manually in AWS Console, Terraform will not automatically know about it unless you import it into Terraform state.

## License

This repository is intended for learning and practice.
