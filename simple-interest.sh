#!/usr/bin/env bash
# simple-interest.sh - Calcula interés simple: I = P * R * T / 100

set -euo pipefail

if [ "$#" -ne 3 ]; then
  echo "Uso: $0 <principal> <tasa_anual_%> <tiempo_en_anios>"
  exit 1
fi

P="$1"; R="$2"; T="$3"
re='^-?[0-9]+([.][0-9]+)?$'
for x in "$P" "$R" "$T"; do
  if ! [[ $x =~ $re ]]; then
    echo "Error: todos los parámetros deben ser numéricos"
    exit 2
  fi
done

I=$(awk -v P="$P" -v R="$R" -v T="$T" 'BEGIN { printf "%.2f", P*R*T/100 }')
F=$(awk -v P="$P" -v I="$I" 'BEGIN { printf "%.2f", P + I }')

echo "Interés simple: $I"
echo "Monto final (P + I): $F"
