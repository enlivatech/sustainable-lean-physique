#!/usr/bin/env bash
# 用 Chrome 無頭模式重新產生手冊 PDF 和對比圖。
# 用法：./build.sh            （可用 CHROME=/path/to/chrome 指定瀏覽器）
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

"$CHROME" --headless=new --disable-gpu --user-data-dir="$PROFILE" --no-pdf-header-footer \
  --print-to-pdf="$ROOT/可持續薄肌手冊.pdf" "file:///$ROOT/src/handbook.html"

"$CHROME" --headless=new --disable-gpu --hide-scrollbars --user-data-dir="$PROFILE" \
  --force-device-scale-factor=2 --window-size=1080,1350 \
  --screenshot="$ROOT/原版vs可持續版.png" "file:///$ROOT/src/comparison.html"
