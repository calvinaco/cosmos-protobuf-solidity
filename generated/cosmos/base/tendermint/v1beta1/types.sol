// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;
import "../../../../ProtoBufRuntime.sol";
import "../../../../GoogleProtobufTimestamp.sol";
import "../../../../GoogleProtobufAny.sol";
import "../../../../tendermint/types/types.sol";
import "../../../../tendermint/types/evidence.sol";
import "../../../../tendermint/version/types.sol";

library CosmosBaseTendermintV1beta1Block {


  //struct definition
  struct Data {
    CosmosBaseTendermintV1beta1Header.Data header;
    TendermintTypesData.Data data;
    TendermintTypesEvidenceList.Data evidence;
    TendermintTypesCommit.Data last_commit;
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
        pointer += _read_header(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_data(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_evidence(pointer, bs, r);
      } else
      if (fieldId == 4) {
        pointer += _read_last_commit(pointer, bs, r);
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
  function _read_header(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosBaseTendermintV1beta1Header.Data memory x, uint256 sz) = _decode_CosmosBaseTendermintV1beta1Header(p, bs);
    r.header = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_data(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (TendermintTypesData.Data memory x, uint256 sz) = _decode_TendermintTypesData(p, bs);
    r.data = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_evidence(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (TendermintTypesEvidenceList.Data memory x, uint256 sz) = _decode_TendermintTypesEvidenceList(p, bs);
    r.evidence = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_last_commit(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (TendermintTypesCommit.Data memory x, uint256 sz) = _decode_TendermintTypesCommit(p, bs);
    r.last_commit = x;
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
  function _decode_CosmosBaseTendermintV1beta1Header(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBaseTendermintV1beta1Header.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBaseTendermintV1beta1Header.Data memory r, ) = CosmosBaseTendermintV1beta1Header._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_TendermintTypesData(uint256 p, bytes memory bs)
    internal
    pure
    returns (TendermintTypesData.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (TendermintTypesData.Data memory r, ) = TendermintTypesData._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_TendermintTypesEvidenceList(uint256 p, bytes memory bs)
    internal
    pure
    returns (TendermintTypesEvidenceList.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (TendermintTypesEvidenceList.Data memory r, ) = TendermintTypesEvidenceList._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_TendermintTypesCommit(uint256 p, bytes memory bs)
    internal
    pure
    returns (TendermintTypesCommit.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (TendermintTypesCommit.Data memory r, ) = TendermintTypesCommit._decode(pointer, bs, sz);
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
    pointer += CosmosBaseTendermintV1beta1Header._encode_nested(r.header, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += TendermintTypesData._encode_nested(r.data, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += TendermintTypesEvidenceList._encode_nested(r.evidence, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += TendermintTypesCommit._encode_nested(r.last_commit, pointer, bs);
    
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
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseTendermintV1beta1Header._estimate(r.header));
    e += 1 + ProtoBufRuntime._sz_lendelim(TendermintTypesData._estimate(r.data));
    e += 1 + ProtoBufRuntime._sz_lendelim(TendermintTypesEvidenceList._estimate(r.evidence));
    e += 1 + ProtoBufRuntime._sz_lendelim(TendermintTypesCommit._estimate(r.last_commit));
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
    CosmosBaseTendermintV1beta1Header.store(input.header, output.header);
    TendermintTypesData.store(input.data, output.data);
    TendermintTypesEvidenceList.store(input.evidence, output.evidence);
    TendermintTypesCommit.store(input.last_commit, output.last_commit);

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
//library CosmosBaseTendermintV1beta1Block

library CosmosBaseTendermintV1beta1Header {


  //struct definition
  struct Data {
    TendermintVersionConsensus.Data version;
    string chain_id;
    int64 height;
    GoogleProtobufTimestamp.Data time;
    TendermintTypesBlockID.Data last_block_id;
    bytes last_commit_hash;
    bytes data_hash;
    bytes validators_hash;
    bytes next_validators_hash;
    bytes consensus_hash;
    bytes app_hash;
    bytes last_results_hash;
    bytes evidence_hash;
    string proposer_address;
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
        pointer += _read_version(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_chain_id(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_height(pointer, bs, r);
      } else
      if (fieldId == 4) {
        pointer += _read_time(pointer, bs, r);
      } else
      if (fieldId == 5) {
        pointer += _read_last_block_id(pointer, bs, r);
      } else
      if (fieldId == 6) {
        pointer += _read_last_commit_hash(pointer, bs, r);
      } else
      if (fieldId == 7) {
        pointer += _read_data_hash(pointer, bs, r);
      } else
      if (fieldId == 8) {
        pointer += _read_validators_hash(pointer, bs, r);
      } else
      if (fieldId == 9) {
        pointer += _read_next_validators_hash(pointer, bs, r);
      } else
      if (fieldId == 10) {
        pointer += _read_consensus_hash(pointer, bs, r);
      } else
      if (fieldId == 11) {
        pointer += _read_app_hash(pointer, bs, r);
      } else
      if (fieldId == 12) {
        pointer += _read_last_results_hash(pointer, bs, r);
      } else
      if (fieldId == 13) {
        pointer += _read_evidence_hash(pointer, bs, r);
      } else
      if (fieldId == 14) {
        pointer += _read_proposer_address(pointer, bs, r);
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
  function _read_version(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (TendermintVersionConsensus.Data memory x, uint256 sz) = _decode_TendermintVersionConsensus(p, bs);
    r.version = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_chain_id(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.chain_id = x;
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
    (int64 x, uint256 sz) = ProtoBufRuntime._decode_int64(p, bs);
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
  function _read_time(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (GoogleProtobufTimestamp.Data memory x, uint256 sz) = _decode_GoogleProtobufTimestamp(p, bs);
    r.time = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_last_block_id(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (TendermintTypesBlockID.Data memory x, uint256 sz) = _decode_TendermintTypesBlockID(p, bs);
    r.last_block_id = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_last_commit_hash(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.last_commit_hash = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_data_hash(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.data_hash = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_validators_hash(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.validators_hash = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_next_validators_hash(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.next_validators_hash = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_consensus_hash(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.consensus_hash = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_app_hash(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.app_hash = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_last_results_hash(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.last_results_hash = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_evidence_hash(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.evidence_hash = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_proposer_address(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.proposer_address = x;
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
  function _decode_TendermintVersionConsensus(uint256 p, bytes memory bs)
    internal
    pure
    returns (TendermintVersionConsensus.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (TendermintVersionConsensus.Data memory r, ) = TendermintVersionConsensus._decode(pointer, bs, sz);
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
  function _decode_TendermintTypesBlockID(uint256 p, bytes memory bs)
    internal
    pure
    returns (TendermintTypesBlockID.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (TendermintTypesBlockID.Data memory r, ) = TendermintTypesBlockID._decode(pointer, bs, sz);
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
    pointer += TendermintVersionConsensus._encode_nested(r.version, pointer, bs);
    
    if (bytes(r.chain_id).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.chain_id, pointer, bs);
    }
    if (r.height != 0) {
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_int64(r.height, pointer, bs);
    }
    
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += GoogleProtobufTimestamp._encode_nested(r.time, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      5,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += TendermintTypesBlockID._encode_nested(r.last_block_id, pointer, bs);
    
    if (r.last_commit_hash.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      6,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.last_commit_hash, pointer, bs);
    }
    if (r.data_hash.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      7,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.data_hash, pointer, bs);
    }
    if (r.validators_hash.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      8,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.validators_hash, pointer, bs);
    }
    if (r.next_validators_hash.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      9,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.next_validators_hash, pointer, bs);
    }
    if (r.consensus_hash.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      10,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.consensus_hash, pointer, bs);
    }
    if (r.app_hash.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      11,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.app_hash, pointer, bs);
    }
    if (r.last_results_hash.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      12,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.last_results_hash, pointer, bs);
    }
    if (r.evidence_hash.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      13,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.evidence_hash, pointer, bs);
    }
    if (bytes(r.proposer_address).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      14,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.proposer_address, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_lendelim(TendermintVersionConsensus._estimate(r.version));
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.chain_id).length);
    e += 1 + ProtoBufRuntime._sz_int64(r.height);
    e += 1 + ProtoBufRuntime._sz_lendelim(GoogleProtobufTimestamp._estimate(r.time));
    e += 1 + ProtoBufRuntime._sz_lendelim(TendermintTypesBlockID._estimate(r.last_block_id));
    e += 1 + ProtoBufRuntime._sz_lendelim(r.last_commit_hash.length);
    e += 1 + ProtoBufRuntime._sz_lendelim(r.data_hash.length);
    e += 1 + ProtoBufRuntime._sz_lendelim(r.validators_hash.length);
    e += 1 + ProtoBufRuntime._sz_lendelim(r.next_validators_hash.length);
    e += 1 + ProtoBufRuntime._sz_lendelim(r.consensus_hash.length);
    e += 1 + ProtoBufRuntime._sz_lendelim(r.app_hash.length);
    e += 1 + ProtoBufRuntime._sz_lendelim(r.last_results_hash.length);
    e += 1 + ProtoBufRuntime._sz_lendelim(r.evidence_hash.length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.proposer_address).length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.chain_id).length != 0) {
    return false;
  }

  if (r.height != 0) {
    return false;
  }

  if (r.last_commit_hash.length != 0) {
    return false;
  }

  if (r.data_hash.length != 0) {
    return false;
  }

  if (r.validators_hash.length != 0) {
    return false;
  }

  if (r.next_validators_hash.length != 0) {
    return false;
  }

  if (r.consensus_hash.length != 0) {
    return false;
  }

  if (r.app_hash.length != 0) {
    return false;
  }

  if (r.last_results_hash.length != 0) {
    return false;
  }

  if (r.evidence_hash.length != 0) {
    return false;
  }

  if (bytes(r.proposer_address).length != 0) {
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
    TendermintVersionConsensus.store(input.version, output.version);
    output.chain_id = input.chain_id;
    output.height = input.height;
    GoogleProtobufTimestamp.store(input.time, output.time);
    TendermintTypesBlockID.store(input.last_block_id, output.last_block_id);
    output.last_commit_hash = input.last_commit_hash;
    output.data_hash = input.data_hash;
    output.validators_hash = input.validators_hash;
    output.next_validators_hash = input.next_validators_hash;
    output.consensus_hash = input.consensus_hash;
    output.app_hash = input.app_hash;
    output.last_results_hash = input.last_results_hash;
    output.evidence_hash = input.evidence_hash;
    output.proposer_address = input.proposer_address;

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
//library CosmosBaseTendermintV1beta1Header
