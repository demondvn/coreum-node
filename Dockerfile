
FROM golang:latest
RUN  apt -q update &&  apt -qy install curl git jq lz4 build-essential tar wget
WORKDIR /coreum
RUN wget https://github.com/CoreumFoundation/coreum/releases/download/v0.1.1/cored-linux-amd64 -O cored && chmod +x cored
RUN go install cosmossdk.io/tools/cosmovisor/cmd/cosmovisor@v1.4.0
VOLUME /root/.core
EXPOSE 26656
EXPOSE 26657 
COPY script.sh script.sh
RUN chmod +x script.sh
ARG DAEMON_HOME=/root/.core/coreum-testnet-1
ARG UNSAFE_SKIP_BACKUP=true
ARG DAEMON_NAME=cored
CMD ./script.sh && $(which cosmovisor) run start || sleep 30
