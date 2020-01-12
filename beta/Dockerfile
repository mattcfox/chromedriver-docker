FROM 'mattfox/browserdriver-base:latest'

EXPOSE 4444
EXPOSE 5900

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -;\
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list;\
    apt-get update;\
    apt-get install -y google-chrome-beta;\
    apt-get clean

RUN google-chrome --version | sed -E 's/Google Chrome //' | sed -E 's/ dev//' >> /tmp/chrome-version;\
    cat /tmp/chrome-version | awk -F. '{shortened=$1"."$2"."$3; print shortened}' >> /tmp/chrome-version-short;\
    wget -q -O - https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$(cat /tmp/chrome-version-short) >> /tmp/chromedriver-version

RUN wget -q -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/$(cat /tmp/chromedriver-version)/chromedriver_linux64.zip;\
    unzip -d /usr/local/bin /tmp/chromedriver.zip

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

