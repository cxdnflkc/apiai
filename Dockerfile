FROM ghcr.io/ggml-org/llama.cpp:server

RUN wget -O /models/next2-0.8b.gguf https://huggingface.co/thelamapi/next2-0.8b-GGUF/resolve/main/next2-0.8b-Q4_K_M.gguf

ENV API_KEY="sk-riseadamim1212"

CMD ["sh", "-c", "llama-server -m /models/next2-0.8b.gguf --host 0.0.0.0 --port ${PORT:-8080} --api-key ${API_KEY}"]
