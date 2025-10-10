FROM python:3.11-slim

# Dependências básicas
RUN apt-get update && apt-get install -y wget unzip curl gnupg2 libnss3 libxss1 libasound2 libatk1.0-0 libcups2 libx11-xcb1 libxcomposite1 libxdamage1 libxrandr2 libgbm1 libgtk-3-0 && \
    rm -rf /var/lib/apt/lists/*

# Define variáveis para as URLs e versão
ENV CHROME_FOR_TESTING_BASE_URL=https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing
ENV LATEST_VERSION_URL=${CHROME_FOR_TESTING_BASE_URL}/LATEST_RELEASE_LINUX64

# Baixa a última versão disponível para Linux 64-bit
RUN LATEST_VERSION=$(curl -s https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/LATEST_RELEASE_LINUX64) && \
    echo "Versão Chrome for Testing: $LATEST_VERSION" && \
    wget -q https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${LATEST_VERSION}/linux64/chrome-linux64.zip -O /tmp/chrome-linux64.zip && \
    wget -q https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${LATEST_VERSION}/linux64/chromedriver-linux64.zip -O /tmp/chromedriver-linux64.zip && \
    unzip /tmp/chrome-linux64.zip -d /opt/ && \
    unzip /tmp/chromedriver-linux64.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver && \
    rm /tmp/chrome-linux64.zip /tmp/chromedriver-linux64.zip

# Link para facilitar o uso do Chrome
ENV PATH="/opt/chrome-linux64/:${PATH}"

# Instala o Robot Framework e bibliotecas
RUN pip install --no-cache-dir robotframework selenium

# Define o ChromeDriver no PATH para o Selenium
ENV CHROMEDRIVER_PATH=/usr/local/bin/chromedriver

# Copie seus testes ou scripts aqui
# COPY ./tests /tests
# WORKDIR /tests

# Comando default (pode alterar)
CMD ["robot", "--version"]
