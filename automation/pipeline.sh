#!/usr/bin/env bash
set -e

MSG="${1:-update: cambios}"

echo "📌 Repo root: $(pwd)"
echo "📝 Mensaje: $MSG"
echo "🔍 Verificando cambios..."

# 1) Validación: debe existir notas.txt en la raíz del repo
if [ ! -f "notas.txt" ]; then
  echo "❌ Error: notas.txt no existe en la raíz del repo."
  echo "👉 Crealo con: nano notas.txt"
  exit 1
fi

# 2) Mostrar estado (info)
git status --porcelain

# 3) Si no hay cambios, cortar
if git diff --quiet && git diff --cached --quiet; then
  echo "✅ No hay cambios para commitear."
  exit 0
fi

echo "➕ Agregando cambios..."
git add notas.txt automation/*.sh 2>/dev/null || true

echo "✅ Commit..."
git commit -m "$MSG" || {
  echo "✅ No hubo nada para commitear."
  exit 0
}

echo "🚀 Push..."
git push

echo "🎉 Listo. CI debería ejecutarse en GitHub Actions."

