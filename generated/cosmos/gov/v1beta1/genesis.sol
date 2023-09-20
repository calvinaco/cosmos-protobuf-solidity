// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;
import "../../../ProtoBufRuntime.sol";
import "../../../GoogleProtobufAny.sol";
import "./gov.sol";

library CosmosGovV1beta1GenesisState {


  //struct definition
  struct Data {
    uint64 starting_proposal_id;
    CosmosGovV1beta1Deposit.Data[] deposits;
    CosmosGovV1beta1Vote.Data[] votes;
    CosmosGovV1beta1Proposal.Data[] proposals;
    CosmosGovV1beta1DepositParams.Data deposit_params;
    CosmosGovV1beta1VotingParams.Data voting_params;
    CosmosGovV1beta1TallyParams.Data tally_params;
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
    uint[8] memory counters;
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_starting_proposal_id(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_deposits(pointer, bs, nil(), counters);
      } else
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_votes(pointer, bs, nil(), counters);
      } else
      if (fieldId == 4) {
        pointer += _read_unpacked_repeated_proposals(pointer, bs, nil(), counters);
      } else
      if (fieldId == 5) {
        pointer += _read_deposit_params(pointer, bs, r);
      } else
      if (fieldId == 6) {
        pointer += _read_voting_params(pointer, bs, r);
      } else
      if (fieldId == 7) {
        pointer += _read_tally_params(pointer, bs, r);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[2] > 0) {
      require(r.deposits.length == 0);
      r.deposits = new CosmosGovV1beta1Deposit.Data[](counters[2]);
    }
    if (counters[3] > 0) {
      require(r.votes.length == 0);
      r.votes = new CosmosGovV1beta1Vote.Data[](counters[3]);
    }
    if (counters[4] > 0) {
      require(r.proposals.length == 0);
      r.proposals = new CosmosGovV1beta1Proposal.Data[](counters[4]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_deposits(pointer, bs, r, counters);
      } else
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_votes(pointer, bs, r, counters);
      } else
      if (fieldId == 4) {
        pointer += _read_unpacked_repeated_proposals(pointer, bs, r, counters);
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
  function _read_starting_proposal_id(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.starting_proposal_id = x;
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
  function _read_unpacked_repeated_deposits(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[8] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosGovV1beta1Deposit.Data memory x, uint256 sz) = _decode_CosmosGovV1beta1Deposit(p, bs);
    if (isNil(r)) {
      counters[2] += 1;
    } else {
      r.deposits[r.deposits.length - counters[2]] = x;
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
  function _read_unpacked_repeated_votes(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[8] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosGovV1beta1Vote.Data memory x, uint256 sz) = _decode_CosmosGovV1beta1Vote(p, bs);
    if (isNil(r)) {
      counters[3] += 1;
    } else {
      r.votes[r.votes.length - counters[3]] = x;
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
  function _read_unpacked_repeated_proposals(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[8] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosGovV1beta1Proposal.Data memory x, uint256 sz) = _decode_CosmosGovV1beta1Proposal(p, bs);
    if (isNil(r)) {
      counters[4] += 1;
    } else {
      r.proposals[r.proposals.length - counters[4]] = x;
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
  function _read_deposit_params(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosGovV1beta1DepositParams.Data memory x, uint256 sz) = _decode_CosmosGovV1beta1DepositParams(p, bs);
    r.deposit_params = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_voting_params(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosGovV1beta1VotingParams.Data memory x, uint256 sz) = _decode_CosmosGovV1beta1VotingParams(p, bs);
    r.voting_params = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_tally_params(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosGovV1beta1TallyParams.Data memory x, uint256 sz) = _decode_CosmosGovV1beta1TallyParams(p, bs);
    r.tally_params = x;
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
  function _decode_CosmosGovV1beta1Deposit(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosGovV1beta1Deposit.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosGovV1beta1Deposit.Data memory r, ) = CosmosGovV1beta1Deposit._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosGovV1beta1Vote(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosGovV1beta1Vote.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosGovV1beta1Vote.Data memory r, ) = CosmosGovV1beta1Vote._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosGovV1beta1Proposal(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosGovV1beta1Proposal.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosGovV1beta1Proposal.Data memory r, ) = CosmosGovV1beta1Proposal._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosGovV1beta1DepositParams(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosGovV1beta1DepositParams.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosGovV1beta1DepositParams.Data memory r, ) = CosmosGovV1beta1DepositParams._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosGovV1beta1VotingParams(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosGovV1beta1VotingParams.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosGovV1beta1VotingParams.Data memory r, ) = CosmosGovV1beta1VotingParams._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosGovV1beta1TallyParams(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosGovV1beta1TallyParams.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosGovV1beta1TallyParams.Data memory r, ) = CosmosGovV1beta1TallyParams._decode(pointer, bs, sz);
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
    if (r.starting_proposal_id != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.starting_proposal_id, pointer, bs);
    }
    if (r.deposits.length != 0) {
    for(i = 0; i < r.deposits.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        2,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosGovV1beta1Deposit._encode_nested(r.deposits[i], pointer, bs);
    }
    }
    if (r.votes.length != 0) {
    for(i = 0; i < r.votes.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        3,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosGovV1beta1Vote._encode_nested(r.votes[i], pointer, bs);
    }
    }
    if (r.proposals.length != 0) {
    for(i = 0; i < r.proposals.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        4,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosGovV1beta1Proposal._encode_nested(r.proposals[i], pointer, bs);
    }
    }
    
    pointer += ProtoBufRuntime._encode_key(
      5,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosGovV1beta1DepositParams._encode_nested(r.deposit_params, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      6,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosGovV1beta1VotingParams._encode_nested(r.voting_params, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      7,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosGovV1beta1TallyParams._encode_nested(r.tally_params, pointer, bs);
    
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
    e += 1 + ProtoBufRuntime._sz_uint64(r.starting_proposal_id);
    for(i = 0; i < r.deposits.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosGovV1beta1Deposit._estimate(r.deposits[i]));
    }
    for(i = 0; i < r.votes.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosGovV1beta1Vote._estimate(r.votes[i]));
    }
    for(i = 0; i < r.proposals.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosGovV1beta1Proposal._estimate(r.proposals[i]));
    }
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosGovV1beta1DepositParams._estimate(r.deposit_params));
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosGovV1beta1VotingParams._estimate(r.voting_params));
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosGovV1beta1TallyParams._estimate(r.tally_params));
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.starting_proposal_id != 0) {
    return false;
  }

  if (r.deposits.length != 0) {
    return false;
  }

  if (r.votes.length != 0) {
    return false;
  }

  if (r.proposals.length != 0) {
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
    output.starting_proposal_id = input.starting_proposal_id;

    for(uint256 i2 = 0; i2 < input.deposits.length; i2++) {
      output.deposits.push(input.deposits[i2]);
    }
    

    for(uint256 i3 = 0; i3 < input.votes.length; i3++) {
      output.votes.push(input.votes[i3]);
    }
    

    for(uint256 i4 = 0; i4 < input.proposals.length; i4++) {
      output.proposals.push(input.proposals[i4]);
    }
    
    CosmosGovV1beta1DepositParams.store(input.deposit_params, output.deposit_params);
    CosmosGovV1beta1VotingParams.store(input.voting_params, output.voting_params);
    CosmosGovV1beta1TallyParams.store(input.tally_params, output.tally_params);

  }


  //array helpers for Deposits
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addDeposits(Data memory self, CosmosGovV1beta1Deposit.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosGovV1beta1Deposit.Data[] memory tmp = new CosmosGovV1beta1Deposit.Data[](self.deposits.length + 1);
    for (uint256 i = 0; i < self.deposits.length; i++) {
      tmp[i] = self.deposits[i];
    }
    tmp[self.deposits.length] = value;
    self.deposits = tmp;
  }

  //array helpers for Votes
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addVotes(Data memory self, CosmosGovV1beta1Vote.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosGovV1beta1Vote.Data[] memory tmp = new CosmosGovV1beta1Vote.Data[](self.votes.length + 1);
    for (uint256 i = 0; i < self.votes.length; i++) {
      tmp[i] = self.votes[i];
    }
    tmp[self.votes.length] = value;
    self.votes = tmp;
  }

  //array helpers for Proposals
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addProposals(Data memory self, CosmosGovV1beta1Proposal.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosGovV1beta1Proposal.Data[] memory tmp = new CosmosGovV1beta1Proposal.Data[](self.proposals.length + 1);
    for (uint256 i = 0; i < self.proposals.length; i++) {
      tmp[i] = self.proposals[i];
    }
    tmp[self.proposals.length] = value;
    self.proposals = tmp;
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
//library CosmosGovV1beta1GenesisState