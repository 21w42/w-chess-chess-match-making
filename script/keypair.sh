#!/usr/bin/env bash

if [ ! -f secret/k1.keys ]; then
    echo "keypair exist"
    exist 0
fi

mkdir -p secret
./bin/tonos-cli genphrase | grep phrase | cut -d'"' -f2 > secret/phrase
./bin/tonos-cli getkeypair secret/k1.keys "$(cat secret/phrase)"
