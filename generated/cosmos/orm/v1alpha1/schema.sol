// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;
import "../../../ProtoBufRuntime.sol";
import "../../../GoogleProtobufAny.sol";

library CosmosOrmV1alpha1ModuleSchemaDescriptor {


  //struct definition
  struct Data {
    CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry.Data[] schema_file;
    bytes prefix;
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
        pointer += _read_unpacked_repeated_schema_file(pointer, bs, nil(), counters);
      } else
      if (fieldId == 2) {
        pointer += _read_prefix(pointer, bs, r);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[1] > 0) {
      require(r.schema_file.length == 0);
      r.schema_file = new CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry.Data[](counters[1]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_unpacked_repeated_schema_file(pointer, bs, r, counters);
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
  function _read_unpacked_repeated_schema_file(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[3] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry.Data memory x, uint256 sz) = _decode_CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry(p, bs);
    if (isNil(r)) {
      counters[1] += 1;
    } else {
      r.schema_file[r.schema_file.length - counters[1]] = x;
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
  function _read_prefix(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.prefix = x;
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
  function _decode_CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry.Data memory r, ) = CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry._decode(pointer, bs, sz);
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
    if (r.schema_file.length != 0) {
    for(i = 0; i < r.schema_file.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        1,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry._encode_nested(r.schema_file[i], pointer, bs);
    }
    }
    if (r.prefix.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.prefix, pointer, bs);
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
    for(i = 0; i < r.schema_file.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry._estimate(r.schema_file[i]));
    }
    e += 1 + ProtoBufRuntime._sz_lendelim(r.prefix.length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.schema_file.length != 0) {
    return false;
  }

  if (r.prefix.length != 0) {
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

    for(uint256 i1 = 0; i1 < input.schema_file.length; i1++) {
      output.schema_file.push(input.schema_file[i1]);
    }
    
    output.prefix = input.prefix;

  }


  //array helpers for SchemaFile
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addSchemaFile(Data memory self, CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry.Data[] memory tmp = new CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry.Data[](self.schema_file.length + 1);
    for (uint256 i = 0; i < self.schema_file.length; i++) {
      tmp[i] = self.schema_file[i];
    }
    tmp[self.schema_file.length] = value;
    self.schema_file = tmp;
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
//library CosmosOrmV1alpha1ModuleSchemaDescriptor

library CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry {


  //struct definition
  struct Data {
    uint32 id;
    string proto_file_name;
    COSMOS/ORM/V1ALPHA1/SCHEMA_PROTO_GLOBAL_ENUMS.StorageType storage_type;
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
        pointer += _read_id(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_proto_file_name(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_storage_type(pointer, bs, r);
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
    (uint32 x, uint256 sz) = ProtoBufRuntime._decode_uint32(p, bs);
    r.id = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_proto_file_name(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.proto_file_name = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_storage_type(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 tmp, uint256 sz) = ProtoBufRuntime._decode_enum(p, bs);
    COSMOS/ORM/V1ALPHA1/SCHEMA_PROTO_GLOBAL_ENUMS.StorageType x = COSMOS/ORM/V1ALPHA1/SCHEMA_PROTO_GLOBAL_ENUMS.decode_StorageType(tmp);
    r.storage_type = x;
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
    
    if (r.id != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint32(r.id, pointer, bs);
    }
    if (bytes(r.proto_file_name).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.proto_file_name, pointer, bs);
    }
    if (uint(r.storage_type) != 0) {
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    int32 _enum_storage_type = COSMOS/ORM/V1ALPHA1/SCHEMA_PROTO_GLOBAL_ENUMS.encode_StorageType(r.storage_type);
    pointer += ProtoBufRuntime._encode_enum(_enum_storage_type, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_uint32(r.id);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.proto_file_name).length);
    e += 1 + ProtoBufRuntime._sz_enum(COSMOS/ORM/V1ALPHA1/SCHEMA_PROTO_GLOBAL_ENUMS.encode_StorageType(r.storage_type));
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.id != 0) {
    return false;
  }

  if (bytes(r.proto_file_name).length != 0) {
    return false;
  }

  if (uint(r.storage_type) != 0) {
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
    output.proto_file_name = input.proto_file_name;
    output.storage_type = input.storage_type;

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
//library CosmosOrmV1alpha1ModuleSchemaDescriptorFileEntry

library COSMOS/ORM/V1ALPHA1/SCHEMA_PROTO_GLOBAL_ENUMS {

  //enum definition
  // Solidity enum definitions
  enum StorageType {
    STORAGE_TYPE_DEFAULT_UNSPECIFIED,
    STORAGE_TYPE_MEMORY,
    STORAGE_TYPE_TRANSIENT,
    STORAGE_TYPE_INDEX,
    STORAGE_TYPE_COMMITMENT
  }


  // Solidity enum encoder
  function encode_StorageType(StorageType x) internal pure returns (int32) {
    
    if (x == StorageType.STORAGE_TYPE_DEFAULT_UNSPECIFIED) {
      return 0;
    }

    if (x == StorageType.STORAGE_TYPE_MEMORY) {
      return 1;
    }

    if (x == StorageType.STORAGE_TYPE_TRANSIENT) {
      return 2;
    }

    if (x == StorageType.STORAGE_TYPE_INDEX) {
      return 3;
    }

    if (x == StorageType.STORAGE_TYPE_COMMITMENT) {
      return 4;
    }
    revert();
  }


  // Solidity enum decoder
  function decode_StorageType(int64 x) internal pure returns (StorageType) {
    
    if (x == 0) {
      return StorageType.STORAGE_TYPE_DEFAULT_UNSPECIFIED;
    }

    if (x == 1) {
      return StorageType.STORAGE_TYPE_MEMORY;
    }

    if (x == 2) {
      return StorageType.STORAGE_TYPE_TRANSIENT;
    }

    if (x == 3) {
      return StorageType.STORAGE_TYPE_INDEX;
    }

    if (x == 4) {
      return StorageType.STORAGE_TYPE_COMMITMENT;
    }
    revert();
  }


  /**
   * @dev The estimator for an packed enum array
   * @return The number of bytes encoded
   */
  function estimate_packed_repeated_StorageType(
    StorageType[] memory a
  ) internal pure returns (uint256) {
    uint256 e = 0;
    for (uint i = 0; i < a.length; i++) {
      e += ProtoBufRuntime._sz_enum(encode_StorageType(a[i]));
    }
    return e;
  }
}
//library COSMOS/ORM/V1ALPHA1/SCHEMA_PROTO_GLOBAL_ENUMS