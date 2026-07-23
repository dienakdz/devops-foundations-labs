# Session 01 - DevOps Principles & GitOps

Vietnamese version: [README.vi.md](README.vi.md)

## Purpose

This session is about operating principles, not a specific tool.

DevOps answers this question:

```text
How do we move from code to production faster, with fewer errors, clearer ownership, and rollback capability?
```

GitOps answers this question:

```text
How do we make Git the source of truth for application and infrastructure changes?
```

## Core Ideas

- DevOps is a way of working across development, operations, automation, and feedback.
- GitOps means desired system state is declared in Git.
- Changes should be reviewed, versioned, auditable, and reversible.
- A deployment should be reproducible from files, not from undocumented manual clicks.

## When To Use GitOps

Use GitOps when you want:

- Deployment configuration stored in Git.
- Production changes reviewed through pull requests.
- A clear history of who changed what and when.
- Rollback by reverting to a previous commit.
- A cluster or deployment system that syncs itself from Git.

## Mental Flow

```text
Developer changes a file
-> commit to Git
-> open pull request
-> review and merge
-> CI/CD or GitOps controller applies the change
-> the system moves toward the state declared in Git
```

## Practice

Open `app-config.yaml` and change:

```yaml
replicas: 2
imageTag: "1.0.0"
```

to:

```yaml
replicas: 3
imageTag: "1.0.1"
```

In a real project, this type of change would be committed, reviewed, merged, and then applied by a pipeline or GitOps tool.

### Practice The Git Change Flow

From the repository root:

```bash
git switch -c practice/session-01-config-change
```

Edit `app-config.yaml`, then inspect exactly what changed:

```bash
git status
git diff -- session-01-devops-gitops/app-config.yaml
```

Record the desired-state change:

```bash
git add session-01-devops-gitops/app-config.yaml
git commit -m "practice: scale demo app to three replicas"
git show --stat --oneline HEAD
```

In a team, this branch would be pushed and reviewed in a pull request. Practice an auditable rollback by creating a new commit that reverses the change:

```bash
git revert --no-edit HEAD
git log --oneline -3
```

`git revert` keeps both the original change and the rollback in history. That is safer for shared branches than rewriting history.

## CI/CD Versus GitOps

```text
CI checks whether source changes are valid.
CD builds, publishes, or deploys an artifact.
GitOps continuously reconciles a target system with desired state stored in Git.
```

A GitHub Actions workflow that runs `kubectl apply` is CI/CD automation, but it is not automatically full GitOps. A GitOps controller such as Argo CD or Flux normally runs near the cluster and continuously detects drift.

## Check Yourself

- What is the desired state in `app-config.yaml`?
- If a deployment fails, which Git commit would you revert to?
- Which changes should go through pull request review?

## Takeaway

GitOps does not replace Docker, Kubernetes, Terraform, or CI/CD. It is an operating model:

```text
Git stores the desired state of the system.
```
