// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;
import "../../../ProtoBufRuntime.sol";
import "../../../GoogleProtobufAny.sol";
import "../../../cosmos_proto/cosmos.sol";
import "../../base/v1beta1/coin.sol";

library CosmosStakingV1beta1StakeAuthorization {


  //struct definition
  struct Data {
    CosmosBaseV1beta1Coin.Data max_tokens;
    CosmosStakingV1beta1StakeAuthorizationValidators.Data allow_list;
    CosmosStakingV1beta1StakeAuthorizationValidators.Data deny_list;
    COSMOS_STAKING_V1BETA1_AUTHZ_PROTO_GLOBAL_ENUMS.AuthorizationType authorization_type;
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
        pointer += _read_max_tokens(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_allow_list(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_deny_list(pointer, bs, r);
      } else
      if (fieldId == 4) {
        pointer += _read_authorization_type(pointer, bs, r);
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
  function _read_max_tokens(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosBaseV1beta1Coin.Data memory x, uint256 sz) = _decode_CosmosBaseV1beta1Coin(p, bs);
    r.max_tokens = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_allow_list(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosStakingV1beta1StakeAuthorizationValidators.Data memory x, uint256 sz) = _decode_CosmosStakingV1beta1StakeAuthorizationValidators(p, bs);
    r.allow_list = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_deny_list(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosStakingV1beta1StakeAuthorizationValidators.Data memory x, uint256 sz) = _decode_CosmosStakingV1beta1StakeAuthorizationValidators(p, bs);
    r.deny_list = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_authorization_type(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 tmp, uint256 sz) = ProtoBufRuntime._decode_enum(p, bs);
    COSMOS_STAKING_V1BETA1_AUTHZ_PROTO_GLOBAL_ENUMS.AuthorizationType x = COSMOS_STAKING_V1BETA1_AUTHZ_PROTO_GLOBAL_ENUMS.decode_AuthorizationType(tmp);
    r.authorization_type = x;
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
  function _decode_CosmosStakingV1beta1StakeAuthorizationValidators(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosStakingV1beta1StakeAuthorizationValidators.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosStakingV1beta1StakeAuthorizationValidators.Data memory r, ) = CosmosStakingV1beta1StakeAuthorizationValidators._decode(pointer, bs, sz);
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
    pointer += CosmosBaseV1beta1Coin._encode_nested(r.max_tokens, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosStakingV1beta1StakeAuthorizationValidators._encode_nested(r.allow_list, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosStakingV1beta1StakeAuthorizationValidators._encode_nested(r.deny_list, pointer, bs);
    
    if (uint(r.authorization_type) != 0) {
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    int32 _enum_authorization_type = COSMOS_STAKING_V1BETA1_AUTHZ_PROTO_GLOBAL_ENUMS.encode_AuthorizationType(r.authorization_type);
    pointer += ProtoBufRuntime._encode_enum(_enum_authorization_type, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseV1beta1Coin._estimate(r.max_tokens));
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosStakingV1beta1StakeAuthorizationValidators._estimate(r.allow_list));
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosStakingV1beta1StakeAuthorizationValidators._estimate(r.deny_list));
    e += 1 + ProtoBufRuntime._sz_enum(COSMOS_STAKING_V1BETA1_AUTHZ_PROTO_GLOBAL_ENUMS.encode_AuthorizationType(r.authorization_type));
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (uint(r.authorization_type) != 0) {
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
    CosmosBaseV1beta1Coin.store(input.max_tokens, output.max_tokens);
    CosmosStakingV1beta1StakeAuthorizationValidators.store(input.allow_list, output.allow_list);
    CosmosStakingV1beta1StakeAuthorizationValidators.store(input.deny_list, output.deny_list);
    output.authorization_type = input.authorization_type;

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
//library CosmosStakingV1beta1StakeAuthorization

library CosmosStakingV1beta1StakeAuthorizationValidators {


  //struct definition
  struct Data {
    string[] f_address;
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
    uint[2] memory counters;
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_unpacked_repeated_f_address(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[1] > 0) {
      require(r.f_address.length == 0);
      r.f_address = new string[](counters[1]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_unpacked_repeated_f_address(pointer, bs, r, counters);
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
  function _read_unpacked_repeated_f_address(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[2] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    if (isNil(r)) {
      counters[1] += 1;
    } else {
      r.f_address[r.f_address.length - counters[1]] = x;
      counters[1] -= 1;
    }
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
    uint256 i;
    if (r.f_address.length != 0) {
    for(i = 0; i < r.f_address.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        1,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += ProtoBufRuntime._encode_string(r.f_address[i], pointer, bs);
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
    for(i = 0; i < r.f_address.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.f_address[i]).length);
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.f_address.length != 0) {
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

  }


  //array helpers for FAddress
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addFAddress(Data memory self, string memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    string[] memory tmp = new string[](self.f_address.length + 1);
    for (uint256 i = 0; i < self.f_address.length; i++) {
      tmp[i] = self.f_address[i];
    }
    tmp[self.f_address.length] = value;
    self.f_address = tmp;
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
//library CosmosStakingV1beta1StakeAuthorizationValidators

library COSMOS_STAKING_V1BETA1_AUTHZ_PROTO_GLOBAL_ENUMS {

  //enum definition
  // Solidity enum definitions
  enum AuthorizationType {
    AUTHORIZATION_TYPE_UNSPECIFIED,
    AUTHORIZATION_TYPE_DELEGATE,
    AUTHORIZATION_TYPE_UNDELEGATE,
    AUTHORIZATION_TYPE_REDELEGATE
  }


  // Solidity enum encoder
  function encode_AuthorizationType(AuthorizationType x) internal pure returns (int32) {
    
    if (x == AuthorizationType.AUTHORIZATION_TYPE_UNSPECIFIED) {
      return 0;
    }

    if (x == AuthorizationType.AUTHORIZATION_TYPE_DELEGATE) {
      return 1;
    }

    if (x == AuthorizationType.AUTHORIZATION_TYPE_UNDELEGATE) {
      return 2;
    }

    if (x == AuthorizationType.AUTHORIZATION_TYPE_REDELEGATE) {
      return 3;
    }
    revert();
  }


  // Solidity enum decoder
  function decode_AuthorizationType(int64 x) internal pure returns (AuthorizationType) {
    
    if (x == 0) {
      return AuthorizationType.AUTHORIZATION_TYPE_UNSPECIFIED;
    }

    if (x == 1) {
      return AuthorizationType.AUTHORIZATION_TYPE_DELEGATE;
    }

    if (x == 2) {
      return AuthorizationType.AUTHORIZATION_TYPE_UNDELEGATE;
    }

    if (x == 3) {
      return AuthorizationType.AUTHORIZATION_TYPE_REDELEGATE;
    }
    revert();
  }


  /**
   * @dev The estimator for an packed enum array
   * @return The number of bytes encoded
   */
  function estimate_packed_repeated_AuthorizationType(
    AuthorizationType[] memory a
  ) internal pure returns (uint256) {
    uint256 e = 0;
    for (uint i = 0; i < a.length; i++) {
      e += ProtoBufRuntime._sz_enum(encode_AuthorizationType(a[i]));
    }
    return e;
  }
}
//library COSMOS_STAKING_V1BETA1_AUTHZ_PROTO_GLOBAL_ENUMS