FROM python:3.11-slim

# Variáveis de ambiente
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    wget \
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

# Instalar chave e repositório do Google Chrome
RUN mkdir -p /etc/apt/keyrings && \
    wget -q -O /etc/apt/keyrings/google.gpg https://dl.google.com/linux/linux_signing_key.pub && \
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/google.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

# Instalar Google Chrome
RUN apt-get update && apt-get install -y google-chrome-stable && rm -rf /var/lib/apt/lists/*

# Obter versão compatível do ChromeDriver
RUN CHROME_VERSION=$(google-chrome --version | sed 's/.*Google Chrome //;s/ .*//') && \
    CHROME_MAJOR=$(echo $CHROME_VERSION | cut -d '.' -f 1) && \
    DRIVER_VERSION=$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROME_MAJOR) && \
    if [ -z "$DRIVER_VERSION" ]; then echo "Erro: ChromeDriver não encontrado para versão $CHROME_MAJOR"; exit 1; fi && \
    echo "Instalando ChromeDriver versão $DRIVER_VERSION para Chrome $CHROME_VERSION" && \
    wget -q -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/${DRIVER_VERSION}/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver && \
    rm /tmp/chromedriver.zip

# Instalar Robot Framework e bibliotecas
RUN pip install --no-cache-dir \
    robotframework \
    robotframework-seleniumlibrary \
    robotframework-requests \
    robotframework-jsonlibrary \
    selenium

# Criar usuário não-root
RUN useradd -ms /bin/bash robotuser
USER robotuser

# Diretório padrão de trabalho
WORKDIR /home/robotuser/robot-tests

# Comando padrão
CMD ["robot", "--outputdir", "results", "."]
