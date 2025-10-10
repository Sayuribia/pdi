FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    gnupg \
    ca-certificates \
    fonts-liberation \
    libnss3 \
    libxss1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libx11-xcb1 \
    && rm -rf /var/lib/apt/lists/*

# Adiciona chave e repositório do Google Chrome
RUN mkdir -p /etc/apt/keyrings && \
    wget -q -O /etc/apt/keyrings/google.gpg https://dl.google.com/linux/linux_signing_key.pub && \
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/google.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

# Instala versão específica do Google Chrome (119)
RUN apt-get update && \
    apt-get install -y google-chrome-stable=119.0.6045.159-1 && \
    rm -rf /var/lib/apt/lists/*

# Instala versão correspondente do ChromeDriver
ENV CHROMEDRIVER_VERSION=119.0.6045.159

RUN wget -q -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver && \
    rm /tmp/chromedriver.zip

# Instala Robot Framework e libs
RUN pip install --no-cache-dir \
    robotframework \
    robotframework-seleniumlibrary \
    robotframework-requests \
    robotframework-jsonlibrary \
    selenium

# Cria usuário não-root
RUN useradd -ms /bin/bash robotuser
USER robotuser

# Define diretório de trabalho
WORKDIR /home/robotuser/robot-tests

# Comando padrão
CMD ["robot", "--outputdir", "results", "."]
