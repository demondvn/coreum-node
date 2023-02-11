# coreum-node
    
## Build
    docker build . -t coreum
 
 ### download snaphot for fist run ever
    docker run -v /mnt/blockstore/coreum/:/root/.core -e DOWNLOAD_SNAPSHOT=1 coreum
 ### Run Coreum
    docker run -d -v /mnt/blockstore/coreum/:/root/.core -p 26656:26656 -p 26657:26657 --name coreum coreum
