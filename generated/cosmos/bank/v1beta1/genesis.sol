// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;
import "../../../ProtoBufRuntime.sol";
import "../../../GoogleProtobufAny.sol";
import "../../base/v1beta1/coin.sol";
import "./bank.sol";
import "../../../cosmos_proto/cosmos.sol";

library CosmosBankV1beta1GenesisState {


  //struct definition
  struct Data {
    CosmosBankV1beta1Params.Data params;
    CosmosBankV1beta1Balance.Data[] balances;
    CosmosBaseV1beta1Coin.Data[] supply;
    CosmosBankV1beta1Metadata.Data[] denom_metadata;
  }

  // Decoder section

  /**
   * @dev The main decoder for memory
   * @param bs The bytes array to be decoded
   * @return The decoded struct
   */
  function decode(bytes memory bs) internal pure returns (Data memory) {
    (Data memory x, ) = _decode(32, bs, bs.length);
    return x;
  }

  /**
   * @dev The main decoder for storage
   * @param self The in-storage struct
   * @param bs The bytes array to be decoded
   */
  function decode(Data storage self, bytes memory bs) internal {
    (Data memory x, ) = _decode(32, bs, bs.length);
    store(x, self);
  }
  // inner decoder

  /**
   * @dev The decoder for internal usage
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param sz The number of bytes expected
   * @return The decoded struct
   * @return The number of bytes decoded
   */
  function _decode(uint256 p, bytes memory bs, uint256 sz)
    internal
    pure
    returns (Data memory, uint)
  {
    Data memory r;
    uint[5] memory counters;
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_params(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_balances(pointer, bs, nil(), counters);
      } else
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_supply(pointer, bs, nil(), counters);
      } else
      if (fieldId == 4) {
        pointer += _read_unpacked_repeated_denom_metadata(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[2] > 0) {
      require(r.balances.length == 0);
      r.balances = new CosmosBankV1beta1Balance.Data[](counters[2]);
    }
    if (counters[3] > 0) {
      require(r.supply.length == 0);
      r.supply = new CosmosBaseV1beta1Coin.Data[](counters[3]);
    }
    if (counters[4] > 0) {
      require(r.denom_metadata.length == 0);
      r.denom_metadata = new CosmosBankV1beta1Metadata.Data[](counters[4]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_balances(pointer, bs, r, counters);
      } else
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_supply(pointer, bs, r, counters);
      } else
      if (fieldId == 4) {
        pointer += _read_unpacked_repeated_denom_metadata(pointer, bs, r, counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }
    }
    return (r, sz);
  }

  // field readers

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_params(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosBankV1beta1Params.Data memory x, uint256 sz) = _decode_CosmosBankV1beta1Params(p, bs);
    r.params = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @param counters The counters for repeated fields
   * @return The number of bytes decoded
   */
  function _read_unpacked_repeated_balances(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[5] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosBankV1beta1Balance.Data memory x, uint256 sz) = _decode_CosmosBankV1beta1Balance(p, bs);
    if (isNil(r)) {
      counters[2] += 1;
    } else {
      r.balances[r.balances.length - counters[2]] = x;
      counters[2] -= 1;
    }
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @param counters The counters for repeated fields
   * @return The number of bytes decoded
   */
  function _read_unpacked_repeated_supply(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[5] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosBaseV1beta1Coin.Data memory x, uint256 sz) = _decode_CosmosBaseV1beta1Coin(p, bs);
    if (isNil(r)) {
      counters[3] += 1;
    } else {
      r.supply[r.supply.length - counters[3]] = x;
      counters[3] -= 1;
    }
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @param counters The counters for repeated fields
   * @return The number of bytes decoded
   */
  function _read_unpacked_repeated_denom_metadata(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[5] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosBankV1beta1Metadata.Data memory x, uint256 sz) = _decode_CosmosBankV1beta1Metadata(p, bs);
    if (isNil(r)) {
      counters[4] += 1;
    } else {
      r.denom_metadata[r.denom_metadata.length - counters[4]] = x;
      counters[4] -= 1;
    }
    return sz;
  }

  // struct decoder
  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosBankV1beta1Params(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBankV1beta1Params.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBankV1beta1Params.Data memory r, ) = CosmosBankV1beta1Params._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosBankV1beta1Balance(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBankV1beta1Balance.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBankV1beta1Balance.Data memory r, ) = CosmosBankV1beta1Balance._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosBaseV1beta1Coin(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBaseV1beta1Coin.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBaseV1beta1Coin.Data memory r, ) = CosmosBaseV1beta1Coin._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosBankV1beta1Metadata(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBankV1beta1Metadata.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBankV1beta1Metadata.Data memory r, ) = CosmosBankV1beta1Metadata._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }


  // Encoder section

  /**
   * @dev The main encoder for memory
   * @param r The struct to be encoded
   * @return The encoded byte array
   */
  function encode(Data memory r) internal pure returns (bytes memory) {
    bytes memory bs = new bytes(_estimate(r));
    uint256 sz = _encode(r, 32, bs);
    assembly {
      mstore(bs, sz)
    }
    return bs;
  }
  // inner encoder

  /**
   * @dev The encoder for internal usage
   * @param r The struct to be encoded
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The number of bytes encoded
   */
  function _encode(Data memory r, uint256 p, bytes memory bs)
    internal
    pure
    returns (uint)
  {
    uint256 offset = p;
    uint256 pointer = p;
    uint256 i;
    
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosBankV1beta1Params._encode_nested(r.params, pointer, bs);
    
    if (r.balances.length != 0) {
    for(i = 0; i < r.balances.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        2,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosBankV1beta1Balance._encode_nested(r.balances[i], pointer, bs);
    }
    }
    if (r.supply.length != 0) {
    for(i = 0; i < r.supply.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        3,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosBaseV1beta1Coin._encode_nested(r.supply[i], pointer, bs);
    }
    }
    if (r.denom_metadata.length != 0) {
    for(i = 0; i < r.denom_metadata.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        4,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosBankV1beta1Metadata._encode_nested(r.denom_metadata[i], pointer, bs);
    }
    }
    return pointer - offset;
  }
  // nested encoder

  /**
   * @dev The encoder for inner struct
   * @param r The struct to be encoded
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The number of bytes encoded
   */
  function _encode_nested(Data memory r, uint256 p, bytes memory bs)
    internal
    pure
    returns (uint)
  {
    /**
     * First encoded `r` into a temporary array, and encode the actual size used.
     * Then copy the temporary array into `bs`.
     */
    uint256 offset = p;
    uint256 pointer = p;
    bytes memory tmp = new bytes(_estimate(r));
    uint256 tmpAddr = ProtoBufRuntime.getMemoryAddress(tmp);
    uint256 bsAddr = ProtoBufRuntime.getMemoryAddress(bs);
    uint256 size = _encode(r, 32, tmp);
    pointer += ProtoBufRuntime._encode_varint(size, pointer, bs);
    ProtoBufRuntime.copyBytes(tmpAddr + 32, bsAddr + pointer, size);
    pointer += size;
    delete tmp;
    return pointer - offset;
  }
  // estimator

  /**
   * @dev The estimator for a struct
   * @param r The struct to be encoded
   * @return The number of bytes encoded in estimation
   */
  function _estimate(
    Data memory r
  ) internal pure returns (uint) {
    uint256 e;uint256 i;
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBankV1beta1Params._estimate(r.params));
    for(i = 0; i < r.balances.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBankV1beta1Balance._estimate(r.balances[i]));
    }
    for(i = 0; i < r.supply.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseV1beta1Coin._estimate(r.supply[i]));
    }
    for(i = 0; i < r.denom_metadata.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBankV1beta1Metadata._estimate(r.denom_metadata[i]));
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.balances.length != 0) {
    return false;
  }

  if (r.supply.length != 0) {
    return false;
  }

  if (r.denom_metadata.length != 0) {
    return false;
  }

    return true;
  }


  //store function
  /**
   * @dev Store in-memory struct to storage
   * @param input The in-memory struct
   * @param output The in-storage struct
   */
  function store(Data memory input, Data storage output) internal {
    CosmosBankV1beta1Params.store(input.params, output.params);

    for(uint256 i2 = 0; i2 < input.balances.length; i2++) {
      output.balances.push(input.balances[i2]);
    }
    

    for(uint256 i3 = 0; i3 < input.supply.length; i3++) {
      output.supply.push(input.supply[i3]);
    }
    

    for(uint256 i4 = 0; i4 < input.denom_metadata.length; i4++) {
      output.denom_metadata.push(input.denom_metadata[i4]);
    }
    

  }


  //array helpers for Balances
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addBalances(Data memory self, CosmosBankV1beta1Balance.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosBankV1beta1Balance.Data[] memory tmp = new CosmosBankV1beta1Balance.Data[](self.balances.length + 1);
    for (uint256 i = 0; i < self.balances.length; i++) {
      tmp[i] = self.balances[i];
    }
    tmp[self.balances.length] = value;
    self.balances = tmp;
  }

  //array helpers for Supply
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addSupply(Data memory self, CosmosBaseV1beta1Coin.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosBaseV1beta1Coin.Data[] memory tmp = new CosmosBaseV1beta1Coin.Data[](self.supply.length + 1);
    for (uint256 i = 0; i < self.supply.length; i++) {
      tmp[i] = self.supply[i];
    }
    tmp[self.supply.length] = value;
    self.supply = tmp;
  }

  //array helpers for DenomMetadata
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addDenomMetadata(Data memory self, CosmosBankV1beta1Metadata.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosBankV1beta1Metadata.Data[] memory tmp = new CosmosBankV1beta1Metadata.Data[](self.denom_metadata.length + 1);
    for (uint256 i = 0; i < self.denom_metadata.length; i++) {
      tmp[i] = self.denom_metadata[i];
    }
    tmp[self.denom_metadata.length] = value;
    self.denom_metadata = tmp;
  }


  //utility functions
  /**
   * @dev Return an empty struct
   * @return r The empty struct
   */
  function nil() internal pure returns (Data memory r) {
    assembly {
      r := 0
    }
  }

  /**
   * @dev Test whether a struct is empty
   * @param x The struct to be tested
   * @return r True if it is empty
   */
  function isNil(Data memory x) internal pure returns (bool r) {
    assembly {
      r := iszero(x)
    }
  }
}
//library CosmosBankV1beta1GenesisState

