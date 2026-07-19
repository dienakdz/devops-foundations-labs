# Pipeline Flow

## 1. Developer Push Code

Code duoc push len Git.

## 2. CI Checkout

Runner lay source code ve.

## 3. Test

Chay unit test, lint, security scan neu co.

## 4. Login AWS

Runner lay quyen AWS bang OIDC role hoac credential duoc quan ly an toan.

## 5. Login ECR

Runner dang nhap Amazon Elastic Container Registry.

## 6. Build Docker Image

Build image tu `Dockerfile`.

## 7. Push Image

Push image len ECR voi tag, vi du commit SHA.

## 8. Deploy

Cap nhat ECS service, Kubernetes deployment, hoac EC2 tuy kien truc.

