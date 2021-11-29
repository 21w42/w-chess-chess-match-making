#!/usr/bin/env bash

if [ ! -f GiverV2.abi.json ]; then
    wget --quiet https://raw.githubusercontent.com/tonlabs/tonos-se/master/contracts/giver_v2/GiverV2.abi.json
    wget --quiet https://raw.githubusercontent.com/tonlabs/tonos-se/master/contracts/giver_v2/GiverV2.keys.json
fi

param=$(printf '{"dest":"%s","value":"%s","bounce":false}' "${1}" "$((${2}*10**9))")
echo "giver ${param}"

./bin/tonos-cli call \
  0:b5e9240fc2d2f1ff8cbb1d1dee7fb7cae155e5f6320e585fcc685698994a19a5 \
  sendTransaction "${param}" \
  --abi GiverV2.abi.json \
  --sign GiverV2.keys.json
