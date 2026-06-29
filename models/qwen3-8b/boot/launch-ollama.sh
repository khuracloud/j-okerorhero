#!/bin/bash
# Qwen3 8B — Ollama (most compatible)
set -euo pipefail
cd "$(dirname "$0")/.."
MODEL="qwen3-8b"
ollama create "$MODEL" -f boot/Modelfile 2>/dev/null || true
exec ollama run "$MODEL"
