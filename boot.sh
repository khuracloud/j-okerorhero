#!/bin/bash
# Local AI archive — interactive launcher
# Location: ~/llm-models
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"

echo "=== Local AI Archive ==="
echo ""
echo "  BOOTABLE MODELS (GGUF ready)"
echo "    1) DeepSeek R1 7B  — reasoning/coding  (~5 GB VRAM)"
echo "    2) Qwen3 8B        — general purpose    (~5 GB VRAM)"
echo ""
echo "  RUNTIME"
echo "    o) Ollama          (recommended)"
echo "    l) llama.cpp       (OpenAI API :8080)"
echo ""
echo "  DEV TOOLS (cloned source)"
echo "    c) Cline           ~/llm-models/dev-repos/cline"
echo "    d) List all repos  ~/llm-models/dev-repos/"
echo ""
echo "  DOCS"
echo "    m) Manpages        ~/llm-models/manpages/debian/"
echo "    v) Void Linux      ~/llm-models/void-linux/"
echo ""
read -rp "Choice [1/2/o/l/c/d/m/v/q]: " choice

case "$choice" in
  1|o1) exec "$ROOT/models/deepseek-r1-7b/boot/launch-ollama.sh" ;;
  2|o2) exec "$ROOT/models/qwen3-8b/boot/launch-ollama.sh" ;;
  o)
    read -rp "Model [1=DeepSeek R1 / 2=Qwen3]: " m
    case "$m" in 1) exec "$ROOT/models/deepseek-r1-7b/boot/launch-ollama.sh" ;; 2) exec "$ROOT/models/qwen3-8b/boot/launch-ollama.sh" ;; *) echo "Invalid"; exit 1 ;; esac
    ;;
  l)
    read -rp "Model [1=DeepSeek R1 / 2=Qwen3]: " m
    case "$m" in 1) exec "$ROOT/models/deepseek-r1-7b/boot/launch-llamacpp.sh" ;; 2) exec "$ROOT/models/qwen3-8b/boot/launch-llamacpp.sh" ;; *) echo "Invalid"; exit 1 ;; esac
    ;;
  c) echo "Cline source: $ROOT/dev-repos/cline/source/"; echo "Install: npm install -g cline"; ls "$ROOT/dev-repos/cline/source/" 2>/dev/null | head -5 ;;
  d) ls -1 "$ROOT/dev-repos/" ;;
  m) ls "$ROOT/manpages/debian/" 2>/dev/null; echo "Read man: man -l <file> or zless manpages/..." ;;
  v) ls "$ROOT/void-linux/" ;;
  q) exit 0 ;;
  *) echo "Unknown choice"; exit 1 ;;
esac
