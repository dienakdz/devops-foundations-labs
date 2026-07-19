# Session 07 - AWS DevOps Pipeline

## Ban Chat

Pipeline dung de tu dong hoa cac buoc lap di lap lai:

```text
Push code
-> test
-> build Docker image
-> push image len registry
-> deploy len environment
```

Voi AWS, flow pho bien:

```text
GitHub Actions/GitLab CI/AWS CodePipeline
-> Docker build
-> Push image len Amazon ECR
-> Deploy len ECS/EKS/EC2
```

## File Trong Session Nay

- `github-actions-ecr-template.yml`: template pipeline build va push image len ECR.
- `pipeline-flow.md`: giai thich tung buoc pipeline.

## Khi Nao Dung Pipeline

Dung khi:

- Khong muon deploy tay.
- Muon moi commit deu duoc test.
- Muon image duoc build theo chuan.
- Muon deploy co log, co lich su, co rollback.

## Secret Can Co

Pipeline can credential de goi AWS. Cach nen dung trong production la OIDC role, khong hardcode AWS access key trong repo.

Voi GitHub Actions, thuong can:

```text
AWS_ROLE_TO_ASSUME
AWS_REGION
ECR_REPOSITORY
```

## Ket Luan

Pipeline tra loi cau hoi:

```text
Lam sao bien push code thanh build/test/deploy tu dong?
```

