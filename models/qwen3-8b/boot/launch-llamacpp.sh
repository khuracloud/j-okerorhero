#!/bin/bash
# Qwen3 8B — llama.cpp OpenAI API on :8080
set -euo pipefail
cd "$(dirname "$0")/.."
GGUF="gguf/Qwen3-8B-Q4_K_M.gguf"
SERVER="${LLAMA_SERVER:-llama-server}"
exec "$SERVER" -m "$GGUF" --host 0.0.0.0 --port 8080 -c 8192 -ngl 99
