# tor-proxy
[Tor](https://www.torproject.org/) proxy through an [Alpine Linux](https://www.alpinelinux.org/) Docker container

### Installation
```
docker pull skovati/tor-proxy:latest
```

### Usage
```
docker run \
  -d \
  --restart=unless-stopped \
  --name tor-proxy \
  -p 127.0.0.1:9050:9050 \
  skovati/tor-proxy:latest
```
#### DNS
If you would like to route DNS requests through tor as well add 
```
-p 127.0.0.1:53:53/udp
```
and change OS/browser settings accordingly

### Testing
To check for tor circuit run either of the following
```
curl -sx socks5h://127.0.0.1:9050 https://check.torproject.org | grep -m 1 Congratulations
torsocks wget -qO- https://ipconfig.io
```
