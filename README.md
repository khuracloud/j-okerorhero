# j-okerorhero — Local AI & Dev Archive

**Path:** `~/llm-models` (~40 GB)

## Quick start

```bash
cd ~/llm-models
./boot.sh          # interactive menu

# Or direct:
./models/deepseek-r1-7b/boot/launch-ollama.sh
./models/qwen3-8b/boot/launch-ollama.sh
```

### Prerequisites

| Tool | Install | Use |
|------|---------|-----|
| **Ollama** | https://ollama.com | Easiest — `launch-ollama.sh` |
| **llama.cpp** | https://github.com/ggml-org/llama.cpp | `launch-llamacpp.sh` → API at `http://localhost:8080/v1` |

Point Cline, Continue, or any OpenAI client at `http://localhost:8080/v1` with key `local`.

## Bootable models (complete)

| Model | VRAM (Q4) | Best for | GGUF |
|-------|-----------|----------|------|
| **DeepSeek R1 7B** | ~5 GB | Reasoning, math, code | ✓ |
| **Qwen3 8B** | ~5 GB | General, multilingual | ✓ |

Each model has:
- `gguf/` — quantized weights (Ollama + llama.cpp)
- `huggingface/` — safetensors (transformers/vLLM)
- `source/` — upstream GitHub repo
- `boot/Modelfile` + `launch-*.sh`

## Dev repos (clone-ready source)

`dev-repos/` — 20+ major projects including **Cline**, Ollama, llama.cpp, vLLM, Dify, LangChain, OpenHands, OpenCode, Continue, and more.

```bash
# Cline from source
cd dev-repos/cline/source/*/ 
npm install && npm run build
# Or: npm install -g cline
```

## Docs

| Path | Contents |
|------|----------|
| `manpages/debian/` | Debian manpages (upstream tarball + binary .deb extracted) |
| `void-linux/` | void-packages, handbook, docs, mklive |

## Layout

```
~/llm-models/
├── boot.sh                 ← start here
├── models/
│   ├── deepseek-r1-7b/
│   └── qwen3-8b/
├── dev-repos/              ← Cline, Ollama, vLLM, etc.
├── manpages/
└── void-linux/
```

## Ollama one-liners (alternative)

```bash
ollama create deepseek-r1-7b -f ~/llm-models/models/deepseek-r1-7b/boot/Modelfile
ollama run deepseek-r1-7b

ollama create qwen3-8b -f ~/llm-models/models/qwen3-8b/boot/Modelfile
ollama run qwen3-8b
```

Frontier models (Kimi K2.6, GLM-5.1, DeepSeek V4 Pro, etc.) were omitted — they need 48–500+ GB storage and multi-GPU. Pull via Ollama cloud when needed:

```bash
ollama pull deepseek-v4-flash
ollama pull kimi-k2.6:cloud
```
