# Imagem base com Python
FROM python:3.10-slim

# Evita prompts interativos do apt
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl \
    xvfb \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Instalar Google Chrome (sem apt-key)
RUN wget -q -O /usr/share/keyrings/google-linux-signing-key.gpg https://dl.google.com/linux/linux_signing_key.pub && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-linux-signing-key.gpg] http://dl.google.com/linux/chrome/deb/ stable main" \
        > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# Instalar ChromeDriver compatível com a versão do Chrome instalada
RUN CHROME_VERSION=$(google-chrome --version | grep -oP '\d+\.\d+\.\d+\.\d+' | head -1) && \
    CHROME_MAJOR=$(echo $CHROME_VERSION | cut -d. -f1) && \
    DRIVER_VERSION=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROME_MAJOR}") && \
    wget -q "https://chromedriver.storage.googleapis.com/${DRIVER_VERSION}/chromedriver_linux64.zip" -O /tmp/chromedriver.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver && \
    rm /tmp/chromedriver.zip

# Copiar o código
WORKDIR /app
COPY . /app

# Instalar dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Comando padrão
CMD ["python", "main.py"]
