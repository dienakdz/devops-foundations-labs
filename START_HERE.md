# Start Here

Vietnamese version: [START_HERE.vi.md](START_HERE.vi.md)

If you feel lost, do not start by memorizing tool names. Start from operational questions.

## 1. Learning Path By Question

### Question 1: How does my app run?

Study:

```text
session-02-containerization-basics
```

You should understand:

```text
A Dockerfile turns source code into a Docker image.
A Docker image is the deployable artifact.
A container is a running instance of an image.
```

### Question 2: How do I run multiple local services?

Study:

```text
session-03-docker-compose-multi-service
```

You should understand:

```text
docker-compose.yml can run an API plus Redis/database/cache with one command.
Service names work as internal DNS names inside the Compose network.
```

### Question 3: Who manages containers in production?

Study:

```text
session-04-kubernetes-core-objects
```

You should understand:

```text
Deployment manages Pods.
Service gives Pods a stable network endpoint.
Ingress exposes HTTP/domain traffic.
```

### Question 4: Where do passwords, config, and data live?

Study:

```text
session-05-k8s-config-storage
```

You should understand:

```text
ConfigMap stores non-sensitive config.
Secret stores credentials.
PVC stores persistent data.
```

### Question 5: How do I create AWS resources safely?

Study:

```text
session-06-terraform-iac-basics
```

You should understand:

```text
Terraform creates, updates, and destroys infrastructure from .tf files.
terraform plan previews changes.
terraform apply creates or updates resources.
terraform destroy deletes resources managed by Terraform.
```

### Question 6: Do I deploy manually after every push?

Study:

```text
session-07-aws-devops-pipeline
```

You should understand:

```text
A pipeline can test code, build a Docker image, push it to ECR, and deploy it.
```

### Question 7: How do all pieces fit together?

Study:

```text
session-08-final-project
```

You should understand:

```text
Source -> Docker image -> ECR -> Kubernetes/ECS/EKS -> pipeline
AWS infrastructure -> Terraform
```

## 2. Recommended Order

Use this order:

```text
1. README.md overview
2. START_HERE.md
3. session-02
4. session-03
5. session-06 local-no-cost
6. session-04
7. session-05
8. session-06 aws-s3-demo
9. session-07
10. session-08
11. revisit session-01 to understand GitOps after seeing the tools
```

Why revisit session 01 later: GitOps is an operating model. It is easier to understand after you have seen Docker, Compose, Kubernetes, Terraform, and CI/CD in action.

If you use WSL, also read:

```text
WSL_SETUP.md
```

## 3. Memory Hook

```text
Docker packages the app.
Compose runs multiple local services.
Kubernetes operates containers on a cluster.
ConfigMap/Secret/PVC provide config and data to apps.
Terraform creates cloud infrastructure.
Pipeline automates build and deployment.
GitOps keeps desired state in Git.
```

## 4. Safe AWS Workflow

Before creating AWS resources:

```bash
aws sts get-caller-identity
```

Confirm the account is correct.

Before creating or changing resources:

```bash
terraform plan
```

Only apply when you understand what the plan will create or change:

```bash
terraform apply
```

After the lab:

```bash
terraform destroy
```

After destroy, check AWS Console for leftovers:

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

## 5. Skill Checklist

You can consider the foundation solid when you can:

- Write a Dockerfile for a small app.
- Run app plus database/cache with Docker Compose.
- Write a Kubernetes Deployment and Service.
- Pass config through ConfigMap and Secret.
- Create a small AWS resource with Terraform.
- Destroy that resource with Terraform.
- Explain how a pipeline builds an image and pushes it to ECR.
- Explain why Terraform cannot automatically delete resources created manually in AWS Console.
