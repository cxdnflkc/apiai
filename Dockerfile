
FROM ghcr.io/ggml-org/llama.cpp:server

# Modeli indir
RUN mkdir -p /models && curl -L -o /models/next2-0.8b.gguf "https://huggingface.co/thelamapi/next2-0.8b-GGUF/resolve/main/next2-0.8b.IQ4_XS.gguf"

# API anahtarı ve port ayarları
ENV LLAMA_API_KEY="sk-senin"
ENV LLAMA_ARG_PORT=8080

# Tam yolu kullanarak çalıştır
CMD ["/opt/llama/llama-server", "-m", "/models/next2-0.8b.gguf", "--host", "0.0.0.0"]
