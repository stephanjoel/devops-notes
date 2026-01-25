#!/bin/bash
set -e

# Ir a la raíz del repo, aunque ejecutes el script desde otro lado
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

MSG="${1:-chore: cambios automaticos}"

echo "📌 Repo root: $REPO_ROOT"
echo "🧾 Mensaje: $MSG"

echo "🔍 Verificando cambios..."
git status --porcelain

if [ -z "$(git status --porcelain)" ]; then
  echo "✅ No hay cambios. No se commitea ni pushea."
  exit 0
fi

echo "➕ Agregando cambios..."
git add -A

echo "🧱 Commit..."
git commit -m "$MSG"

echo "🚀 Push..."
git push

echo "🎉 Listo. CI debería ejecutarse en GitHub Actions."

