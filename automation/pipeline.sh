#!/bin/bash
set -e

MENSAJE="$1"

if [ -z "$MENSAJE" ]; then
  echo "❌ Tenés que pasar un mensaje de commit"
  exit 1
fi

echo "🔎 Verificando cambios..."
CHANGES=$(git status --porcelain)

if [ -z "$CHANGES" ]; then
  echo "⚠️ No hay cambios para commitear. Pipeline detenido."
  exit 0
fi

echo "📦 Commit automático"
./autocommit.sh "$MENSAJE"

COMMITS=$(git log origin/main..HEAD --oneline | wc -l)

if [ "$COMMITS" -eq 0 ]; then
  echo "⚠️ No hubo commits nuevos. No se hace push."
  exit 0
fi

echo "🚀 Push automático"
./autopush.sh

echo "✅ Pipeline finalizado con éxito"
