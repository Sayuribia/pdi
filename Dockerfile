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
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Baixa e instala o Chrome 119 manualmente
RUN wget https://repo.armbian.com/apt/pool/noble-desktop/g/google-chrome-stable/google-chrome-stable_141.0.7390.54-1_amd64.deb && \
    apt install -y ./google-chrome-stable_141.0.7390.54-1_amd64.deb && \
    rm google-chrome-stable_141.0.7390.54-1_amd64.deb

# Instala o ChromeDriver correspondente
ENV CHROMEDRIVER_VERSION=119.0.6045.159

RUN wget -q -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver && \
    rm /tmp/chromedriver.zip

# Instala Robot Framework e bibliotecas
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

CMD ["robot", "--outputdir", "results", "."]
