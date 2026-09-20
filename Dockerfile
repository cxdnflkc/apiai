FROM ghcr.io/ggml-org/llama.cpp:server

# Modeli curl ile indir (doğru dosya adı)
RUN mkdir -p /models && curl -L -o /models/next2-0.8b.gguf "https://huggingface.co/thelamapi/next2-0.8b-GGUF/resolve/main/next2-0.8b.IQ4_XS.gguf"

# API anahtarını ve portu ortam değişkeni olarak tanımla
ENV LLAMA_API_KEY="sk-aipower"
ENV LLAMA_ARG_PORT=8080

# Doğrudan llama-server'ı çalıştır (shell yok)
CMD ["llama-server", "-m", "/models/next2-0.8b.gguf", "--host", "0.0.0.0"]
