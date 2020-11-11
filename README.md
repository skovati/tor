# tor
tor proxy through an Alpine Linux Docker container

### installation
```
docker pull skovati/tor:latest
```

### usage
```
docker run \
  -d \
  --restart=unless-stopped \
  --name tor \
  -p 127.0.0.1:9050:9050 \
  skovati/tor:latest
```
If you would like to route DNS requests through tor as well add 
```
-p 127.0.0.1:53:53/udp
```
and change OS/browser settings accordingly

to check for tor circuit run 
```
curl -sx socks5h://127.0.0.1:9050 https://check.torproject.org | grep -m 1 Congratulations
torsocks wget -qO- https://ifconfig.io
```
