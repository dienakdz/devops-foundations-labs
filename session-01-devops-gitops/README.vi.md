# Session 01 - Nguyên Lý DevOps & GitOps

English version: [README.md](README.md)

## Mục Tiêu

Session này không phải học một tool cụ thể, mà học cách vận hành hệ thống.

DevOps trả lời câu hỏi:

```text
Làm sao đưa code lên production nhanh hơn, ít lỗi hơn, rõ trách nhiệm hơn, và có thể rollback?
```

GitOps trả lời câu hỏi:

```text
Làm sao để Git trở thành nguồn sự thật cho thay đổi của ứng dụng và hạ tầng?
```

## Ý Chính

- DevOps là cách làm việc kết hợp development, operations, automation, và feedback.
- GitOps nghĩa là trạng thái mong muốn của hệ thống được khai báo trong Git.
- Mọi thay đổi nên có lịch sử, được review, kiểm tra được, và rollback được.
- Deployment nên tái tạo được từ file, không phụ thuộc vào thao tác click tay không có ghi nhận.

## Khi Nào Dùng GitOps

Dùng GitOps khi bạn muốn:

- Cấu hình deployment nằm trong Git.
- Thay đổi production đi qua pull request.
- Biết rõ ai đổi gì, đổi lúc nào.
- Rollback bằng cách quay lại commit cũ.
- Cluster hoặc deployment system tự đồng bộ theo file trong Git.

## Luồng Cần Nhớ

```text
Developer sửa file
-> commit lên Git
-> mở pull request
-> review và merge
-> CI/CD hoặc GitOps controller apply thay đổi
-> hệ thống chạy theo trạng thái được khai báo trong Git
```

## Thực Hành

Mở `app-config.yaml` và đổi:

```yaml
replicas: 2
imageTag: "1.0.0"
```

thành:

```yaml
replicas: 3
imageTag: "1.0.1"
```

Trong dự án thật, thay đổi kiểu này sẽ được commit, review, merge, rồi pipeline hoặc GitOps tool apply.

### Thực Hành Luồng Thay Đổi Git

Từ repository root:

```bash
git switch -c practice/session-01-config-change
```

Sửa `app-config.yaml`, rồi xem chính xác phần đã đổi:

```bash
git status
git diff -- session-01-devops-gitops/app-config.yaml
```

Ghi desired-state change vào lịch sử:

```bash
git add session-01-devops-gitops/app-config.yaml
git commit -m "practice: scale demo app to three replicas"
git show --stat --oneline HEAD
```

Trong team, branch này sẽ được push và review qua pull request. Thực hành rollback có lịch sử rõ ràng bằng một commit mới đảo ngược thay đổi:

```bash
git revert --no-edit HEAD
git log --oneline -3
```

`git revert` giữ cả thay đổi gốc và lần rollback trong history. Cách này an toàn hơn rewrite history trên shared branch.

## CI/CD Khác GitOps

```text
CI kiểm tra source change có hợp lệ không.
CD build, publish hoặc deploy artifact.
GitOps liên tục đưa target system về desired state lưu trong Git.
```

Một GitHub Actions workflow chạy `kubectl apply` là CI/CD automation, nhưng chưa tự động là full GitOps. GitOps controller như Argo CD hoặc Flux thường chạy gần cluster và liên tục phát hiện drift.

## Tự Kiểm Tra

- Trạng thái mong muốn trong `app-config.yaml` là gì?
- Nếu deploy lỗi, bạn sẽ rollback về commit nào?
- Những thay đổi nào nên đi qua pull request?

## Kết Luận

GitOps không thay thế Docker, Kubernetes, Terraform, hay CI/CD. Nó là mô hình vận hành:

```text
Git lưu trạng thái mong muốn của hệ thống.
```
