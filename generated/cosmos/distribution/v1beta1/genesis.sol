// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;
import "../../../ProtoBufRuntime.sol";
import "../../../GoogleProtobufAny.sol";
import "../../base/v1beta1/coin.sol";
import "./distribution.sol";
import "../../../cosmos_proto/cosmos.sol";

library CosmosDistributionV1beta1DelegatorWithdrawInfo {


  //struct definition
  struct Data {
    string delegator_address;
    string withdraw_address;
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
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_delegator_address(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_withdraw_address(pointer, bs, r);
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
  function _read_delegator_address(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.delegator_address = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_withdraw_address(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.withdraw_address = x;
    return sz;
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
    
    if (bytes(r.delegator_address).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.delegator_address, pointer, bs);
    }
    if (bytes(r.withdraw_address).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.withdraw_address, pointer, bs);
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
    uint256 e;
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.delegator_address).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.withdraw_address).length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.delegator_address).length != 0) {
    return false;
  }

  if (bytes(r.withdraw_address).length != 0) {
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
    output.delegator_address = input.delegator_address;
    output.withdraw_address = input.withdraw_address;

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
//library CosmosDistributionV1beta1DelegatorWithdrawInfo

library CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord {


  //struct definition
  struct Data {
    string validator_address;
    CosmosBaseV1beta1DecCoin.Data[] outstanding_rewards;
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
        pointer += _read_validator_address(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_outstanding_rewards(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[2] > 0) {
      require(r.outstanding_rewards.length == 0);
      r.outstanding_rewards = new CosmosBaseV1beta1DecCoin.Data[](counters[2]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_outstanding_rewards(pointer, bs, r, counters);
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
  function _read_validator_address(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.validator_address = x;
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
  function _read_unpacked_repeated_outstanding_rewards(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[3] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosBaseV1beta1DecCoin.Data memory x, uint256 sz) = _decode_CosmosBaseV1beta1DecCoin(p, bs);
    if (isNil(r)) {
      counters[2] += 1;
    } else {
      r.outstanding_rewards[r.outstanding_rewards.length - counters[2]] = x;
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
  function _decode_CosmosBaseV1beta1DecCoin(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBaseV1beta1DecCoin.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBaseV1beta1DecCoin.Data memory r, ) = CosmosBaseV1beta1DecCoin._decode(pointer, bs, sz);
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
    if (bytes(r.validator_address).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.validator_address, pointer, bs);
    }
    if (r.outstanding_rewards.length != 0) {
    for(i = 0; i < r.outstanding_rewards.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        2,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosBaseV1beta1DecCoin._encode_nested(r.outstanding_rewards[i], pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.validator_address).length);
    for(i = 0; i < r.outstanding_rewards.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseV1beta1DecCoin._estimate(r.outstanding_rewards[i]));
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.validator_address).length != 0) {
    return false;
  }

  if (r.outstanding_rewards.length != 0) {
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
    output.validator_address = input.validator_address;

    for(uint256 i2 = 0; i2 < input.outstanding_rewards.length; i2++) {
      output.outstanding_rewards.push(input.outstanding_rewards[i2]);
    }
    

  }


  //array helpers for OutstandingRewards
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addOutstandingRewards(Data memory self, CosmosBaseV1beta1DecCoin.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosBaseV1beta1DecCoin.Data[] memory tmp = new CosmosBaseV1beta1DecCoin.Data[](self.outstanding_rewards.length + 1);
    for (uint256 i = 0; i < self.outstanding_rewards.length; i++) {
      tmp[i] = self.outstanding_rewards[i];
    }
    tmp[self.outstanding_rewards.length] = value;
    self.outstanding_rewards = tmp;
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
//library CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord

library CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord {


  //struct definition
  struct Data {
    string validator_address;
    CosmosDistributionV1beta1ValidatorAccumulatedCommission.Data accumulated;
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
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_validator_address(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_accumulated(pointer, bs, r);
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
  function _read_validator_address(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.validator_address = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_accumulated(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosDistributionV1beta1ValidatorAccumulatedCommission.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1ValidatorAccumulatedCommission(p, bs);
    r.accumulated = x;
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
  function _decode_CosmosDistributionV1beta1ValidatorAccumulatedCommission(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1ValidatorAccumulatedCommission.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1ValidatorAccumulatedCommission.Data memory r, ) = CosmosDistributionV1beta1ValidatorAccumulatedCommission._decode(pointer, bs, sz);
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
    
    if (bytes(r.validator_address).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.validator_address, pointer, bs);
    }
    
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosDistributionV1beta1ValidatorAccumulatedCommission._encode_nested(r.accumulated, pointer, bs);
    
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
    uint256 e;
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.validator_address).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1ValidatorAccumulatedCommission._estimate(r.accumulated));
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.validator_address).length != 0) {
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
    output.validator_address = input.validator_address;
    CosmosDistributionV1beta1ValidatorAccumulatedCommission.store(input.accumulated, output.accumulated);

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
//library CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord

library CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord {


  //struct definition
  struct Data {
    string validator_address;
    uint64 period;
    CosmosDistributionV1beta1ValidatorHistoricalRewards.Data rewards;
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
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_validator_address(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_period(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_rewards(pointer, bs, r);
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
  function _read_validator_address(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.validator_address = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_period(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.period = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_rewards(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosDistributionV1beta1ValidatorHistoricalRewards.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1ValidatorHistoricalRewards(p, bs);
    r.rewards = x;
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
  function _decode_CosmosDistributionV1beta1ValidatorHistoricalRewards(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1ValidatorHistoricalRewards.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1ValidatorHistoricalRewards.Data memory r, ) = CosmosDistributionV1beta1ValidatorHistoricalRewards._decode(pointer, bs, sz);
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
    
    if (bytes(r.validator_address).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.validator_address, pointer, bs);
    }
    if (r.period != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.period, pointer, bs);
    }
    
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosDistributionV1beta1ValidatorHistoricalRewards._encode_nested(r.rewards, pointer, bs);
    
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
    uint256 e;
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.validator_address).length);
    e += 1 + ProtoBufRuntime._sz_uint64(r.period);
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1ValidatorHistoricalRewards._estimate(r.rewards));
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.validator_address).length != 0) {
    return false;
  }

  if (r.period != 0) {
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
    output.validator_address = input.validator_address;
    output.period = input.period;
    CosmosDistributionV1beta1ValidatorHistoricalRewards.store(input.rewards, output.rewards);

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
//library CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord

library CosmosDistributionV1beta1ValidatorCurrentRewardsRecord {


  //struct definition
  struct Data {
    string validator_address;
    CosmosDistributionV1beta1ValidatorCurrentRewards.Data rewards;
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
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_validator_address(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_rewards(pointer, bs, r);
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
  function _read_validator_address(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.validator_address = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_rewards(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosDistributionV1beta1ValidatorCurrentRewards.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1ValidatorCurrentRewards(p, bs);
    r.rewards = x;
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
  function _decode_CosmosDistributionV1beta1ValidatorCurrentRewards(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1ValidatorCurrentRewards.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1ValidatorCurrentRewards.Data memory r, ) = CosmosDistributionV1beta1ValidatorCurrentRewards._decode(pointer, bs, sz);
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
    
    if (bytes(r.validator_address).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.validator_address, pointer, bs);
    }
    
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosDistributionV1beta1ValidatorCurrentRewards._encode_nested(r.rewards, pointer, bs);
    
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
    uint256 e;
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.validator_address).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1ValidatorCurrentRewards._estimate(r.rewards));
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.validator_address).length != 0) {
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
    output.validator_address = input.validator_address;
    CosmosDistributionV1beta1ValidatorCurrentRewards.store(input.rewards, output.rewards);

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
//library CosmosDistributionV1beta1ValidatorCurrentRewardsRecord

library CosmosDistributionV1beta1DelegatorStartingInfoRecord {


  //struct definition
  struct Data {
    string delegator_address;
    string validator_address;
    CosmosDistributionV1beta1DelegatorStartingInfo.Data starting_info;
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
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_delegator_address(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_validator_address(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_starting_info(pointer, bs, r);
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
  function _read_delegator_address(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.delegator_address = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_validator_address(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.validator_address = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_starting_info(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosDistributionV1beta1DelegatorStartingInfo.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1DelegatorStartingInfo(p, bs);
    r.starting_info = x;
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
  function _decode_CosmosDistributionV1beta1DelegatorStartingInfo(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1DelegatorStartingInfo.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1DelegatorStartingInfo.Data memory r, ) = CosmosDistributionV1beta1DelegatorStartingInfo._decode(pointer, bs, sz);
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
    
    if (bytes(r.delegator_address).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.delegator_address, pointer, bs);
    }
    if (bytes(r.validator_address).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.validator_address, pointer, bs);
    }
    
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosDistributionV1beta1DelegatorStartingInfo._encode_nested(r.starting_info, pointer, bs);
    
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
    uint256 e;
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.delegator_address).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.validator_address).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1DelegatorStartingInfo._estimate(r.starting_info));
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.delegator_address).length != 0) {
    return false;
  }

  if (bytes(r.validator_address).length != 0) {
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
    output.delegator_address = input.delegator_address;
    output.validator_address = input.validator_address;
    CosmosDistributionV1beta1DelegatorStartingInfo.store(input.starting_info, output.starting_info);

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
//library CosmosDistributionV1beta1DelegatorStartingInfoRecord

library CosmosDistributionV1beta1ValidatorSlashEventRecord {


  //struct definition
  struct Data {
    string validator_address;
    uint64 height;
    uint64 period;
    CosmosDistributionV1beta1ValidatorSlashEvent.Data validator_slash_event;
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
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_validator_address(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_height(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_period(pointer, bs, r);
      } else
      if (fieldId == 4) {
        pointer += _read_validator_slash_event(pointer, bs, r);
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
  function _read_validator_address(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.validator_address = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_height(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.height = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_period(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.period = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_validator_slash_event(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosDistributionV1beta1ValidatorSlashEvent.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1ValidatorSlashEvent(p, bs);
    r.validator_slash_event = x;
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
  function _decode_CosmosDistributionV1beta1ValidatorSlashEvent(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1ValidatorSlashEvent.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1ValidatorSlashEvent.Data memory r, ) = CosmosDistributionV1beta1ValidatorSlashEvent._decode(pointer, bs, sz);
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
    
    if (bytes(r.validator_address).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.validator_address, pointer, bs);
    }
    if (r.height != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.height, pointer, bs);
    }
    if (r.period != 0) {
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.period, pointer, bs);
    }
    
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosDistributionV1beta1ValidatorSlashEvent._encode_nested(r.validator_slash_event, pointer, bs);
    
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
    uint256 e;
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.validator_address).length);
    e += 1 + ProtoBufRuntime._sz_uint64(r.height);
    e += 1 + ProtoBufRuntime._sz_uint64(r.period);
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1ValidatorSlashEvent._estimate(r.validator_slash_event));
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.validator_address).length != 0) {
    return false;
  }

  if (r.height != 0) {
    return false;
  }

  if (r.period != 0) {
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
    output.validator_address = input.validator_address;
    output.height = input.height;
    output.period = input.period;
    CosmosDistributionV1beta1ValidatorSlashEvent.store(input.validator_slash_event, output.validator_slash_event);

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
//library CosmosDistributionV1beta1ValidatorSlashEventRecord

library CosmosDistributionV1beta1GenesisState {


  //struct definition
  struct Data {
    CosmosDistributionV1beta1Params.Data params;
    CosmosDistributionV1beta1FeePool.Data fee_pool;
    CosmosDistributionV1beta1DelegatorWithdrawInfo.Data[] delegator_withdraw_infos;
    string previous_proposer;
    CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord.Data[] outstanding_rewards;
    CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord.Data[] validator_accumulated_commissions;
    CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord.Data[] validator_historical_rewards;
    CosmosDistributionV1beta1ValidatorCurrentRewardsRecord.Data[] validator_current_rewards;
    CosmosDistributionV1beta1DelegatorStartingInfoRecord.Data[] delegator_starting_infos;
    CosmosDistributionV1beta1ValidatorSlashEventRecord.Data[] validator_slash_events;
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
    uint[11] memory counters;
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
        pointer += _read_fee_pool(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_delegator_withdraw_infos(pointer, bs, nil(), counters);
      } else
      if (fieldId == 4) {
        pointer += _read_previous_proposer(pointer, bs, r);
      } else
      if (fieldId == 5) {
        pointer += _read_unpacked_repeated_outstanding_rewards(pointer, bs, nil(), counters);
      } else
      if (fieldId == 6) {
        pointer += _read_unpacked_repeated_validator_accumulated_commissions(pointer, bs, nil(), counters);
      } else
      if (fieldId == 7) {
        pointer += _read_unpacked_repeated_validator_historical_rewards(pointer, bs, nil(), counters);
      } else
      if (fieldId == 8) {
        pointer += _read_unpacked_repeated_validator_current_rewards(pointer, bs, nil(), counters);
      } else
      if (fieldId == 9) {
        pointer += _read_unpacked_repeated_delegator_starting_infos(pointer, bs, nil(), counters);
      } else
      if (fieldId == 10) {
        pointer += _read_unpacked_repeated_validator_slash_events(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[3] > 0) {
      require(r.delegator_withdraw_infos.length == 0);
      r.delegator_withdraw_infos = new CosmosDistributionV1beta1DelegatorWithdrawInfo.Data[](counters[3]);
    }
    if (counters[5] > 0) {
      require(r.outstanding_rewards.length == 0);
      r.outstanding_rewards = new CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord.Data[](counters[5]);
    }
    if (counters[6] > 0) {
      require(r.validator_accumulated_commissions.length == 0);
      r.validator_accumulated_commissions = new CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord.Data[](counters[6]);
    }
    if (counters[7] > 0) {
      require(r.validator_historical_rewards.length == 0);
      r.validator_historical_rewards = new CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord.Data[](counters[7]);
    }
    if (counters[8] > 0) {
      require(r.validator_current_rewards.length == 0);
      r.validator_current_rewards = new CosmosDistributionV1beta1ValidatorCurrentRewardsRecord.Data[](counters[8]);
    }
    if (counters[9] > 0) {
      require(r.delegator_starting_infos.length == 0);
      r.delegator_starting_infos = new CosmosDistributionV1beta1DelegatorStartingInfoRecord.Data[](counters[9]);
    }
    if (counters[10] > 0) {
      require(r.validator_slash_events.length == 0);
      r.validator_slash_events = new CosmosDistributionV1beta1ValidatorSlashEventRecord.Data[](counters[10]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_delegator_withdraw_infos(pointer, bs, r, counters);
      } else
      if (fieldId == 5) {
        pointer += _read_unpacked_repeated_outstanding_rewards(pointer, bs, r, counters);
      } else
      if (fieldId == 6) {
        pointer += _read_unpacked_repeated_validator_accumulated_commissions(pointer, bs, r, counters);
      } else
      if (fieldId == 7) {
        pointer += _read_unpacked_repeated_validator_historical_rewards(pointer, bs, r, counters);
      } else
      if (fieldId == 8) {
        pointer += _read_unpacked_repeated_validator_current_rewards(pointer, bs, r, counters);
      } else
      if (fieldId == 9) {
        pointer += _read_unpacked_repeated_delegator_starting_infos(pointer, bs, r, counters);
      } else
      if (fieldId == 10) {
        pointer += _read_unpacked_repeated_validator_slash_events(pointer, bs, r, counters);
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
    (CosmosDistributionV1beta1Params.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1Params(p, bs);
    r.params = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_fee_pool(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosDistributionV1beta1FeePool.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1FeePool(p, bs);
    r.fee_pool = x;
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
  function _read_unpacked_repeated_delegator_withdraw_infos(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[11] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosDistributionV1beta1DelegatorWithdrawInfo.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1DelegatorWithdrawInfo(p, bs);
    if (isNil(r)) {
      counters[3] += 1;
    } else {
      r.delegator_withdraw_infos[r.delegator_withdraw_infos.length - counters[3]] = x;
      counters[3] -= 1;
    }
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_previous_proposer(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.previous_proposer = x;
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
  function _read_unpacked_repeated_outstanding_rewards(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[11] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord(p, bs);
    if (isNil(r)) {
      counters[5] += 1;
    } else {
      r.outstanding_rewards[r.outstanding_rewards.length - counters[5]] = x;
      counters[5] -= 1;
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
  function _read_unpacked_repeated_validator_accumulated_commissions(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[11] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord(p, bs);
    if (isNil(r)) {
      counters[6] += 1;
    } else {
      r.validator_accumulated_commissions[r.validator_accumulated_commissions.length - counters[6]] = x;
      counters[6] -= 1;
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
  function _read_unpacked_repeated_validator_historical_rewards(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[11] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord(p, bs);
    if (isNil(r)) {
      counters[7] += 1;
    } else {
      r.validator_historical_rewards[r.validator_historical_rewards.length - counters[7]] = x;
      counters[7] -= 1;
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
  function _read_unpacked_repeated_validator_current_rewards(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[11] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosDistributionV1beta1ValidatorCurrentRewardsRecord.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1ValidatorCurrentRewardsRecord(p, bs);
    if (isNil(r)) {
      counters[8] += 1;
    } else {
      r.validator_current_rewards[r.validator_current_rewards.length - counters[8]] = x;
      counters[8] -= 1;
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
  function _read_unpacked_repeated_delegator_starting_infos(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[11] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosDistributionV1beta1DelegatorStartingInfoRecord.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1DelegatorStartingInfoRecord(p, bs);
    if (isNil(r)) {
      counters[9] += 1;
    } else {
      r.delegator_starting_infos[r.delegator_starting_infos.length - counters[9]] = x;
      counters[9] -= 1;
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
  function _read_unpacked_repeated_validator_slash_events(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[11] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosDistributionV1beta1ValidatorSlashEventRecord.Data memory x, uint256 sz) = _decode_CosmosDistributionV1beta1ValidatorSlashEventRecord(p, bs);
    if (isNil(r)) {
      counters[10] += 1;
    } else {
      r.validator_slash_events[r.validator_slash_events.length - counters[10]] = x;
      counters[10] -= 1;
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
  function _decode_CosmosDistributionV1beta1Params(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1Params.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1Params.Data memory r, ) = CosmosDistributionV1beta1Params._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosDistributionV1beta1FeePool(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1FeePool.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1FeePool.Data memory r, ) = CosmosDistributionV1beta1FeePool._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosDistributionV1beta1DelegatorWithdrawInfo(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1DelegatorWithdrawInfo.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1DelegatorWithdrawInfo.Data memory r, ) = CosmosDistributionV1beta1DelegatorWithdrawInfo._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord.Data memory r, ) = CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord.Data memory r, ) = CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord.Data memory r, ) = CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosDistributionV1beta1ValidatorCurrentRewardsRecord(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1ValidatorCurrentRewardsRecord.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1ValidatorCurrentRewardsRecord.Data memory r, ) = CosmosDistributionV1beta1ValidatorCurrentRewardsRecord._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosDistributionV1beta1DelegatorStartingInfoRecord(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1DelegatorStartingInfoRecord.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1DelegatorStartingInfoRecord.Data memory r, ) = CosmosDistributionV1beta1DelegatorStartingInfoRecord._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosDistributionV1beta1ValidatorSlashEventRecord(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosDistributionV1beta1ValidatorSlashEventRecord.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosDistributionV1beta1ValidatorSlashEventRecord.Data memory r, ) = CosmosDistributionV1beta1ValidatorSlashEventRecord._decode(pointer, bs, sz);
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
    pointer += CosmosDistributionV1beta1Params._encode_nested(r.params, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosDistributionV1beta1FeePool._encode_nested(r.fee_pool, pointer, bs);
    
    if (r.delegator_withdraw_infos.length != 0) {
    for(i = 0; i < r.delegator_withdraw_infos.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        3,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosDistributionV1beta1DelegatorWithdrawInfo._encode_nested(r.delegator_withdraw_infos[i], pointer, bs);
    }
    }
    if (bytes(r.previous_proposer).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.previous_proposer, pointer, bs);
    }
    if (r.outstanding_rewards.length != 0) {
    for(i = 0; i < r.outstanding_rewards.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        5,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord._encode_nested(r.outstanding_rewards[i], pointer, bs);
    }
    }
    if (r.validator_accumulated_commissions.length != 0) {
    for(i = 0; i < r.validator_accumulated_commissions.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        6,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord._encode_nested(r.validator_accumulated_commissions[i], pointer, bs);
    }
    }
    if (r.validator_historical_rewards.length != 0) {
    for(i = 0; i < r.validator_historical_rewards.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        7,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord._encode_nested(r.validator_historical_rewards[i], pointer, bs);
    }
    }
    if (r.validator_current_rewards.length != 0) {
    for(i = 0; i < r.validator_current_rewards.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        8,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosDistributionV1beta1ValidatorCurrentRewardsRecord._encode_nested(r.validator_current_rewards[i], pointer, bs);
    }
    }
    if (r.delegator_starting_infos.length != 0) {
    for(i = 0; i < r.delegator_starting_infos.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        9,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosDistributionV1beta1DelegatorStartingInfoRecord._encode_nested(r.delegator_starting_infos[i], pointer, bs);
    }
    }
    if (r.validator_slash_events.length != 0) {
    for(i = 0; i < r.validator_slash_events.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        10,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosDistributionV1beta1ValidatorSlashEventRecord._encode_nested(r.validator_slash_events[i], pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1Params._estimate(r.params));
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1FeePool._estimate(r.fee_pool));
    for(i = 0; i < r.delegator_withdraw_infos.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1DelegatorWithdrawInfo._estimate(r.delegator_withdraw_infos[i]));
    }
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.previous_proposer).length);
    for(i = 0; i < r.outstanding_rewards.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord._estimate(r.outstanding_rewards[i]));
    }
    for(i = 0; i < r.validator_accumulated_commissions.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord._estimate(r.validator_accumulated_commissions[i]));
    }
    for(i = 0; i < r.validator_historical_rewards.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord._estimate(r.validator_historical_rewards[i]));
    }
    for(i = 0; i < r.validator_current_rewards.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1ValidatorCurrentRewardsRecord._estimate(r.validator_current_rewards[i]));
    }
    for(i = 0; i < r.delegator_starting_infos.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1DelegatorStartingInfoRecord._estimate(r.delegator_starting_infos[i]));
    }
    for(i = 0; i < r.validator_slash_events.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosDistributionV1beta1ValidatorSlashEventRecord._estimate(r.validator_slash_events[i]));
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.delegator_withdraw_infos.length != 0) {
    return false;
  }

  if (bytes(r.previous_proposer).length != 0) {
    return false;
  }

  if (r.outstanding_rewards.length != 0) {
    return false;
  }

  if (r.validator_accumulated_commissions.length != 0) {
    return false;
  }

  if (r.validator_historical_rewards.length != 0) {
    return false;
  }

  if (r.validator_current_rewards.length != 0) {
    return false;
  }

  if (r.delegator_starting_infos.length != 0) {
    return false;
  }

  if (r.validator_slash_events.length != 0) {
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
    CosmosDistributionV1beta1Params.store(input.params, output.params);
    CosmosDistributionV1beta1FeePool.store(input.fee_pool, output.fee_pool);

    for(uint256 i3 = 0; i3 < input.delegator_withdraw_infos.length; i3++) {
      output.delegator_withdraw_infos.push(input.delegator_withdraw_infos[i3]);
    }
    
    output.previous_proposer = input.previous_proposer;

    for(uint256 i5 = 0; i5 < input.outstanding_rewards.length; i5++) {
      output.outstanding_rewards.push(input.outstanding_rewards[i5]);
    }
    

    for(uint256 i6 = 0; i6 < input.validator_accumulated_commissions.length; i6++) {
      output.validator_accumulated_commissions.push(input.validator_accumulated_commissions[i6]);
    }
    

    for(uint256 i7 = 0; i7 < input.validator_historical_rewards.length; i7++) {
      output.validator_historical_rewards.push(input.validator_historical_rewards[i7]);
    }
    

    for(uint256 i8 = 0; i8 < input.validator_current_rewards.length; i8++) {
      output.validator_current_rewards.push(input.validator_current_rewards[i8]);
    }
    

    for(uint256 i9 = 0; i9 < input.delegator_starting_infos.length; i9++) {
      output.delegator_starting_infos.push(input.delegator_starting_infos[i9]);
    }
    

    for(uint256 i10 = 0; i10 < input.validator_slash_events.length; i10++) {
      output.validator_slash_events.push(input.validator_slash_events[i10]);
    }
    

  }


  //array helpers for DelegatorWithdrawInfos
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addDelegatorWithdrawInfos(Data memory self, CosmosDistributionV1beta1DelegatorWithdrawInfo.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosDistributionV1beta1DelegatorWithdrawInfo.Data[] memory tmp = new CosmosDistributionV1beta1DelegatorWithdrawInfo.Data[](self.delegator_withdraw_infos.length + 1);
    for (uint256 i = 0; i < self.delegator_withdraw_infos.length; i++) {
      tmp[i] = self.delegator_withdraw_infos[i];
    }
    tmp[self.delegator_withdraw_infos.length] = value;
    self.delegator_withdraw_infos = tmp;
  }

  //array helpers for OutstandingRewards
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addOutstandingRewards(Data memory self, CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord.Data[] memory tmp = new CosmosDistributionV1beta1ValidatorOutstandingRewardsRecord.Data[](self.outstanding_rewards.length + 1);
    for (uint256 i = 0; i < self.outstanding_rewards.length; i++) {
      tmp[i] = self.outstanding_rewards[i];
    }
    tmp[self.outstanding_rewards.length] = value;
    self.outstanding_rewards = tmp;
  }

  //array helpers for ValidatorAccumulatedCommissions
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addValidatorAccumulatedCommissions(Data memory self, CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord.Data[] memory tmp = new CosmosDistributionV1beta1ValidatorAccumulatedCommissionRecord.Data[](self.validator_accumulated_commissions.length + 1);
    for (uint256 i = 0; i < self.validator_accumulated_commissions.length; i++) {
      tmp[i] = self.validator_accumulated_commissions[i];
    }
    tmp[self.validator_accumulated_commissions.length] = value;
    self.validator_accumulated_commissions = tmp;
  }

  //array helpers for ValidatorHistoricalRewards
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addValidatorHistoricalRewards(Data memory self, CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord.Data[] memory tmp = new CosmosDistributionV1beta1ValidatorHistoricalRewardsRecord.Data[](self.validator_historical_rewards.length + 1);
    for (uint256 i = 0; i < self.validator_historical_rewards.length; i++) {
      tmp[i] = self.validator_historical_rewards[i];
    }
    tmp[self.validator_historical_rewards.length] = value;
    self.validator_historical_rewards = tmp;
  }

  //array helpers for ValidatorCurrentRewards
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addValidatorCurrentRewards(Data memory self, CosmosDistributionV1beta1ValidatorCurrentRewardsRecord.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosDistributionV1beta1ValidatorCurrentRewardsRecord.Data[] memory tmp = new CosmosDistributionV1beta1ValidatorCurrentRewardsRecord.Data[](self.validator_current_rewards.length + 1);
    for (uint256 i = 0; i < self.validator_current_rewards.length; i++) {
      tmp[i] = self.validator_current_rewards[i];
    }
    tmp[self.validator_current_rewards.length] = value;
    self.validator_current_rewards = tmp;
  }

  //array helpers for DelegatorStartingInfos
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addDelegatorStartingInfos(Data memory self, CosmosDistributionV1beta1DelegatorStartingInfoRecord.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosDistributionV1beta1DelegatorStartingInfoRecord.Data[] memory tmp = new CosmosDistributionV1beta1DelegatorStartingInfoRecord.Data[](self.delegator_starting_infos.length + 1);
    for (uint256 i = 0; i < self.delegator_starting_infos.length; i++) {
      tmp[i] = self.delegator_starting_infos[i];
    }
    tmp[self.delegator_starting_infos.length] = value;
    self.delegator_starting_infos = tmp;
  }

  //array helpers for ValidatorSlashEvents
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addValidatorSlashEvents(Data memory self, CosmosDistributionV1beta1ValidatorSlashEventRecord.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosDistributionV1beta1ValidatorSlashEventRecord.Data[] memory tmp = new CosmosDistributionV1beta1ValidatorSlashEventRecord.Data[](self.validator_slash_events.length + 1);
    for (uint256 i = 0; i < self.validator_slash_events.length; i++) {
      tmp[i] = self.validator_slash_events[i];
    }
    tmp[self.validator_slash_events.length] = value;
    self.validator_slash_events = tmp;
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
//library CosmosDistributionV1beta1GenesisState