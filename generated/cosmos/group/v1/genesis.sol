// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;
import "../../../ProtoBufRuntime.sol";
import "../../../GoogleProtobufAny.sol";
import "./types.sol";

library CosmosGroupV1GenesisState {


  //struct definition
  struct Data {
    uint64 group_seq;
    CosmosGroupV1GroupInfo.Data[] groups;
    CosmosGroupV1GroupMember.Data[] group_members;
    uint64 group_policy_seq;
    CosmosGroupV1GroupPolicyInfo.Data[] group_policies;
    uint64 proposal_seq;
    CosmosGroupV1Proposal.Data[] proposals;
    CosmosGroupV1Vote.Data[] votes;
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
        pointer += _read_group_seq(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_groups(pointer, bs, nil(), counters);
      } else
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_group_members(pointer, bs, nil(), counters);
      } else
      if (fieldId == 4) {
        pointer += _read_group_policy_seq(pointer, bs, r);
      } else
      if (fieldId == 5) {
        pointer += _read_unpacked_repeated_group_policies(pointer, bs, nil(), counters);
      } else
      if (fieldId == 6) {
        pointer += _read_proposal_seq(pointer, bs, r);
      } else
      if (fieldId == 7) {
        pointer += _read_unpacked_repeated_proposals(pointer, bs, nil(), counters);
      } else
      if (fieldId == 8) {
        pointer += _read_unpacked_repeated_votes(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[2] > 0) {
      require(r.groups.length == 0);
      r.groups = new CosmosGroupV1GroupInfo.Data[](counters[2]);
    }
    if (counters[3] > 0) {
      require(r.group_members.length == 0);
      r.group_members = new CosmosGroupV1GroupMember.Data[](counters[3]);
    }
    if (counters[5] > 0) {
      require(r.group_policies.length == 0);
      r.group_policies = new CosmosGroupV1GroupPolicyInfo.Data[](counters[5]);
    }
    if (counters[7] > 0) {
      require(r.proposals.length == 0);
      r.proposals = new CosmosGroupV1Proposal.Data[](counters[7]);
    }
    if (counters[8] > 0) {
      require(r.votes.length == 0);
      r.votes = new CosmosGroupV1Vote.Data[](counters[8]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_groups(pointer, bs, r, counters);
      } else
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_group_members(pointer, bs, r, counters);
      } else
      if (fieldId == 5) {
        pointer += _read_unpacked_repeated_group_policies(pointer, bs, r, counters);
      } else
      if (fieldId == 7) {
        pointer += _read_unpacked_repeated_proposals(pointer, bs, r, counters);
      } else
      if (fieldId == 8) {
        pointer += _read_unpacked_repeated_votes(pointer, bs, r, counters);
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
  function _read_group_seq(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.group_seq = x;
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
  function _read_unpacked_repeated_groups(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[9] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosGroupV1GroupInfo.Data memory x, uint256 sz) = _decode_CosmosGroupV1GroupInfo(p, bs);
    if (isNil(r)) {
      counters[2] += 1;
    } else {
      r.groups[r.groups.length - counters[2]] = x;
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
  function _read_unpacked_repeated_group_members(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[9] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosGroupV1GroupMember.Data memory x, uint256 sz) = _decode_CosmosGroupV1GroupMember(p, bs);
    if (isNil(r)) {
      counters[3] += 1;
    } else {
      r.group_members[r.group_members.length - counters[3]] = x;
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
  function _read_group_policy_seq(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.group_policy_seq = x;
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
  function _read_unpacked_repeated_group_policies(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[9] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosGroupV1GroupPolicyInfo.Data memory x, uint256 sz) = _decode_CosmosGroupV1GroupPolicyInfo(p, bs);
    if (isNil(r)) {
      counters[5] += 1;
    } else {
      r.group_policies[r.group_policies.length - counters[5]] = x;
      counters[5] -= 1;
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
  function _read_proposal_seq(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.proposal_seq = x;
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
  function _read_unpacked_repeated_proposals(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[9] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosGroupV1Proposal.Data memory x, uint256 sz) = _decode_CosmosGroupV1Proposal(p, bs);
    if (isNil(r)) {
      counters[7] += 1;
    } else {
      r.proposals[r.proposals.length - counters[7]] = x;
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
  function _read_unpacked_repeated_votes(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[9] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosGroupV1Vote.Data memory x, uint256 sz) = _decode_CosmosGroupV1Vote(p, bs);
    if (isNil(r)) {
      counters[8] += 1;
    } else {
      r.votes[r.votes.length - counters[8]] = x;
      counters[8] -= 1;
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
  function _decode_CosmosGroupV1GroupInfo(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosGroupV1GroupInfo.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosGroupV1GroupInfo.Data memory r, ) = CosmosGroupV1GroupInfo._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosGroupV1GroupMember(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosGroupV1GroupMember.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosGroupV1GroupMember.Data memory r, ) = CosmosGroupV1GroupMember._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosGroupV1GroupPolicyInfo(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosGroupV1GroupPolicyInfo.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosGroupV1GroupPolicyInfo.Data memory r, ) = CosmosGroupV1GroupPolicyInfo._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosGroupV1Proposal(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosGroupV1Proposal.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosGroupV1Proposal.Data memory r, ) = CosmosGroupV1Proposal._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosGroupV1Vote(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosGroupV1Vote.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosGroupV1Vote.Data memory r, ) = CosmosGroupV1Vote._decode(pointer, bs, sz);
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
    if (r.group_seq != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.group_seq, pointer, bs);
    }
    if (r.groups.length != 0) {
    for(i = 0; i < r.groups.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        2,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosGroupV1GroupInfo._encode_nested(r.groups[i], pointer, bs);
    }
    }
    if (r.group_members.length != 0) {
    for(i = 0; i < r.group_members.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        3,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosGroupV1GroupMember._encode_nested(r.group_members[i], pointer, bs);
    }
    }
    if (r.group_policy_seq != 0) {
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.group_policy_seq, pointer, bs);
    }
    if (r.group_policies.length != 0) {
    for(i = 0; i < r.group_policies.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        5,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosGroupV1GroupPolicyInfo._encode_nested(r.group_policies[i], pointer, bs);
    }
    }
    if (r.proposal_seq != 0) {
    pointer += ProtoBufRuntime._encode_key(
      6,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.proposal_seq, pointer, bs);
    }
    if (r.proposals.length != 0) {
    for(i = 0; i < r.proposals.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        7,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosGroupV1Proposal._encode_nested(r.proposals[i], pointer, bs);
    }
    }
    if (r.votes.length != 0) {
    for(i = 0; i < r.votes.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        8,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosGroupV1Vote._encode_nested(r.votes[i], pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_uint64(r.group_seq);
    for(i = 0; i < r.groups.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosGroupV1GroupInfo._estimate(r.groups[i]));
    }
    for(i = 0; i < r.group_members.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosGroupV1GroupMember._estimate(r.group_members[i]));
    }
    e += 1 + ProtoBufRuntime._sz_uint64(r.group_policy_seq);
    for(i = 0; i < r.group_policies.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosGroupV1GroupPolicyInfo._estimate(r.group_policies[i]));
    }
    e += 1 + ProtoBufRuntime._sz_uint64(r.proposal_seq);
    for(i = 0; i < r.proposals.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosGroupV1Proposal._estimate(r.proposals[i]));
    }
    for(i = 0; i < r.votes.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosGroupV1Vote._estimate(r.votes[i]));
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.group_seq != 0) {
    return false;
  }

  if (r.groups.length != 0) {
    return false;
  }

  if (r.group_members.length != 0) {
    return false;
  }

  if (r.group_policy_seq != 0) {
    return false;
  }

  if (r.group_policies.length != 0) {
    return false;
  }

  if (r.proposal_seq != 0) {
    return false;
  }

  if (r.proposals.length != 0) {
    return false;
  }

  if (r.votes.length != 0) {
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
    output.group_seq = input.group_seq;

    for(uint256 i2 = 0; i2 < input.groups.length; i2++) {
      output.groups.push(input.groups[i2]);
    }
    

    for(uint256 i3 = 0; i3 < input.group_members.length; i3++) {
      output.group_members.push(input.group_members[i3]);
    }
    
    output.group_policy_seq = input.group_policy_seq;

    for(uint256 i5 = 0; i5 < input.group_policies.length; i5++) {
      output.group_policies.push(input.group_policies[i5]);
    }
    
    output.proposal_seq = input.proposal_seq;

    for(uint256 i7 = 0; i7 < input.proposals.length; i7++) {
      output.proposals.push(input.proposals[i7]);
    }
    

    for(uint256 i8 = 0; i8 < input.votes.length; i8++) {
      output.votes.push(input.votes[i8]);
    }
    

  }


  //array helpers for Groups
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addGroups(Data memory self, CosmosGroupV1GroupInfo.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosGroupV1GroupInfo.Data[] memory tmp = new CosmosGroupV1GroupInfo.Data[](self.groups.length + 1);
    for (uint256 i = 0; i < self.groups.length; i++) {
      tmp[i] = self.groups[i];
    }
    tmp[self.groups.length] = value;
    self.groups = tmp;
  }

  //array helpers for GroupMembers
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addGroupMembers(Data memory self, CosmosGroupV1GroupMember.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosGroupV1GroupMember.Data[] memory tmp = new CosmosGroupV1GroupMember.Data[](self.group_members.length + 1);
    for (uint256 i = 0; i < self.group_members.length; i++) {
      tmp[i] = self.group_members[i];
    }
    tmp[self.group_members.length] = value;
    self.group_members = tmp;
  }

  //array helpers for GroupPolicies
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addGroupPolicies(Data memory self, CosmosGroupV1GroupPolicyInfo.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosGroupV1GroupPolicyInfo.Data[] memory tmp = new CosmosGroupV1GroupPolicyInfo.Data[](self.group_policies.length + 1);
    for (uint256 i = 0; i < self.group_policies.length; i++) {
      tmp[i] = self.group_policies[i];
    }
    tmp[self.group_policies.length] = value;
    self.group_policies = tmp;
  }

  //array helpers for Proposals
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addProposals(Data memory self, CosmosGroupV1Proposal.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosGroupV1Proposal.Data[] memory tmp = new CosmosGroupV1Proposal.Data[](self.proposals.length + 1);
    for (uint256 i = 0; i < self.proposals.length; i++) {
      tmp[i] = self.proposals[i];
    }
    tmp[self.proposals.length] = value;
    self.proposals = tmp;
  }

  //array helpers for Votes
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addVotes(Data memory self, CosmosGroupV1Vote.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosGroupV1Vote.Data[] memory tmp = new CosmosGroupV1Vote.Data[](self.votes.length + 1);
    for (uint256 i = 0; i < self.votes.length; i++) {
      tmp[i] = self.votes[i];
    }
    tmp[self.votes.length] = value;
    self.votes = tmp;
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
//library CosmosGroupV1GenesisState