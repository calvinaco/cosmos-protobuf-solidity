// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;
import "../../../ProtoBufRuntime.sol";
import "../../../GoogleProtobufTimestamp.sol";
import "../../../GoogleProtobufDuration.sol";
import "../../../GoogleProtobufAny.sol";
import "../../base/v1beta1/coin.sol";
import "../../../cosmos_proto/cosmos.sol";

library CosmosGovV1WeightedVoteOption {


  //struct definition
  struct Data {
    COSMOS_GOV_V1_GOV_PROTO_GLOBAL_ENUMS.VoteOption option;
    string weight;
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
        pointer += _read_option(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_weight(pointer, bs, r);
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
  function _read_option(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 tmp, uint256 sz) = ProtoBufRuntime._decode_enum(p, bs);
    COSMOS_GOV_V1_GOV_PROTO_GLOBAL_ENUMS.VoteOption x = COSMOS_GOV_V1_GOV_PROTO_GLOBAL_ENUMS.decode_VoteOption(tmp);
    r.option = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_weight(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.weight = x;
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
    
    if (uint(r.option) != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    int32 _enum_option = COSMOS_GOV_V1_GOV_PROTO_GLOBAL_ENUMS.encode_VoteOption(r.option);
    pointer += ProtoBufRuntime._encode_enum(_enum_option, pointer, bs);
    }
    if (bytes(r.weight).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.weight, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_enum(COSMOS_GOV_V1_GOV_PROTO_GLOBAL_ENUMS.encode_VoteOption(r.option));
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.weight).length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (uint(r.option) != 0) {
    return false;
  }

  if (bytes(r.weight).length != 0) {
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
    output.option = input.option;
    output.weight = input.weight;

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
//library CosmosGovV1WeightedVoteOption

library CosmosGovV1Deposit {


  //struct definition
  struct Data {
    uint64 proposal_id;
    string depositor;
    CosmosBaseV1beta1Coin.Data[] amount;
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
    uint[4] memory counters;
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_proposal_id(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_depositor(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_amount(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[3] > 0) {
      require(r.amount.length == 0);
      r.amount = new CosmosBaseV1beta1Coin.Data[](counters[3]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_amount(pointer, bs, r, counters);
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
  function _read_proposal_id(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.proposal_id = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_depositor(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.depositor = x;
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
  function _read_unpacked_repeated_amount(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[4] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosBaseV1beta1Coin.Data memory x, uint256 sz) = _decode_CosmosBaseV1beta1Coin(p, bs);
    if (isNil(r)) {
      counters[3] += 1;
    } else {
      r.amount[r.amount.length - counters[3]] = x;
      counters[3] -= 1;
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
    if (r.proposal_id != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.proposal_id, pointer, bs);
    }
    if (bytes(r.depositor).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.depositor, pointer, bs);
    }
    if (r.amount.length != 0) {
    for(i = 0; i < r.amount.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        3,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosBaseV1beta1Coin._encode_nested(r.amount[i], pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_uint64(r.proposal_id);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.depositor).length);
    for(i = 0; i < r.amount.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseV1beta1Coin._estimate(r.amount[i]));
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.proposal_id != 0) {
    return false;
  }

  if (bytes(r.depositor).length != 0) {
    return false;
  }

  if (r.amount.length != 0) {
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
    output.proposal_id = input.proposal_id;
    output.depositor = input.depositor;

    for(uint256 i3 = 0; i3 < input.amount.length; i3++) {
      output.amount.push(input.amount[i3]);
    }
    

  }


  //array helpers for Amount
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addAmount(Data memory self, CosmosBaseV1beta1Coin.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosBaseV1beta1Coin.Data[] memory tmp = new CosmosBaseV1beta1Coin.Data[](self.amount.length + 1);
    for (uint256 i = 0; i < self.amount.length; i++) {
      tmp[i] = self.amount[i];
    }
    tmp[self.amount.length] = value;
    self.amount = tmp;
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
//library CosmosGovV1Deposit

library CosmosGovV1Proposal {


  //struct definition
  struct Data {
    uint64 id;
    GoogleProtobufAny.Data[] messages;
    COSMOS_GOV_V1_GOV_PROTO_GLOBAL_ENUMS.ProposalStatus status;
    CosmosGovV1TallyResult.Data final_tally_result;
    GoogleProtobufTimestamp.Data submit_time;
    GoogleProtobufTimestamp.Data deposit_end_time;
    CosmosBaseV1beta1Coin.Data[] total_deposit;
    GoogleProtobufTimestamp.Data voting_start_time;
    GoogleProtobufTimestamp.Data voting_end_time;
    string metadata;
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
        pointer += _read_id(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_messages(pointer, bs, nil(), counters);
      } else
      if (fieldId == 3) {
        pointer += _read_status(pointer, bs, r);
      } else
      if (fieldId == 4) {
        pointer += _read_final_tally_result(pointer, bs, r);
      } else
      if (fieldId == 5) {
        pointer += _read_submit_time(pointer, bs, r);
      } else
      if (fieldId == 6) {
        pointer += _read_deposit_end_time(pointer, bs, r);
      } else
      if (fieldId == 7) {
        pointer += _read_unpacked_repeated_total_deposit(pointer, bs, nil(), counters);
      } else
      if (fieldId == 8) {
        pointer += _read_voting_start_time(pointer, bs, r);
      } else
      if (fieldId == 9) {
        pointer += _read_voting_end_time(pointer, bs, r);
      } else
      if (fieldId == 10) {
        pointer += _read_metadata(pointer, bs, r);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[2] > 0) {
      require(r.messages.length == 0);
      r.messages = new GoogleProtobufAny.Data[](counters[2]);
    }
    if (counters[7] > 0) {
      require(r.total_deposit.length == 0);
      r.total_deposit = new CosmosBaseV1beta1Coin.Data[](counters[7]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_messages(pointer, bs, r, counters);
      } else
      if (fieldId == 7) {
        pointer += _read_unpacked_repeated_total_deposit(pointer, bs, r, counters);
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
  function _read_id(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.id = x;
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
  function _read_unpacked_repeated_messages(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[11] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (GoogleProtobufAny.Data memory x, uint256 sz) = _decode_GoogleProtobufAny(p, bs);
    if (isNil(r)) {
      counters[2] += 1;
    } else {
      r.messages[r.messages.length - counters[2]] = x;
      counters[2] -= 1;
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
  function _read_status(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 tmp, uint256 sz) = ProtoBufRuntime._decode_enum(p, bs);
    COSMOS_GOV_V1_GOV_PROTO_GLOBAL_ENUMS.ProposalStatus x = COSMOS_GOV_V1_GOV_PROTO_GLOBAL_ENUMS.decode_ProposalStatus(tmp);
    r.status = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_final_tally_result(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosGovV1TallyResult.Data memory x, uint256 sz) = _decode_CosmosGovV1TallyResult(p, bs);
    r.final_tally_result = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_submit_time(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (GoogleProtobufTimestamp.Data memory x, uint256 sz) = _decode_GoogleProtobufTimestamp(p, bs);
    r.submit_time = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_deposit_end_time(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (GoogleProtobufTimestamp.Data memory x, uint256 sz) = _decode_GoogleProtobufTimestamp(p, bs);
    r.deposit_end_time = x;
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
  function _read_unpacked_repeated_total_deposit(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[11] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosBaseV1beta1Coin.Data memory x, uint256 sz) = _decode_CosmosBaseV1beta1Coin(p, bs);
    if (isNil(r)) {
      counters[7] += 1;
    } else {
      r.total_deposit[r.total_deposit.length - counters[7]] = x;
      counters[7] -= 1;
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
  function _read_voting_start_time(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (GoogleProtobufTimestamp.Data memory x, uint256 sz) = _decode_GoogleProtobufTimestamp(p, bs);
    r.voting_start_time = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_voting_end_time(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (GoogleProtobufTimestamp.Data memory x, uint256 sz) = _decode_GoogleProtobufTimestamp(p, bs);
    r.voting_end_time = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_metadata(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.metadata = x;
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
  function _decode_GoogleProtobufAny(uint256 p, bytes memory bs)
    internal
    pure
    returns (GoogleProtobufAny.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (GoogleProtobufAny.Data memory r, ) = GoogleProtobufAny._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosGovV1TallyResult(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosGovV1TallyResult.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosGovV1TallyResult.Data memory r, ) = CosmosGovV1TallyResult._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_GoogleProtobufTimestamp(uint256 p, bytes memory bs)
    internal
    pure
    returns (GoogleProtobufTimestamp.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (GoogleProtobufTimestamp.Data memory r, ) = GoogleProtobufTimestamp._decode(pointer, bs, sz);
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
    if (r.id != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.id, pointer, bs);
    }
    if (r.messages.length != 0) {
    for(i = 0; i < r.messages.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        2,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += GoogleProtobufAny._encode_nested(r.messages[i], pointer, bs);
    }
    }
    if (uint(r.status) != 0) {
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    int32 _enum_status = COSMOS_GOV_V1_GOV_PROTO_GLOBAL_ENUMS.encode_ProposalStatus(r.status);
    pointer += ProtoBufRuntime._encode_enum(_enum_status, pointer, bs);
    }
    
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosGovV1TallyResult._encode_nested(r.final_tally_result, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      5,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += GoogleProtobufTimestamp._encode_nested(r.submit_time, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      6,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += GoogleProtobufTimestamp._encode_nested(r.deposit_end_time, pointer, bs);
    
    if (r.total_deposit.length != 0) {
    for(i = 0; i < r.total_deposit.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        7,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosBaseV1beta1Coin._encode_nested(r.total_deposit[i], pointer, bs);
    }
    }
    
    pointer += ProtoBufRuntime._encode_key(
      8,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += GoogleProtobufTimestamp._encode_nested(r.voting_start_time, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      9,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += GoogleProtobufTimestamp._encode_nested(r.voting_end_time, pointer, bs);
    
    if (bytes(r.metadata).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      10,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.metadata, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_uint64(r.id);
    for(i = 0; i < r.messages.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(GoogleProtobufAny._estimate(r.messages[i]));
    }
    e += 1 + ProtoBufRuntime._sz_enum(COSMOS_GOV_V1_GOV_PROTO_GLOBAL_ENUMS.encode_ProposalStatus(r.status));
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosGovV1TallyResult._estimate(r.final_tally_result));
    e += 1 + ProtoBufRuntime._sz_lendelim(GoogleProtobufTimestamp._estimate(r.submit_time));
    e += 1 + ProtoBufRuntime._sz_lendelim(GoogleProtobufTimestamp._estimate(r.deposit_end_time));
    for(i = 0; i < r.total_deposit.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseV1beta1Coin._estimate(r.total_deposit[i]));
    }
    e += 1 + ProtoBufRuntime._sz_lendelim(GoogleProtobufTimestamp._estimate(r.voting_start_time));
    e += 1 + ProtoBufRuntime._sz_lendelim(GoogleProtobufTimestamp._estimate(r.voting_end_time));
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.metadata).length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.id != 0) {
    return false;
  }

  if (r.messages.length != 0) {
    return false;
  }

  if (uint(r.status) != 0) {
    return false;
  }

  if (r.total_deposit.length != 0) {
    return false;
  }

  if (bytes(r.metadata).length != 0) {
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
    output.id = input.id;

    for(uint256 i2 = 0; i2 < input.messages.length; i2++) {
      output.messages.push(input.messages[i2]);
    }
    
    output.status = input.status;
    CosmosGovV1TallyResult.store(input.final_tally_result, output.final_tally_result);
    GoogleProtobufTimestamp.store(input.submit_time, output.submit_time);
    GoogleProtobufTimestamp.store(input.deposit_end_time, output.deposit_end_time);

    for(uint256 i7 = 0; i7 < input.total_deposit.length; i7++) {
      output.total_deposit.push(input.total_deposit[i7]);
    }
    
    GoogleProtobufTimestamp.store(input.voting_start_time, output.voting_start_time);
    GoogleProtobufTimestamp.store(input.voting_end_time, output.voting_end_time);
    output.metadata = input.metadata;

  }


  //array helpers for Messages
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addMessages(Data memory self, GoogleProtobufAny.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    GoogleProtobufAny.Data[] memory tmp = new GoogleProtobufAny.Data[](self.messages.length + 1);
    for (uint256 i = 0; i < self.messages.length; i++) {
      tmp[i] = self.messages[i];
    }
    tmp[self.messages.length] = value;
    self.messages = tmp;
  }

  //array helpers for TotalDeposit
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addTotalDeposit(Data memory self, CosmosBaseV1beta1Coin.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosBaseV1beta1Coin.Data[] memory tmp = new CosmosBaseV1beta1Coin.Data[](self.total_deposit.length + 1);
    for (uint256 i = 0; i < self.total_deposit.length; i++) {
      tmp[i] = self.total_deposit[i];
    }
    tmp[self.total_deposit.length] = value;
    self.total_deposit = tmp;
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
//library CosmosGovV1Proposal

library CosmosGovV1TallyResult {


  //struct definition
  struct Data {
    string yes_count;
    string abstain_count;
    string no_count;
    string no_with_veto_count;
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
        pointer += _read_yes_count(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_abstain_count(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_no_count(pointer, bs, r);
      } else
      if (fieldId == 4) {
        pointer += _read_no_with_veto_count(pointer, bs, r);
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
  function _read_yes_count(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.yes_count = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_abstain_count(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.abstain_count = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_no_count(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.no_count = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_no_with_veto_count(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.no_with_veto_count = x;
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
    
    if (bytes(r.yes_count).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.yes_count, pointer, bs);
    }
    if (bytes(r.abstain_count).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.abstain_count, pointer, bs);
    }
    if (bytes(r.no_count).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.no_count, pointer, bs);
    }
    if (bytes(r.no_with_veto_count).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.no_with_veto_count, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.yes_count).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.abstain_count).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.no_count).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.no_with_veto_count).length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.yes_count).length != 0) {
    return false;
  }

  if (bytes(r.abstain_count).length != 0) {
    return false;
  }

  if (bytes(r.no_count).length != 0) {
    return false;
  }

  if (bytes(r.no_with_veto_count).length != 0) {
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
    output.yes_count = input.yes_count;
    output.abstain_count = input.abstain_count;
    output.no_count = input.no_count;
    output.no_with_veto_count = input.no_with_veto_count;

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
//library CosmosGovV1TallyResult

library CosmosGovV1Vote {


  //struct definition
  struct Data {
    uint64 proposal_id;
    string voter;
    CosmosGovV1WeightedVoteOption.Data[] options;
    string metadata;
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
    uint[6] memory counters;
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_proposal_id(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_voter(pointer, bs, r);
      } else
      if (fieldId == 4) {
        pointer += _read_unpacked_repeated_options(pointer, bs, nil(), counters);
      } else
      if (fieldId == 5) {
        pointer += _read_metadata(pointer, bs, r);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[4] > 0) {
      require(r.options.length == 0);
      r.options = new CosmosGovV1WeightedVoteOption.Data[](counters[4]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 4) {
        pointer += _read_unpacked_repeated_options(pointer, bs, r, counters);
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
  function _read_proposal_id(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.proposal_id = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_voter(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.voter = x;
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
  function _read_unpacked_repeated_options(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[6] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosGovV1WeightedVoteOption.Data memory x, uint256 sz) = _decode_CosmosGovV1WeightedVoteOption(p, bs);
    if (isNil(r)) {
      counters[4] += 1;
    } else {
      r.options[r.options.length - counters[4]] = x;
      counters[4] -= 1;
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
  function _read_metadata(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.metadata = x;
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
  function _decode_CosmosGovV1WeightedVoteOption(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosGovV1WeightedVoteOption.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosGovV1WeightedVoteOption.Data memory r, ) = CosmosGovV1WeightedVoteOption._decode(pointer, bs, sz);
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
    if (r.proposal_id != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.proposal_id, pointer, bs);
    }
    if (bytes(r.voter).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.voter, pointer, bs);
    }
    if (r.options.length != 0) {
    for(i = 0; i < r.options.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        4,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosGovV1WeightedVoteOption._encode_nested(r.options[i], pointer, bs);
    }
    }
    if (bytes(r.metadata).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      5,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.metadata, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_uint64(r.proposal_id);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.voter).length);
    for(i = 0; i < r.options.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosGovV1WeightedVoteOption._estimate(r.options[i]));
    }
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.metadata).length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.proposal_id != 0) {
    return false;
  }

  if (bytes(r.voter).length != 0) {
    return false;
  }

  if (r.options.length != 0) {
    return false;
  }

  if (bytes(r.metadata).length != 0) {
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
    output.proposal_id = input.proposal_id;
    output.voter = input.voter;

    for(uint256 i4 = 0; i4 < input.options.length; i4++) {
      output.options.push(input.options[i4]);
    }
    
    output.metadata = input.metadata;

  }


  //array helpers for Options
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addOptions(Data memory self, CosmosGovV1WeightedVoteOption.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosGovV1WeightedVoteOption.Data[] memory tmp = new CosmosGovV1WeightedVoteOption.Data[](self.options.length + 1);
    for (uint256 i = 0; i < self.options.length; i++) {
      tmp[i] = self.options[i];
    }
    tmp[self.options.length] = value;
    self.options = tmp;
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
//library CosmosGovV1Vote

library CosmosGovV1DepositParams {


  //struct definition
  struct Data {
    CosmosBaseV1beta1Coin.Data[] min_deposit;
    GoogleProtobufDuration.Data max_deposit_period;
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
        pointer += _read_unpacked_repeated_min_deposit(pointer, bs, nil(), counters);
      } else
      if (fieldId == 2) {
        pointer += _read_max_deposit_period(pointer, bs, r);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[1] > 0) {
      require(r.min_deposit.length == 0);
      r.min_deposit = new CosmosBaseV1beta1Coin.Data[](counters[1]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_unpacked_repeated_min_deposit(pointer, bs, r, counters);
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
   * @param counters The counters for repeated fields
   * @return The number of bytes decoded
   */
  function _read_unpacked_repeated_min_deposit(
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
      counters[1] += 1;
    } else {
      r.min_deposit[r.min_deposit.length - counters[1]] = x;
      counters[1] -= 1;
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
  function _read_max_deposit_period(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (GoogleProtobufDuration.Data memory x, uint256 sz) = _decode_GoogleProtobufDuration(p, bs);
    r.max_deposit_period = x;
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

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_GoogleProtobufDuration(uint256 p, bytes memory bs)
    internal
    pure
    returns (GoogleProtobufDuration.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (GoogleProtobufDuration.Data memory r, ) = GoogleProtobufDuration._decode(pointer, bs, sz);
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
    if (r.min_deposit.length != 0) {
    for(i = 0; i < r.min_deposit.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        1,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosBaseV1beta1Coin._encode_nested(r.min_deposit[i], pointer, bs);
    }
    }
    
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += GoogleProtobufDuration._encode_nested(r.max_deposit_period, pointer, bs);
    
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
    for(i = 0; i < r.min_deposit.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseV1beta1Coin._estimate(r.min_deposit[i]));
    }
    e += 1 + ProtoBufRuntime._sz_lendelim(GoogleProtobufDuration._estimate(r.max_deposit_period));
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.min_deposit.length != 0) {
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

    for(uint256 i1 = 0; i1 < input.min_deposit.length; i1++) {
      output.min_deposit.push(input.min_deposit[i1]);
    }
    
    GoogleProtobufDuration.store(input.max_deposit_period, output.max_deposit_period);

  }


  //array helpers for MinDeposit
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addMinDeposit(Data memory self, CosmosBaseV1beta1Coin.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosBaseV1beta1Coin.Data[] memory tmp = new CosmosBaseV1beta1Coin.Data[](self.min_deposit.length + 1);
    for (uint256 i = 0; i < self.min_deposit.length; i++) {
      tmp[i] = self.min_deposit[i];
    }
    tmp[self.min_deposit.length] = value;
    self.min_deposit = tmp;
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
//library CosmosGovV1DepositParams

library CosmosGovV1VotingParams {


  //struct definition
  struct Data {
    GoogleProtobufDuration.Data voting_period;
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
        pointer += _read_voting_period(pointer, bs, r);
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
  function _read_voting_period(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (GoogleProtobufDuration.Data memory x, uint256 sz) = _decode_GoogleProtobufDuration(p, bs);
    r.voting_period = x;
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
  function _decode_GoogleProtobufDuration(uint256 p, bytes memory bs)
    internal
    pure
    returns (GoogleProtobufDuration.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (GoogleProtobufDuration.Data memory r, ) = GoogleProtobufDuration._decode(pointer, bs, sz);
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
    
    
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += GoogleProtobufDuration._encode_nested(r.voting_period, pointer, bs);
    
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
    e += 1 + ProtoBufRuntime._sz_lendelim(GoogleProtobufDuration._estimate(r.voting_period));
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
    return true;
  }


  //store function
  /**
   * @dev Store in-memory struct to storage
   * @param input The in-memory struct
   * @param output The in-storage struct
   */
  function store(Data memory input, Data storage output) internal {
    GoogleProtobufDuration.store(input.voting_period, output.voting_period);

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
//library CosmosGovV1VotingParams

library CosmosGovV1TallyParams {


  //struct definition
  struct Data {
    string quorum;
    string threshold;
    string veto_threshold;
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
        pointer += _read_quorum(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_threshold(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_veto_threshold(pointer, bs, r);
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
  function _read_quorum(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.quorum = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_threshold(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.threshold = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_veto_threshold(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.veto_threshold = x;
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
    
    if (bytes(r.quorum).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.quorum, pointer, bs);
    }
    if (bytes(r.threshold).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.threshold, pointer, bs);
    }
    if (bytes(r.veto_threshold).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.veto_threshold, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.quorum).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.threshold).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.veto_threshold).length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.quorum).length != 0) {
    return false;
  }

  if (bytes(r.threshold).length != 0) {
    return false;
  }

  if (bytes(r.veto_threshold).length != 0) {
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
    output.quorum = input.quorum;
    output.threshold = input.threshold;
    output.veto_threshold = input.veto_threshold;

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
//library CosmosGovV1TallyParams

library COSMOS_GOV_V1_GOV_PROTO_GLOBAL_ENUMS {

  //enum definition
  // Solidity enum definitions
  enum VoteOption {
    VOTE_OPTION_UNSPECIFIED,
    VOTE_OPTION_YES,
    VOTE_OPTION_ABSTAIN,
    VOTE_OPTION_NO,
    VOTE_OPTION_NO_WITH_VETO
  }


  // Solidity enum encoder
  function encode_VoteOption(VoteOption x) internal pure returns (int32) {
    
    if (x == VoteOption.VOTE_OPTION_UNSPECIFIED) {
      return 0;
    }

    if (x == VoteOption.VOTE_OPTION_YES) {
      return 1;
    }

    if (x == VoteOption.VOTE_OPTION_ABSTAIN) {
      return 2;
    }

    if (x == VoteOption.VOTE_OPTION_NO) {
      return 3;
    }

    if (x == VoteOption.VOTE_OPTION_NO_WITH_VETO) {
      return 4;
    }
    revert();
  }


  // Solidity enum decoder
  function decode_VoteOption(int64 x) internal pure returns (VoteOption) {
    
    if (x == 0) {
      return VoteOption.VOTE_OPTION_UNSPECIFIED;
    }

    if (x == 1) {
      return VoteOption.VOTE_OPTION_YES;
    }

    if (x == 2) {
      return VoteOption.VOTE_OPTION_ABSTAIN;
    }

    if (x == 3) {
      return VoteOption.VOTE_OPTION_NO;
    }

    if (x == 4) {
      return VoteOption.VOTE_OPTION_NO_WITH_VETO;
    }
    revert();
  }


  /**
   * @dev The estimator for an packed enum array
   * @return The number of bytes encoded
   */
  function estimate_packed_repeated_VoteOption(
    VoteOption[] memory a
  ) internal pure returns (uint256) {
    uint256 e = 0;
    for (uint i = 0; i < a.length; i++) {
      e += ProtoBufRuntime._sz_enum(encode_VoteOption(a[i]));
    }
    return e;
  }

  // Solidity enum definitions
  enum ProposalStatus {
    PROPOSAL_STATUS_UNSPECIFIED,
    PROPOSAL_STATUS_DEPOSIT_PERIOD,
    PROPOSAL_STATUS_VOTING_PERIOD,
    PROPOSAL_STATUS_PASSED,
    PROPOSAL_STATUS_REJECTED,
    PROPOSAL_STATUS_FAILED
  }


  // Solidity enum encoder
  function encode_ProposalStatus(ProposalStatus x) internal pure returns (int32) {
    
    if (x == ProposalStatus.PROPOSAL_STATUS_UNSPECIFIED) {
      return 0;
    }

    if (x == ProposalStatus.PROPOSAL_STATUS_DEPOSIT_PERIOD) {
      return 1;
    }

    if (x == ProposalStatus.PROPOSAL_STATUS_VOTING_PERIOD) {
      return 2;
    }

    if (x == ProposalStatus.PROPOSAL_STATUS_PASSED) {
      return 3;
    }

    if (x == ProposalStatus.PROPOSAL_STATUS_REJECTED) {
      return 4;
    }

    if (x == ProposalStatus.PROPOSAL_STATUS_FAILED) {
      return 5;
    }
    revert();
  }


  // Solidity enum decoder
  function decode_ProposalStatus(int64 x) internal pure returns (ProposalStatus) {
    
    if (x == 0) {
      return ProposalStatus.PROPOSAL_STATUS_UNSPECIFIED;
    }

    if (x == 1) {
      return ProposalStatus.PROPOSAL_STATUS_DEPOSIT_PERIOD;
    }

    if (x == 2) {
      return ProposalStatus.PROPOSAL_STATUS_VOTING_PERIOD;
    }

    if (x == 3) {
      return ProposalStatus.PROPOSAL_STATUS_PASSED;
    }

    if (x == 4) {
      return ProposalStatus.PROPOSAL_STATUS_REJECTED;
    }

    if (x == 5) {
      return ProposalStatus.PROPOSAL_STATUS_FAILED;
    }
    revert();
  }


  /**
   * @dev The estimator for an packed enum array
   * @return The number of bytes encoded
   */
  function estimate_packed_repeated_ProposalStatus(
    ProposalStatus[] memory a
  ) internal pure returns (uint256) {
    uint256 e = 0;
    for (uint i = 0; i < a.length; i++) {
      e += ProtoBufRuntime._sz_enum(encode_ProposalStatus(a[i]));
    }
    return e;
  }
}
//library COSMOS_GOV_V1_GOV_PROTO_GLOBAL_ENUMS
