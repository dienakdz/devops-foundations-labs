#!/usr/bin/env bash
set -u

tools=(git docker kind kubectl terraform aws)

for tool in "${tools[@]}"; do
  if command -v "$tool" >/dev/null 2>&1; then
    printf '[OK]      %s -> %s\n' "$tool" "$(command -v "$tool")"
  else
    printf '[MISSING] %s\n' "$tool"
  fi
done

echo
if command -v docker >/dev/null 2>&1; then
  docker version --format 'Docker client={{.Client.Version}} server={{.Server.Version}}' 2>/dev/null || echo 'Docker CLI exists, but Docker daemon is not reachable.'
fi

if command -v docker >/dev/null 2>&1; then
  docker compose version 2>/dev/null || echo 'Docker Compose plugin is not available.'
fi

if command -v kubectl >/dev/null 2>&1; then
  kubectl config current-context 2>/dev/null || echo 'kubectl exists, but no current cluster context is configured.'
fi
