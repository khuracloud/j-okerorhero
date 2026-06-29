#!/bin/bash
# DeepSeek R1 Distill 7B — Ollama (most compatible)
set -euo pipefail
cd "$(dirname "$0")/.."
MODEL="deepseek-r1-7b"
ollama create "$MODEL" -f boot/Modelfile 2>/dev/null || true
exec ollama run "$MODEL"
