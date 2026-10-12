#!/usr/bin/env bash
# 用 Chrome 無頭模式重新產生三種語言的手冊 PDF 和對比圖。
# 用法：./build.sh            （可用 CHROME=/path/to/chrome 指定瀏覽器）
# 简体版原始檔由 tools/zh_hans.py 從繁體版產生，改繁體版後先跑它。
set -euo pipefail
cd "$(dirname "$0")"

CHROME="${CHROME:-}"
if [ -z "$CHROME" ]; then
  for c in "/c/Program Files/Google/Chrome/Application/chrome.exe" \
           "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
           google-chrome chromium chromium-browser; do
    if [ -x "$c" ] || command -v "$c" >/dev/null 2>&1; then CHROME="$c"; break; fi
  done
fi
[ -n "$CHROME" ] || { echo "找不到 Chrome，請用 CHROME=... 指定" >&2; exit 1; }

ROOT="$(pwd)"
command -v cygpath >/dev/null 2>&1 && ROOT="$(cygpath -m "$ROOT")"
PROFILE="$(mktemp -d)"
trap 'rm -rf "$PROFILE"' EXIT

render() {  # render <語言資料夾> <手冊檔名> <對比圖檔名>
  local lang="$1"
  mkdir -p "$ROOT/$lang"
  "$CHROME" --headless=new --disable-gpu --user-data-dir="$PROFILE" --no-pdf-header-footer \
    --print-to-pdf="$ROOT/$lang/$2" "file:///$ROOT/src/$lang/handbook.html"
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --user-data-dir="$PROFILE" \
    --force-device-scale-factor=2 --window-size=1080,1350 \
    --screenshot="$ROOT/$lang/$3" "file:///$ROOT/src/$lang/comparison.html"
}

render zh-Hant "可持續薄肌手冊.pdf" "原版vs可持續版.png"
render zh-Hans "可持续薄肌手册.pdf" "原版vs可持续版.png"
render en "Sustainable-Lean-Physique-Handbook.pdf" "Original-vs-Sustainable.png"