library CosmosBankV1beta1Balance {


  //struct definition
  struct Data {
    string f_address;
    CosmosBaseV1beta1Coin.Data[] coins;
  }

  // Decoder section

  /**
   * @dev The main decoder for memory
   * @param bs The bytes array to be decoded
   * @return The decoded struct
   */
  function decode(bytes memory bs) internal pure returns (Data memory) {
    (Data memory x, ) = _decode(32, bs, bs.length);
    return x;
  }

  /**
   * @dev The main decoder for storage
   * @param self The in-storage struct
   * @param bs The bytes array to be decoded
   */
  function decode(Data storage self, bytes memory bs) internal {
    (Data memory x, ) = _decode(32, bs, bs.length);
    store(x, self);
  }
  // inner decoder

  /**
   * @dev The decoder for internal usage
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param sz The number of bytes expected
   * @return The decoded struct
   * @return The number of bytes decoded
   */
  function _decode(uint256 p, bytes memory bs, uint256 sz)
    internal
    pure
    returns (Data memory, uint)
  {
    Data memory r;
    uint[3] memory counters;
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_f_address(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_coins(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[2] > 0) {
      require(r.coins.length == 0);
      r.coins = new CosmosBaseV1beta1Coin.Data[](counters[2]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_coins(pointer, bs, r, counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }
    }
    return (r, sz);
  }

  // field readers

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_f_address(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.f_address = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @param counters The counters for repeated fields
   * @return The number of bytes decoded
   */
  function _read_unpacked_repeated_coins(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[3] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosBaseV1beta1Coin.Data memory x, uint256 sz) = _decode_CosmosBaseV1beta1Coin(p, bs);
    if (isNil(r)) {
      counters[2] += 1;
    } else {
      r.coins[r.coins.length - counters[2]] = x;
      counters[2] -= 1;
    }
    return sz;
  }

  // struct decoder
  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosBaseV1beta1Coin(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBaseV1beta1Coin.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBaseV1beta1Coin.Data memory r, ) = CosmosBaseV1beta1Coin._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }


  // Encoder section

  /**
   * @dev The main encoder for memory
   * @param r The struct to be encoded
   * @return The encoded byte array
   */
  function encode(Data memory r) internal pure returns (bytes memory) {
    bytes memory bs = new bytes(_estimate(r));
    uint256 sz = _encode(r, 32, bs);
    assembly {
      mstore(bs, sz)
    }
    return bs;
  }
  // inner encoder

  /**
   * @dev The encoder for internal usage
   * @param r The struct to be encoded
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The number of bytes encoded
   */
  function _encode(Data memory r, uint256 p, bytes memory bs)
    internal
    pure
    returns (uint)
  {
    uint256 offset = p;
    uint256 pointer = p;
    uint256 i;
    if (bytes(r.f_address).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.f_address, pointer, bs);
    }
    if (r.coins.length != 0) {
    for(i = 0; i < r.coins.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        2,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosBaseV1beta1Coin._encode_nested(r.coins[i], pointer, bs);
    }
    }
    return pointer - offset;
  }
  // nested encoder

  /**
   * @dev The encoder for inner struct
   * @param r The struct to be encoded
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The number of bytes encoded
   */
  function _encode_nested(Data memory r, uint256 p, bytes memory bs)
    internal
    pure
    returns (uint)
  {
    /**
     * First encoded `r` into a temporary array, and encode the actual size used.
     * Then copy the temporary array into `bs`.
     */
    uint256 offset = p;
    uint256 pointer = p;
    bytes memory tmp = new bytes(_estimate(r));
    uint256 tmpAddr = ProtoBufRuntime.getMemoryAddress(tmp);
    uint256 bsAddr = ProtoBufRuntime.getMemoryAddress(bs);
    uint256 size = _encode(r, 32, tmp);
    pointer += ProtoBufRuntime._encode_varint(size, pointer, bs);
    ProtoBufRuntime.copyBytes(tmpAddr + 32, bsAddr + pointer, size);
    pointer += size;
    delete tmp;
    return pointer - offset;
  }
  // estimator

  /**
   * @dev The estimator for a struct
   * @param r The struct to be encoded
   * @return The number of bytes encoded in estimation
   */
  function _estimate(
    Data memory r
  ) internal pure returns (uint) {
    uint256 e;uint256 i;
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.f_address).length);
    for(i = 0; i < r.coins.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseV1beta1Coin._estimate(r.coins[i]));
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.f_address).length != 0) {
    return false;
  }

  if (r.coins.length != 0) {
    return false;
  }

    return true;
  }


  //store function
  /**
   * @dev Store in-memory struct to storage
   * @param input The in-memory struct
   * @param output The in-storage struct
   */
  function store(Data memory input, Data storage output) internal {
    output.f_address = input.f_address;

    for(uint256 i2 = 0; i2 < input.coins.length; i2++) {
      output.coins.push(input.coins[i2]);
    }
    

  }


  //array helpers for Coins
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addCoins(Data memory self, CosmosBaseV1beta1Coin.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosBaseV1beta1Coin.Data[] memory tmp = new CosmosBaseV1beta1Coin.Data[](self.coins.length + 1);
    for (uint256 i = 0; i < self.coins.length; i++) {
      tmp[i] = self.coins[i];
    }
    tmp[self.coins.length] = value;
    self.coins = tmp;
  }


  //utility functions
  /**
   * @dev Return an empty struct
   * @return r The empty struct
   */
  function nil() internal pure returns (Data memory r) {
    assembly {
      r := 0
    }
  }

  /**
   * @dev Test whether a struct is empty
   * @param x The struct to be tested
   * @return r True if it is empty
   */
  function isNil(Data memory x) internal pure returns (bool r) {
    assembly {
      r := iszero(x)
    }
  }
}
//library CosmosBankV1beta1Balance