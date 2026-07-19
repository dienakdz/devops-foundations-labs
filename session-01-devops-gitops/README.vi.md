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

## Tự Kiểm Tra

- Trạng thái mong muốn trong `app-config.yaml` là gì?
- Nếu deploy lỗi, bạn sẽ rollback về commit nào?
- Những thay đổi nào nên đi qua pull request?

## Kết Luận

GitOps không thay thế Docker, Kubernetes, Terraform, hay CI/CD. Nó là mô hình vận hành:

```text
Git lưu trạng thái mong muốn của hệ thống.
```
