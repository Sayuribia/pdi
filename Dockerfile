# Use a versão estável do Debian para evitar pacotes removidos
FROM python:3.11-slim-bookworm

# Instalar dependências do sistema e Chromium
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl \
    chromium \
    chromium-driver \
    libnss3 \
    libxi6 \
    libxrandr2 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxtst6 \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    && rm -rf /var/lib/apt/lists/*

# Variáveis de ambiente para o Chrome
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver
ENV PATH="${PATH}:/usr/lib/chromium/"

# Instalar dependências Python
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copiar o projeto
WORKDIR /app
COPY . /app

# Executar testes Robot por padrão
CMD ["robot", "tests/amazon_tests_gherkin_bdd.robot"]
