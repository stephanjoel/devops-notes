#!/bin/bash
set -e

# Este script hace push del branch actual al remoto "origin"
# y te muestra qué branch estás subiendo.

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "❌ No estás en un repo Git."
  exit 1
fi

BRANCH="$(git branch --show-current)"

if [ -z "$BRANCH" ]; then
  echo "❌ No pude detectar el branch actual."
  exit 1
fi

echo "🚀 Haciendo push de: $BRANCH → origin/$BRANCH"
git push -u origin "$BRANCH"

echo "✅ Push OK"

