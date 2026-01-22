#!/bin/bash

ARCHIVO="../notas.txt"
BACKUP_DIR="backups"
FECHA=$(date +"%Y-%m-%d_%H-%M-%S")

echo "🔎 Verificando archivo..."

if [ ! -f "$ARCHIVO" ]; then
  echo "❌ Error: el archivo no existe"
  exit 1
fi

echo "📁 Creando carpeta de backups..."
mkdir -p "$BACKUP_DIR"

echo "📦 Creando backup..."
cp "$ARCHIVO" "$BACKUP_DIR/notas_$FECHA.txt"

echo "✅ Backup creado correctamente"

