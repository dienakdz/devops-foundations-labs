# Session 01 - DevOps Principles & GitOps

## Ban Chat

Session nay khong phai hoc mot tool cu the, ma hoc cach lam viec.

DevOps tra loi cau hoi:

```text
Lam sao de tu code den production nhanh hon, it loi hon, co the rollback va kiem soat duoc?
```

GitOps tra loi cau hoi:

```text
Lam sao de moi thay doi deu di qua Git, co lich su, review, rollback?
```

## Khi Nao Dung

Dung GitOps khi ban muon:

- Deployment config nam trong Git.
- Thay doi production phai qua pull request.
- Muon rollback bang cach quay lai commit cu.
- Muon cluster/app tu dong dong bo theo file trong repo.

## Flow De Nho

```text
Developer sua file
-> Commit len Git
-> Pull request/review
-> Merge
-> CI/CD hoac GitOps controller apply thay doi
-> He thong chay theo dung trang thai trong Git
```

## Vi Du

File `app-config.yaml` trong session nay gia lap mot cau hinh deployment. Ban hay mo file do va sua:

```yaml
replicas: 2
imageTag: "1.0.0"
```

thanh:

```yaml
replicas: 3
imageTag: "1.0.1"
```

Trong doi that, thay doi nhu vay se duoc commit len Git va pipeline/GitOps tool se deploy.

## Bai Tap

1. Sua `replicas` trong `app-config.yaml`.
2. Commit thay doi bang Git.
3. Tu tra loi: neu deploy loi, rollback bang cach nao?

## Ket Luan

GitOps khong thay Docker, Kubernetes hay Terraform. No la cach van hanh:

```text
Git la noi khai bao trang thai mong muon cua he thong.
```

