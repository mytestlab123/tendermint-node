#!/bin/bash

sudo apt update -y

wget https://github.com/tendermint/tendermint/releases/download/v0.35.7/tendermint_0.35.7_linux_amd64.tar.gz

tar xf tendermint_0.35.7_linux_amd64.tar.gz
sudo install -o root -g root -m 0755 tendermint  /usr/local/bin/
tendermint version
tendermint init validator

cat ~/.tendermint/config/priv_validator_key.json

cat ~/.tendermint/data/priv_validator_state.json

cat ~/.tendermint/config/node_key.json

cat ~/.tendermint/config/genesis.json
