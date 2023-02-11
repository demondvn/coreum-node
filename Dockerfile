
FROM golang:latest
RUN  apt -q update &&  apt -qy install curl git jq lz4 build-essential tar wget
WORKDIR /coreum
RUN curl https://github.com/CoreumFoundation/coreum/releases/download/v0.1.1/cored-linux-amd64 -O cored && chmod +x cored
RUN go install cosmossdk.io/tools/cosmovisor/cmd/cosmovisor@v1.4.0
VOLUME /root/.core
EXPOSE 26656
EXPOSE 26657 
CMD $(which cosmovisor) run start || sleep infinity
