FROM ubuntu

WORKDIR /root

RUN apt update && apt install -y make wget gcc perl unzip libcurl4-openssl-dev

RUN wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.16.40.02.zip && wget https://github.com/openssl/openssl/archive/OpenSSL_1_0_0-stable.zip

RUN unzip OpenSSL_1_0_0-stable.zip && unzip bedrock-server-1.16.40.02.zip

WORKDIR /root/openssl-OpenSSL_1_0_0-stable

RUN ./config shared && make && make install

ENV LD_LIBRARY_PATH .:/usr/local/ssl/lib

WORKDIR /root

CMD ["./bedrock_server"]