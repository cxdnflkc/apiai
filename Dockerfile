FROM ghcr.io/ggml-org/llama.cpp:server

# Modeli curl ile indir (doğru dosya adı)
RUN mkdir -p /models && curl -L -o /models/next2-0.8b.gguf "https://huggingface.co/thelamapi/next2-0.8b-GGUF/resolve/main/next2-0.8b.IQ4_XS.gguf"

ENV API_KEY="sk-senin-anahtarin-buraya"

CMD ["sh", "-c", "llama-server -m /models/next2-0.8b.gguf --host 0.0.0.0 --port ${PORT:-8080} --api-key ${API_KEY}"]
