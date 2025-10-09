# -----------------------------
# 1️⃣ Imagem base com Python
# -----------------------------
FROM python:3.10-slim

# Evitar prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# -----------------------------
# 2️⃣ Instalar dependências do sistema
# -----------------------------
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl \
    xvfb \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# -----------------------------
# 3️⃣ Instalar Google Chrome (modo compatível com Debian 12+)
# -----------------------------
RUN wget -q -O /usr/share/keyrings/google-linux-signing-key.gpg https://dl.google.com/linux/linux_signing_key.pub && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-linux-signing-key.gpg] http://dl.google.com/linux/chrome/deb/ stable main" \
        > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# -----------------------------
# 4️⃣ Instalar ChromeDriver (última versão estável)
# -----------------------------
RUN DRIVER_VERSION=$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE) && \
    wget -q "https://chromedriver.storage.googleapis.com/${DRIVER_VERSION}/chromedriver_linux64.zip" -O /tmp/chromedriver.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver && \
    rm /tmp/chromedriver.zip

# -----------------------------
# 5️⃣ Configurar diretório de trabalho
# -----------------------------
WORKDIR /app

# -----------------------------
# 6️⃣ Copiar apenas requirements.txt e instalar dependências
# -----------------------------
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# -----------------------------
# 7️⃣ Copiar o restante do código
# -----------------------------
COPY . .

# -----------------------------
# 8️⃣ Comando padrão de execução
# -----------------------------
CMD ["python", "main.py"]
