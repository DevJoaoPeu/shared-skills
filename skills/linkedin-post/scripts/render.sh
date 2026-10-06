#!/usr/bin/env bash
# Renderiza slides.html em slide-NN.png (1080x1350) e, com mais de um slide, carrossel.pdf.
# Uso: render.sh <slides.html> <pasta-de-saída>
set -euo pipefail

WIDTH=1080
HEIGHT=1350
# Tempo para carregar fontes web; offline o CSS cai nas fontes do sistema.
FONT_BUDGET_MS=4000

[ $# -eq 2 ] || { echo "uso: $0 <slides.html> <pasta-de-saída>" >&2; exit 2; }
html="$(realpath "$1")"
out="$(mkdir -p "$2" && realpath "$2")"
[ -f "$html" ] || { echo "arquivo não encontrado: $1" >&2; exit 1; }

chrome="${CHROME:-}"
if [ -z "$chrome" ]; then
  for candidate in google-chrome google-chrome-stable chromium chromium-browser; do
    command -v "$candidate" >/dev/null && { chrome="$candidate"; break; }
  done
fi
[ -n "$chrome" ] || { echo "Chrome/Chromium não encontrado; defina CHROME=<binário>" >&2; exit 1; }

total="$(grep -oE '<section class="slide[ "]' "$html" | wc -l)"
[ "$total" -gt 0 ] || { echo "nenhum <section class=\"slide\"> em $html" >&2; exit 1; }

# Perfil isolado: não toca no perfil do Chrome do usuário.
profile="$(mktemp -d)"
trap 'rm -rf "$profile"' EXIT
run_chrome() {
  "$chrome" --headless=new --disable-gpu --hide-scrollbars --no-first-run \
    --user-data-dir="$profile" --virtual-time-budget="$FONT_BUDGET_MS" "$@" 2>/dev/null
}

rm -f "$out"/slide-[0-9][0-9].png
for i in $(seq 1 "$total"); do
  png="$out/$(printf 'slide-%02d.png' "$i")"
  run_chrome --window-size="$WIDTH,$HEIGHT" --screenshot="$png" "file://$html?slide=$i"
  [ -s "$png" ] || { echo "falha ao gerar $png" >&2; exit 1; }
  echo "+ $png"
done

if [ "$total" -gt 1 ]; then
  pdf="$out/carrossel.pdf"
  run_chrome --no-pdf-header-footer --print-to-pdf="$pdf" "file://$html"
  [ -s "$pdf" ] || { echo "falha ao gerar $pdf" >&2; exit 1; }
  echo "+ $pdf"
fi
