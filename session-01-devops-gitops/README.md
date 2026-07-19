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

## Check Yourself

- What is the desired state in `app-config.yaml`?
- If a deployment fails, which Git commit would you revert to?
- Which changes should go through pull request review?

## Takeaway

GitOps does not replace Docker, Kubernetes, Terraform, or CI/CD. It is an operating model:

```text
Git stores the desired state of the system.
```
