#!/bin/bash
set -e

LOG="logs/app.log"
MAX_ERRORS=2

# Validar que exista el archivo
if [ ! -f "$LOG" ]; then
  echo "❌ No existe el log: $LOG"
  exit 2
fi

ERRORS=$(grep -c "ERROR" "$LOG" || true)
WARNS=$(grep -c "WARN" "$LOG" || true)
LAST_ERRORS=$(grep "ERROR" "$LOG" | tail -n 3 || true)

echo "📄 Log: $LOG"
echo "🧮 ERRORES: $ERRORS | WARNINGS: $WARNS | UMBRAL: $MAX_ERRORS"
echo "🕒 Últimas líneas:"
tail -n 5 "$LOG"
echo

if [ "$ERRORS" -ge "$MAX_ERRORS" ]; then
  echo "🚨 FALLA: demasiados errores (>= $MAX_ERRORS)"
  echo "🔎 Últimos errores:"
  echo "$LAST_ERRORS"
  exit 1
else
  echo "✅ OK: errores por debajo del umbral"
  exit 0
fi

