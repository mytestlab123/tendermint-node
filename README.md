# tendermint-node
tendermint-node


### Install tendermint on Ubuntu using:
```
curl -o- https://raw.githubusercontent.com/mytestlab123/tendermint-node/main/ubuntu-setup.sh | bash
```

### Setup 4 nodes
```
file=~/.ssh/node.pem
#for i in {1..4}; do echo $i; scp ~/.ssh/node.pem n${i}:~/.ssh/; done
file=~/.ssh/config
file=~/.ssh/node.conf
for i in {1..4}; do echo $i; scp $file n${i}:~/.ssh/config; done

tendermint show-node-id --home ./mytestnet/node0
tendermint show-node-id --home ./mytestnet/node1
tendermint show-node-id --home ./mytestnet/node2
tendermint show-node-id --home ./mytestnet/node3

echo "Setup ID & IP for all nodes"
ID1=$(tendermint show-node-id --home ./mytestnet/node0)
ID2=$(tendermint show-node-id --home ./mytestnet/node1)
ID3=$(tendermint show-node-id --home ./mytestnet/node2)
ID4=$(tendermint show-node-id --home ./mytestnet/node3)
IP1=13.211.197.63
IP2=13.236.209.86
IP3=3.26.146.18
IP4=3.27.17.139

#tendermint start --home ./mytestnet/node0 --proxy-app=kvstore --p2p.persistent-peers="$ID1@$IP1:26656,$ID2@$IP2:26656,$ID3@$IP3:26656,$ID4@$IP4:26656"
#tendermint start --home ./mytestnet/node1 --proxy-app=kvstore --p2p.persistent-peers="$ID1@$IP1:26656,$ID2@$IP2:26656,$ID3@$IP3:26656,$ID4@$IP4:26656"
#tendermint start --home ./mytestnet/node2 --proxy-app=kvstore --p2p.persistent-peers="$ID1@$IP1:26656,$ID2@$IP2:26656,$ID3@$IP3:26656,$ID4@$IP4:26656"
#tendermint start --home ./mytestnet/node3 --proxy-app=kvstore --p2p.persistent-peers="$ID1@$IP1:26656,$ID2@$IP2:26656,$ID3@$IP3:26656,$ID4@$IP4:26656"

# Got error: "ERROR: failed to create node: error="failed to create peer manager: failed to add peer"
tendermint start --home ./mytestnet/node0 --proxy-app=kvstore --p2p.persistent-peers="$ID2@$IP2:26656,$ID3@$IP3:26656,$ID4@$IP4:26656"
tendermint start --home ./mytestnet/node1 --proxy-app=kvstore --p2p.persistent-peers="$ID1@$IP1:26656,$ID3@$IP3:26656,$ID4@$IP4:26656"
tendermint start --home ./mytestnet/node2 --proxy-app=kvstore --p2p.persistent-peers="$ID1@$IP1:26656,$ID2@$IP2:26656,$ID4@$IP4:26656"
tendermint start --home ./mytestnet/node3 --proxy-app=kvstore --p2p.persistent-peers="$ID1@$IP1:26656,$ID2@$IP2:26656,$ID3@$IP3:26656"
```