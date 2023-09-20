# Cosmos Protobuf En/Decoder for Solidity

Pre-generated Cosmos SDK and IBC Protobuf Encoder and Decoder for Solidity.

## Content

[./generated](./generated/) folder contains pre-generated solidity file based on Cosmos SDK v0.46.15 and ibc-go v6.2.0

## Sample Use

```solidity
// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;

import "./cosmos/staking/v1beta1/tx.sol";

contract TestEncodeMsgDelegate {
    event EncodedMsg(bytes data);

    constructor() {
        emit EncodedMsg(CosmosStakingV1beta1MsgDelegate.encode(
            CosmosStakingV1beta1MsgDelegate.Data({
                delegator_address: "cro1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                validator_address: "crocncl1yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy",
                amount: CosmosBaseV1beta1Coin.Data({
                    denom: "basecro",
                    amount: "100"
                })
            })
        ));
    }
}

```

## How to Generate

If you need other versions, you can tweak the [./scripts/update-proto-deps.sh](./scripts/update-proto-deps.sh) to download your desired version protobuf definitions.

```bash
./scripts/update-proto-deps.sh
./scripts/install-protobuf-solidity.sh
SOLPB_DIR=./solidity-protobuf ./scripts/generate-protobuf-solidity.sh
```

## License

[Apache 2.0](./LICENSE)
