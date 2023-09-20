// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;
import "../../../ProtoBufRuntime.sol";
import "../../../GoogleProtobufAny.sol";
import "./staking.sol";
import "../../../cosmos_proto/cosmos.sol";

library CosmosStakingV1beta1GenesisState {


  //struct definition
  struct Data {
    CosmosStakingV1beta1Params.Data params;
    bytes last_total_power;
    CosmosStakingV1beta1LastValidatorPower.Data[] last_validator_powers;
    CosmosStakingV1beta1Validator.Data[] validators;
    CosmosStakingV1beta1Delegation.Data[] delegations;
    CosmosStakingV1beta1UnbondingDelegation.Data[] unbonding_delegations;
    CosmosStakingV1beta1Redelegation.Data[] redelegations;
    bool exported;
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
    uint[9] memory counters;
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
        pointer += _read_last_total_power(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_last_validator_powers(pointer, bs, nil(), counters);
      } else
      if (fieldId == 4) {
        pointer += _read_unpacked_repeated_validators(pointer, bs, nil(), counters);
      } else
      if (fieldId == 5) {
        pointer += _read_unpacked_repeated_delegations(pointer, bs, nil(), counters);
      } else
      if (fieldId == 6) {
        pointer += _read_unpacked_repeated_unbonding_delegations(pointer, bs, nil(), counters);
      } else
      if (fieldId == 7) {
        pointer += _read_unpacked_repeated_redelegations(pointer, bs, nil(), counters);
      } else
      if (fieldId == 8) {
        pointer += _read_exported(pointer, bs, r);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[3] > 0) {
      require(r.last_validator_powers.length == 0);
      r.last_validator_powers = new CosmosStakingV1beta1LastValidatorPower.Data[](counters[3]);
    }
    if (counters[4] > 0) {
      require(r.validators.length == 0);
      r.validators = new CosmosStakingV1beta1Validator.Data[](counters[4]);
    }
    if (counters[5] > 0) {
      require(r.delegations.length == 0);
      r.delegations = new CosmosStakingV1beta1Delegation.Data[](counters[5]);
    }
    if (counters[6] > 0) {
      require(r.unbonding_delegations.length == 0);
      r.unbonding_delegations = new CosmosStakingV1beta1UnbondingDelegation.Data[](counters[6]);
    }
    if (counters[7] > 0) {
      require(r.redelegations.length == 0);
      r.redelegations = new CosmosStakingV1beta1Redelegation.Data[](counters[7]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_last_validator_powers(pointer, bs, r, counters);
      } else
      if (fieldId == 4) {
        pointer += _read_unpacked_repeated_validators(pointer, bs, r, counters);
      } else
      if (fieldId == 5) {
        pointer += _read_unpacked_repeated_delegations(pointer, bs, r, counters);
      } else
      if (fieldId == 6) {
        pointer += _read_unpacked_repeated_unbonding_delegations(pointer, bs, r, counters);
      } else
      if (fieldId == 7) {
        pointer += _read_unpacked_repeated_redelegations(pointer, bs, r, counters);
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
    (CosmosStakingV1beta1Params.Data memory x, uint256 sz) = _decode_CosmosStakingV1beta1Params(p, bs);
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
  function _read_last_total_power(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.last_total_power = x;
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
  function _read_unpacked_repeated_last_validator_powers(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[9] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosStakingV1beta1LastValidatorPower.Data memory x, uint256 sz) = _decode_CosmosStakingV1beta1LastValidatorPower(p, bs);
    if (isNil(r)) {
      counters[3] += 1;
    } else {
      r.last_validator_powers[r.last_validator_powers.length - counters[3]] = x;
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
  function _read_unpacked_repeated_validators(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[9] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosStakingV1beta1Validator.Data memory x, uint256 sz) = _decode_CosmosStakingV1beta1Validator(p, bs);
    if (isNil(r)) {
      counters[4] += 1;
    } else {
      r.validators[r.validators.length - counters[4]] = x;
      counters[4] -= 1;
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
  function _read_unpacked_repeated_delegations(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[9] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosStakingV1beta1Delegation.Data memory x, uint256 sz) = _decode_CosmosStakingV1beta1Delegation(p, bs);
    if (isNil(r)) {
      counters[5] += 1;
    } else {
      r.delegations[r.delegations.length - counters[5]] = x;
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
  function _read_unpacked_repeated_unbonding_delegations(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[9] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosStakingV1beta1UnbondingDelegation.Data memory x, uint256 sz) = _decode_CosmosStakingV1beta1UnbondingDelegation(p, bs);
    if (isNil(r)) {
      counters[6] += 1;
    } else {
      r.unbonding_delegations[r.unbonding_delegations.length - counters[6]] = x;
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
  function _read_unpacked_repeated_redelegations(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[9] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosStakingV1beta1Redelegation.Data memory x, uint256 sz) = _decode_CosmosStakingV1beta1Redelegation(p, bs);
    if (isNil(r)) {
      counters[7] += 1;
    } else {
      r.redelegations[r.redelegations.length - counters[7]] = x;
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
  function _read_exported(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bool x, uint256 sz) = ProtoBufRuntime._decode_bool(p, bs);
    r.exported = x;
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
  function _decode_CosmosStakingV1beta1Params(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosStakingV1beta1Params.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosStakingV1beta1Params.Data memory r, ) = CosmosStakingV1beta1Params._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosStakingV1beta1LastValidatorPower(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosStakingV1beta1LastValidatorPower.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosStakingV1beta1LastValidatorPower.Data memory r, ) = CosmosStakingV1beta1LastValidatorPower._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosStakingV1beta1Validator(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosStakingV1beta1Validator.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosStakingV1beta1Validator.Data memory r, ) = CosmosStakingV1beta1Validator._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosStakingV1beta1Delegation(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosStakingV1beta1Delegation.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosStakingV1beta1Delegation.Data memory r, ) = CosmosStakingV1beta1Delegation._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosStakingV1beta1UnbondingDelegation(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosStakingV1beta1UnbondingDelegation.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosStakingV1beta1UnbondingDelegation.Data memory r, ) = CosmosStakingV1beta1UnbondingDelegation._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosStakingV1beta1Redelegation(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosStakingV1beta1Redelegation.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosStakingV1beta1Redelegation.Data memory r, ) = CosmosStakingV1beta1Redelegation._decode(pointer, bs, sz);
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
    pointer += CosmosStakingV1beta1Params._encode_nested(r.params, pointer, bs);
    
    if (r.last_total_power.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.last_total_power, pointer, bs);
    }
    if (r.last_validator_powers.length != 0) {
    for(i = 0; i < r.last_validator_powers.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        3,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosStakingV1beta1LastValidatorPower._encode_nested(r.last_validator_powers[i], pointer, bs);
    }
    }
    if (r.validators.length != 0) {
    for(i = 0; i < r.validators.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        4,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosStakingV1beta1Validator._encode_nested(r.validators[i], pointer, bs);
    }
    }
    if (r.delegations.length != 0) {
    for(i = 0; i < r.delegations.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        5,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosStakingV1beta1Delegation._encode_nested(r.delegations[i], pointer, bs);
    }
    }
    if (r.unbonding_delegations.length != 0) {
    for(i = 0; i < r.unbonding_delegations.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        6,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosStakingV1beta1UnbondingDelegation._encode_nested(r.unbonding_delegations[i], pointer, bs);
    }
    }
    if (r.redelegations.length != 0) {
    for(i = 0; i < r.redelegations.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        7,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosStakingV1beta1Redelegation._encode_nested(r.redelegations[i], pointer, bs);
    }
    }
    if (r.exported != false) {
    pointer += ProtoBufRuntime._encode_key(
      8,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bool(r.exported, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosStakingV1beta1Params._estimate(r.params));
    e += 1 + ProtoBufRuntime._sz_lendelim(r.last_total_power.length);
    for(i = 0; i < r.last_validator_powers.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosStakingV1beta1LastValidatorPower._estimate(r.last_validator_powers[i]));
    }
    for(i = 0; i < r.validators.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosStakingV1beta1Validator._estimate(r.validators[i]));
    }
    for(i = 0; i < r.delegations.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosStakingV1beta1Delegation._estimate(r.delegations[i]));
    }
    for(i = 0; i < r.unbonding_delegations.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosStakingV1beta1UnbondingDelegation._estimate(r.unbonding_delegations[i]));
    }
    for(i = 0; i < r.redelegations.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosStakingV1beta1Redelegation._estimate(r.redelegations[i]));
    }
    e += 1 + 1;
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.last_total_power.length != 0) {
    return false;
  }

  if (r.last_validator_powers.length != 0) {
    return false;
  }

  if (r.validators.length != 0) {
    return false;
  }

  if (r.delegations.length != 0) {
    return false;
  }

  if (r.unbonding_delegations.length != 0) {
    return false;
  }

  if (r.redelegations.length != 0) {
    return false;
  }

  if (r.exported != false) {
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
    CosmosStakingV1beta1Params.store(input.params, output.params);
    output.last_total_power = input.last_total_power;

    for(uint256 i3 = 0; i3 < input.last_validator_powers.length; i3++) {
      output.last_validator_powers.push(input.last_validator_powers[i3]);
    }
    

    for(uint256 i4 = 0; i4 < input.validators.length; i4++) {
      output.validators.push(input.validators[i4]);
    }
    

    for(uint256 i5 = 0; i5 < input.delegations.length; i5++) {
      output.delegations.push(input.delegations[i5]);
    }
    

    for(uint256 i6 = 0; i6 < input.unbonding_delegations.length; i6++) {
      output.unbonding_delegations.push(input.unbonding_delegations[i6]);
    }
    

    for(uint256 i7 = 0; i7 < input.redelegations.length; i7++) {
      output.redelegations.push(input.redelegations[i7]);
    }
    
    output.exported = input.exported;

  }


  //array helpers for LastValidatorPowers
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addLastValidatorPowers(Data memory self, CosmosStakingV1beta1LastValidatorPower.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosStakingV1beta1LastValidatorPower.Data[] memory tmp = new CosmosStakingV1beta1LastValidatorPower.Data[](self.last_validator_powers.length + 1);
    for (uint256 i = 0; i < self.last_validator_powers.length; i++) {
      tmp[i] = self.last_validator_powers[i];
    }
    tmp[self.last_validator_powers.length] = value;
    self.last_validator_powers = tmp;
  }

  //array helpers for Validators
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addValidators(Data memory self, CosmosStakingV1beta1Validator.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosStakingV1beta1Validator.Data[] memory tmp = new CosmosStakingV1beta1Validator.Data[](self.validators.length + 1);
    for (uint256 i = 0; i < self.validators.length; i++) {
      tmp[i] = self.validators[i];
    }
    tmp[self.validators.length] = value;
    self.validators = tmp;
  }

  //array helpers for Delegations
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addDelegations(Data memory self, CosmosStakingV1beta1Delegation.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosStakingV1beta1Delegation.Data[] memory tmp = new CosmosStakingV1beta1Delegation.Data[](self.delegations.length + 1);
    for (uint256 i = 0; i < self.delegations.length; i++) {
      tmp[i] = self.delegations[i];
    }
    tmp[self.delegations.length] = value;
    self.delegations = tmp;
  }

  //array helpers for UnbondingDelegations
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addUnbondingDelegations(Data memory self, CosmosStakingV1beta1UnbondingDelegation.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosStakingV1beta1UnbondingDelegation.Data[] memory tmp = new CosmosStakingV1beta1UnbondingDelegation.Data[](self.unbonding_delegations.length + 1);
    for (uint256 i = 0; i < self.unbonding_delegations.length; i++) {
      tmp[i] = self.unbonding_delegations[i];
    }
    tmp[self.unbonding_delegations.length] = value;
    self.unbonding_delegations = tmp;
  }

  //array helpers for Redelegations
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addRedelegations(Data memory self, CosmosStakingV1beta1Redelegation.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosStakingV1beta1Redelegation.Data[] memory tmp = new CosmosStakingV1beta1Redelegation.Data[](self.redelegations.length + 1);
    for (uint256 i = 0; i < self.redelegations.length; i++) {
      tmp[i] = self.redelegations[i];
    }
    tmp[self.redelegations.length] = value;
    self.redelegations = tmp;
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
//library CosmosStakingV1beta1GenesisState

library CosmosStakingV1beta1LastValidatorPower {


  //struct definition
  struct Data {
    string f_address;
    int64 power;
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
        pointer += _read_f_address(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_power(pointer, bs, r);
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
   * @return The number of bytes decoded
   */
  function _read_power(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 x, uint256 sz) = ProtoBufRuntime._decode_int64(p, bs);
    r.power = x;
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
    
    if (bytes(r.f_address).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.f_address, pointer, bs);
    }
    if (r.power != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_int64(r.power, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.f_address).length);
    e += 1 + ProtoBufRuntime._sz_int64(r.power);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.f_address).length != 0) {
    return false;
  }

  if (r.power != 0) {
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
    output.power = input.power;

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
//library CosmosStakingV1beta1LastValidatorPower