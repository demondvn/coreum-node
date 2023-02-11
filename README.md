# coreum-node
    
## Build
    docker build . -t coreum
 
 ### download snaphot for fist run ever
    docker run --rm -v /mnt/blockstore/coreum/:/root/.core -e DOWNLOAD_SNAPSHOT=1  --name coreum coreum
When run complete open another tab 
    `docker stop coreum`
  
 ### Run Coreum
    docker run -d -v /mnt/blockstore/coreum/:/root/.core -e NODENAME=MonPham -p 26656:26656 -p 26657:26657 --name coreum coreum
