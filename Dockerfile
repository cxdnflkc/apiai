
FROM ghcr.io/ggml-org/llama.cpp:server

# Modeli indir (IQ4_XS sürümü)
RUN mkdir -p /models && curl -L -o /models/next2-0.8b.gguf "https://huggingface.co/thelamapi/next2-0.8b-GGUF/resolve/main/next2-0.8b.IQ4_XS.gguf"

# API anahtarı ve port ayarları
ENV LLAMA_API_KEY="sk-senin"
ENV LLAMA_ARG_PORT=8080
# mmap'i devre dışı bırakmak için ortam değişkeni kullan
ENV LLAMA_ARG_NO_MMAP=true

# Model yolunu ve host'u argüman olarak ver (host'u buraya yazma, env'de kalsın)
CMD ["-m", "/models/next2-0.8b.gguf"]
