# Session 02 - Containerization Basics

Vietnamese version: [README.vi.md](README.vi.md)

## Purpose

This session explains how to package an application into a Docker image and run that image as a container.

Without containers, every environment must manually provide the right runtime and dependencies:

```text
Machine A has Python 3.12 -> works
Machine B has Python 3.9 -> may fail
Server misses dependencies -> may fail
```

With Docker:

```text
Docker image = OS base + runtime + dependencies + app code + start command
```

## Files

- `app.py`: a small FastAPI application.
- `requirements.txt`: Python dependencies.
- `Dockerfile`: instructions for building the image.
- `.dockerignore`: files Docker should ignore during build.

## Key Concepts

```text
Dockerfile = build recipe
Image      = packaged application template
Container  = running instance of an image
```

You must have an image before Docker can create a container. If the image is not local, Docker can pull it from a registry such as Docker Hub or AWS ECR.

## Lab

Use WSL/Linux shell:

```bash
cd /mnt/d/DevOps/Ops/session-02-containerization-basics
docker build -t devops-demo-api:session-02 .
```

Run the container:

```bash
docker run --rm -p 8002:8000 devops-demo-api:session-02
```

Open another terminal and test:

```bash
curl http://localhost:8002
```

Expected response:

```json
{"message":"Hello from Docker","session":"02-containerization-basics"}
```

Stop the container with `Ctrl+C`.

## Port Mapping

```text
-p 8002:8000
```

means:

```text
host port 8002 -> container port 8000
```

The FastAPI app listens on port `8000` inside the container. You access it from your machine through `localhost:8002`.

## Rebuild After Code Changes

If you change `app.py`, rebuild the image:

```bash
docker build -t devops-demo-api:session-02 .
```

Then stop the old container and run a new container from the updated image.

Using the same tag points `devops-demo-api:session-02` to the newly built image. A container that is already running does not automatically update.

## Useful Commands

```bash
docker images
docker ps
docker ps -a
docker logs <container-name-or-id>
docker image prune
```

## Takeaway

Docker answers this question:

```text
How do we package an app so it runs consistently across machines, servers, and cloud environments?
```
