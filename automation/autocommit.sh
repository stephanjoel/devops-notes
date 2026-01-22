#!/bin/bash
set -e

# Uso:
# ./autocommit.sh "mensaje del commit"

MSG="$1"

if [ -z "$MSG" ]; then
  echo "❌ Tenés que pasar un mensaje de commit."
  echo "Ejemplo: ./autocommit.sh \"Actualizo notas\""
  exit 1
fi

# Asegura que estamos dentro de un repositorio Git
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "❌ Esto no parece un repositorio Git. Andá a la carpeta correcta (ej: ~/devops)."
  exit 1
fi

echo "📌 Repo: $(basename "$(git rev-parse --show-toplevel)")"
echo "🔎 Estado actual:"
git status

# Si no hay cambios, salimos
if git diff --quiet && git diff --cached --quiet; then
  echo "✅ No hay cambios para commitear."
  exit 0
fi

echo "➕ Agregando cambios..."
git add -A

echo "🧾 Commit..."
git commit -m "$MSG"

echo "✅ Listo. Último commit:"
git log --oneline -n 1

