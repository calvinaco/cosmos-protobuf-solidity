// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;
import "../../../../ProtoBufRuntime.sol";
import "../../../../GoogleProtobufAny.sol";
import "../../../../tendermint/abci/types.sol";

library CosmosBaseAbciV1beta1TxResponse {


  //struct definition
  struct Data {
    int64 height;
    string txhash;
    string codespace;
    uint32 code;
    string data;
    string raw_log;
    CosmosBaseAbciV1beta1ABCIMessageLog.Data[] logs;
    string info;
    int64 gas_wanted;
    int64 gas_used;
    GoogleProtobufAny.Data tx;
    string timestamp;
    TendermintAbciEvent.Data[] events;
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
    uint[14] memory counters;
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_height(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_txhash(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_codespace(pointer, bs, r);
      } else
      if (fieldId == 4) {
        pointer += _read_code(pointer, bs, r);
      } else
      if (fieldId == 5) {
        pointer += _read_data(pointer, bs, r);
      } else
      if (fieldId == 6) {
        pointer += _read_raw_log(pointer, bs, r);
      } else
      if (fieldId == 7) {
        pointer += _read_unpacked_repeated_logs(pointer, bs, nil(), counters);
      } else
      if (fieldId == 8) {
        pointer += _read_info(pointer, bs, r);
      } else
      if (fieldId == 9) {
        pointer += _read_gas_wanted(pointer, bs, r);
      } else
      if (fieldId == 10) {
        pointer += _read_gas_used(pointer, bs, r);
      } else
      if (fieldId == 11) {
        pointer += _read_tx(pointer, bs, r);
      } else
      if (fieldId == 12) {
        pointer += _read_timestamp(pointer, bs, r);
      } else
      if (fieldId == 13) {
        pointer += _read_unpacked_repeated_events(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[7] > 0) {
      require(r.logs.length == 0);
      r.logs = new CosmosBaseAbciV1beta1ABCIMessageLog.Data[](counters[7]);
    }
    if (counters[13] > 0) {
      require(r.events.length == 0);
      r.events = new TendermintAbciEvent.Data[](counters[13]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 7) {
        pointer += _read_unpacked_repeated_logs(pointer, bs, r, counters);
      } else
      if (fieldId == 13) {
        pointer += _read_unpacked_repeated_events(pointer, bs, r, counters);
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
  function _read_txhash(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.txhash = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_codespace(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.codespace = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_code(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint32 x, uint256 sz) = ProtoBufRuntime._decode_uint32(p, bs);
    r.code = x;
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
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
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
  function _read_raw_log(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.raw_log = x;
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
  function _read_unpacked_repeated_logs(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[14] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosBaseAbciV1beta1ABCIMessageLog.Data memory x, uint256 sz) = _decode_CosmosBaseAbciV1beta1ABCIMessageLog(p, bs);
    if (isNil(r)) {
      counters[7] += 1;
    } else {
      r.logs[r.logs.length - counters[7]] = x;
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
  function _read_info(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.info = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_gas_wanted(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 x, uint256 sz) = ProtoBufRuntime._decode_int64(p, bs);
    r.gas_wanted = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_gas_used(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 x, uint256 sz) = ProtoBufRuntime._decode_int64(p, bs);
    r.gas_used = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_tx(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (GoogleProtobufAny.Data memory x, uint256 sz) = _decode_GoogleProtobufAny(p, bs);
    r.tx = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_timestamp(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.timestamp = x;
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
  function _read_unpacked_repeated_events(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[14] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (TendermintAbciEvent.Data memory x, uint256 sz) = _decode_TendermintAbciEvent(p, bs);
    if (isNil(r)) {
      counters[13] += 1;
    } else {
      r.events[r.events.length - counters[13]] = x;
      counters[13] -= 1;
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
  function _decode_CosmosBaseAbciV1beta1ABCIMessageLog(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBaseAbciV1beta1ABCIMessageLog.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBaseAbciV1beta1ABCIMessageLog.Data memory r, ) = CosmosBaseAbciV1beta1ABCIMessageLog._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

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
  function _decode_TendermintAbciEvent(uint256 p, bytes memory bs)
    internal
    pure
    returns (TendermintAbciEvent.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (TendermintAbciEvent.Data memory r, ) = TendermintAbciEvent._decode(pointer, bs, sz);
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
    if (r.height != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_int64(r.height, pointer, bs);
    }
    if (bytes(r.txhash).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.txhash, pointer, bs);
    }
    if (bytes(r.codespace).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.codespace, pointer, bs);
    }
    if (r.code != 0) {
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint32(r.code, pointer, bs);
    }
    if (bytes(r.data).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      5,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.data, pointer, bs);
    }
    if (bytes(r.raw_log).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      6,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.raw_log, pointer, bs);
    }
    if (r.logs.length != 0) {
    for(i = 0; i < r.logs.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        7,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosBaseAbciV1beta1ABCIMessageLog._encode_nested(r.logs[i], pointer, bs);
    }
    }
    if (bytes(r.info).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      8,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.info, pointer, bs);
    }
    if (r.gas_wanted != 0) {
    pointer += ProtoBufRuntime._encode_key(
      9,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_int64(r.gas_wanted, pointer, bs);
    }
    if (r.gas_used != 0) {
    pointer += ProtoBufRuntime._encode_key(
      10,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_int64(r.gas_used, pointer, bs);
    }
    
    pointer += ProtoBufRuntime._encode_key(
      11,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += GoogleProtobufAny._encode_nested(r.tx, pointer, bs);
    
    if (bytes(r.timestamp).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      12,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.timestamp, pointer, bs);
    }
    if (r.events.length != 0) {
    for(i = 0; i < r.events.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        13,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += TendermintAbciEvent._encode_nested(r.events[i], pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_int64(r.height);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.txhash).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.codespace).length);
    e += 1 + ProtoBufRuntime._sz_uint32(r.code);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.data).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.raw_log).length);
    for(i = 0; i < r.logs.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseAbciV1beta1ABCIMessageLog._estimate(r.logs[i]));
    }
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.info).length);
    e += 1 + ProtoBufRuntime._sz_int64(r.gas_wanted);
    e += 1 + ProtoBufRuntime._sz_int64(r.gas_used);
    e += 1 + ProtoBufRuntime._sz_lendelim(GoogleProtobufAny._estimate(r.tx));
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.timestamp).length);
    for(i = 0; i < r.events.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(TendermintAbciEvent._estimate(r.events[i]));
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.height != 0) {
    return false;
  }

  if (bytes(r.txhash).length != 0) {
    return false;
  }

  if (bytes(r.codespace).length != 0) {
    return false;
  }

  if (r.code != 0) {
    return false;
  }

  if (bytes(r.data).length != 0) {
    return false;
  }

  if (bytes(r.raw_log).length != 0) {
    return false;
  }

  if (r.logs.length != 0) {
    return false;
  }

  if (bytes(r.info).length != 0) {
    return false;
  }

  if (r.gas_wanted != 0) {
    return false;
  }

  if (r.gas_used != 0) {
    return false;
  }

  if (bytes(r.timestamp).length != 0) {
    return false;
  }

  if (r.events.length != 0) {
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
    output.height = input.height;
    output.txhash = input.txhash;
    output.codespace = input.codespace;
    output.code = input.code;
    output.data = input.data;
    output.raw_log = input.raw_log;

    for(uint256 i7 = 0; i7 < input.logs.length; i7++) {
      output.logs.push(input.logs[i7]);
    }
    
    output.info = input.info;
    output.gas_wanted = input.gas_wanted;
    output.gas_used = input.gas_used;
    GoogleProtobufAny.store(input.tx, output.tx);
    output.timestamp = input.timestamp;

    for(uint256 i13 = 0; i13 < input.events.length; i13++) {
      output.events.push(input.events[i13]);
    }
    

  }


  //array helpers for Logs
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addLogs(Data memory self, CosmosBaseAbciV1beta1ABCIMessageLog.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosBaseAbciV1beta1ABCIMessageLog.Data[] memory tmp = new CosmosBaseAbciV1beta1ABCIMessageLog.Data[](self.logs.length + 1);
    for (uint256 i = 0; i < self.logs.length; i++) {
      tmp[i] = self.logs[i];
    }
    tmp[self.logs.length] = value;
    self.logs = tmp;
  }

  //array helpers for Events
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addEvents(Data memory self, TendermintAbciEvent.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    TendermintAbciEvent.Data[] memory tmp = new TendermintAbciEvent.Data[](self.events.length + 1);
    for (uint256 i = 0; i < self.events.length; i++) {
      tmp[i] = self.events[i];
    }
    tmp[self.events.length] = value;
    self.events = tmp;
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
//library CosmosBaseAbciV1beta1TxResponse

library CosmosBaseAbciV1beta1ABCIMessageLog {


  //struct definition
  struct Data {
    uint32 msg_index;
    string log;
    CosmosBaseAbciV1beta1StringEvent.Data[] events;
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
        pointer += _read_msg_index(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_log(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_events(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[3] > 0) {
      require(r.events.length == 0);
      r.events = new CosmosBaseAbciV1beta1StringEvent.Data[](counters[3]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_events(pointer, bs, r, counters);
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
  function _read_msg_index(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint32 x, uint256 sz) = ProtoBufRuntime._decode_uint32(p, bs);
    r.msg_index = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_log(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.log = x;
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
  function _read_unpacked_repeated_events(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[4] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosBaseAbciV1beta1StringEvent.Data memory x, uint256 sz) = _decode_CosmosBaseAbciV1beta1StringEvent(p, bs);
    if (isNil(r)) {
      counters[3] += 1;
    } else {
      r.events[r.events.length - counters[3]] = x;
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
  function _decode_CosmosBaseAbciV1beta1StringEvent(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBaseAbciV1beta1StringEvent.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBaseAbciV1beta1StringEvent.Data memory r, ) = CosmosBaseAbciV1beta1StringEvent._decode(pointer, bs, sz);
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
    if (r.msg_index != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint32(r.msg_index, pointer, bs);
    }
    if (bytes(r.log).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.log, pointer, bs);
    }
    if (r.events.length != 0) {
    for(i = 0; i < r.events.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        3,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosBaseAbciV1beta1StringEvent._encode_nested(r.events[i], pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_uint32(r.msg_index);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.log).length);
    for(i = 0; i < r.events.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseAbciV1beta1StringEvent._estimate(r.events[i]));
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.msg_index != 0) {
    return false;
  }

  if (bytes(r.log).length != 0) {
    return false;
  }

  if (r.events.length != 0) {
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
    output.msg_index = input.msg_index;
    output.log = input.log;

    for(uint256 i3 = 0; i3 < input.events.length; i3++) {
      output.events.push(input.events[i3]);
    }
    

  }


  //array helpers for Events
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addEvents(Data memory self, CosmosBaseAbciV1beta1StringEvent.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosBaseAbciV1beta1StringEvent.Data[] memory tmp = new CosmosBaseAbciV1beta1StringEvent.Data[](self.events.length + 1);
    for (uint256 i = 0; i < self.events.length; i++) {
      tmp[i] = self.events[i];
    }
    tmp[self.events.length] = value;
    self.events = tmp;
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
//library CosmosBaseAbciV1beta1ABCIMessageLog

library CosmosBaseAbciV1beta1StringEvent {


  //struct definition
  struct Data {
    string f_type;
    CosmosBaseAbciV1beta1Attribute.Data[] attributes;
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
        pointer += _read_f_type(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_attributes(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[2] > 0) {
      require(r.attributes.length == 0);
      r.attributes = new CosmosBaseAbciV1beta1Attribute.Data[](counters[2]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_attributes(pointer, bs, r, counters);
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
  function _read_f_type(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.f_type = x;
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
  function _read_unpacked_repeated_attributes(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[3] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosBaseAbciV1beta1Attribute.Data memory x, uint256 sz) = _decode_CosmosBaseAbciV1beta1Attribute(p, bs);
    if (isNil(r)) {
      counters[2] += 1;
    } else {
      r.attributes[r.attributes.length - counters[2]] = x;
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
  function _decode_CosmosBaseAbciV1beta1Attribute(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBaseAbciV1beta1Attribute.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBaseAbciV1beta1Attribute.Data memory r, ) = CosmosBaseAbciV1beta1Attribute._decode(pointer, bs, sz);
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
    if (bytes(r.f_type).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.f_type, pointer, bs);
    }
    if (r.attributes.length != 0) {
    for(i = 0; i < r.attributes.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        2,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosBaseAbciV1beta1Attribute._encode_nested(r.attributes[i], pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.f_type).length);
    for(i = 0; i < r.attributes.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseAbciV1beta1Attribute._estimate(r.attributes[i]));
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.f_type).length != 0) {
    return false;
  }

  if (r.attributes.length != 0) {
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
    output.f_type = input.f_type;

    for(uint256 i2 = 0; i2 < input.attributes.length; i2++) {
      output.attributes.push(input.attributes[i2]);
    }
    

  }


  //array helpers for Attributes
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addAttributes(Data memory self, CosmosBaseAbciV1beta1Attribute.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosBaseAbciV1beta1Attribute.Data[] memory tmp = new CosmosBaseAbciV1beta1Attribute.Data[](self.attributes.length + 1);
    for (uint256 i = 0; i < self.attributes.length; i++) {
      tmp[i] = self.attributes[i];
    }
    tmp[self.attributes.length] = value;
    self.attributes = tmp;
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
//library CosmosBaseAbciV1beta1StringEvent

library CosmosBaseAbciV1beta1Attribute {


  //struct definition
  struct Data {
    string key;
    string value;
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
        pointer += _read_key(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_value(pointer, bs, r);
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
  function _read_key(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.key = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_value(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.value = x;
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
    
    if (bytes(r.key).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.key, pointer, bs);
    }
    if (bytes(r.value).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.value, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.key).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.value).length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.key).length != 0) {
    return false;
  }

  if (bytes(r.value).length != 0) {
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
    output.key = input.key;
    output.value = input.value;

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
//library CosmosBaseAbciV1beta1Attribute

library CosmosBaseAbciV1beta1GasInfo {


  //struct definition
  struct Data {
    uint64 gas_wanted;
    uint64 gas_used;
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
        pointer += _read_gas_wanted(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_gas_used(pointer, bs, r);
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
  function _read_gas_wanted(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.gas_wanted = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_gas_used(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.gas_used = x;
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
    
    if (r.gas_wanted != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.gas_wanted, pointer, bs);
    }
    if (r.gas_used != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.gas_used, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_uint64(r.gas_wanted);
    e += 1 + ProtoBufRuntime._sz_uint64(r.gas_used);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.gas_wanted != 0) {
    return false;
  }

  if (r.gas_used != 0) {
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
    output.gas_wanted = input.gas_wanted;
    output.gas_used = input.gas_used;

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
//library CosmosBaseAbciV1beta1GasInfo

library CosmosBaseAbciV1beta1Result {


  //struct definition
  struct Data {
    bytes data;
    string log;
    TendermintAbciEvent.Data[] events;
    GoogleProtobufAny.Data[] msg_responses;
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
        pointer += _read_data(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_log(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_events(pointer, bs, nil(), counters);
      } else
      if (fieldId == 4) {
        pointer += _read_unpacked_repeated_msg_responses(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[3] > 0) {
      require(r.events.length == 0);
      r.events = new TendermintAbciEvent.Data[](counters[3]);
    }
    if (counters[4] > 0) {
      require(r.msg_responses.length == 0);
      r.msg_responses = new GoogleProtobufAny.Data[](counters[4]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 3) {
        pointer += _read_unpacked_repeated_events(pointer, bs, r, counters);
      } else
      if (fieldId == 4) {
        pointer += _read_unpacked_repeated_msg_responses(pointer, bs, r, counters);
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
  function _read_data(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
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
  function _read_log(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.log = x;
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
  function _read_unpacked_repeated_events(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[5] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (TendermintAbciEvent.Data memory x, uint256 sz) = _decode_TendermintAbciEvent(p, bs);
    if (isNil(r)) {
      counters[3] += 1;
    } else {
      r.events[r.events.length - counters[3]] = x;
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
  function _read_unpacked_repeated_msg_responses(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[5] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (GoogleProtobufAny.Data memory x, uint256 sz) = _decode_GoogleProtobufAny(p, bs);
    if (isNil(r)) {
      counters[4] += 1;
    } else {
      r.msg_responses[r.msg_responses.length - counters[4]] = x;
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
  function _decode_TendermintAbciEvent(uint256 p, bytes memory bs)
    internal
    pure
    returns (TendermintAbciEvent.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (TendermintAbciEvent.Data memory r, ) = TendermintAbciEvent._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

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
    if (r.data.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.data, pointer, bs);
    }
    if (bytes(r.log).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.log, pointer, bs);
    }
    if (r.events.length != 0) {
    for(i = 0; i < r.events.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        3,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += TendermintAbciEvent._encode_nested(r.events[i], pointer, bs);
    }
    }
    if (r.msg_responses.length != 0) {
    for(i = 0; i < r.msg_responses.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        4,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += GoogleProtobufAny._encode_nested(r.msg_responses[i], pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_lendelim(r.data.length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.log).length);
    for(i = 0; i < r.events.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(TendermintAbciEvent._estimate(r.events[i]));
    }
    for(i = 0; i < r.msg_responses.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(GoogleProtobufAny._estimate(r.msg_responses[i]));
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.data.length != 0) {
    return false;
  }

  if (bytes(r.log).length != 0) {
    return false;
  }

  if (r.events.length != 0) {
    return false;
  }

  if (r.msg_responses.length != 0) {
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
    output.data = input.data;
    output.log = input.log;

    for(uint256 i3 = 0; i3 < input.events.length; i3++) {
      output.events.push(input.events[i3]);
    }
    

    for(uint256 i4 = 0; i4 < input.msg_responses.length; i4++) {
      output.msg_responses.push(input.msg_responses[i4]);
    }
    

  }


  //array helpers for Events
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addEvents(Data memory self, TendermintAbciEvent.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    TendermintAbciEvent.Data[] memory tmp = new TendermintAbciEvent.Data[](self.events.length + 1);
    for (uint256 i = 0; i < self.events.length; i++) {
      tmp[i] = self.events[i];
    }
    tmp[self.events.length] = value;
    self.events = tmp;
  }

  //array helpers for MsgResponses
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addMsgResponses(Data memory self, GoogleProtobufAny.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    GoogleProtobufAny.Data[] memory tmp = new GoogleProtobufAny.Data[](self.msg_responses.length + 1);
    for (uint256 i = 0; i < self.msg_responses.length; i++) {
      tmp[i] = self.msg_responses[i];
    }
    tmp[self.msg_responses.length] = value;
    self.msg_responses = tmp;
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
//library CosmosBaseAbciV1beta1Result

library CosmosBaseAbciV1beta1SimulationResponse {


  //struct definition
  struct Data {
    CosmosBaseAbciV1beta1GasInfo.Data gas_info;
    CosmosBaseAbciV1beta1Result.Data result;
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
        pointer += _read_gas_info(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_result(pointer, bs, r);
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
  function _read_gas_info(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosBaseAbciV1beta1GasInfo.Data memory x, uint256 sz) = _decode_CosmosBaseAbciV1beta1GasInfo(p, bs);
    r.gas_info = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_result(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (CosmosBaseAbciV1beta1Result.Data memory x, uint256 sz) = _decode_CosmosBaseAbciV1beta1Result(p, bs);
    r.result = x;
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
  function _decode_CosmosBaseAbciV1beta1GasInfo(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBaseAbciV1beta1GasInfo.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBaseAbciV1beta1GasInfo.Data memory r, ) = CosmosBaseAbciV1beta1GasInfo._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_CosmosBaseAbciV1beta1Result(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBaseAbciV1beta1Result.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBaseAbciV1beta1Result.Data memory r, ) = CosmosBaseAbciV1beta1Result._decode(pointer, bs, sz);
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
    pointer += CosmosBaseAbciV1beta1GasInfo._encode_nested(r.gas_info, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += CosmosBaseAbciV1beta1Result._encode_nested(r.result, pointer, bs);
    
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
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseAbciV1beta1GasInfo._estimate(r.gas_info));
    e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseAbciV1beta1Result._estimate(r.result));
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
    CosmosBaseAbciV1beta1GasInfo.store(input.gas_info, output.gas_info);
    CosmosBaseAbciV1beta1Result.store(input.result, output.result);

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
//library CosmosBaseAbciV1beta1SimulationResponse

library CosmosBaseAbciV1beta1MsgData {


  //struct definition
  struct Data {
    string msg_type;
    bytes data;
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
        pointer += _read_msg_type(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_data(pointer, bs, r);
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
  function _read_msg_type(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.msg_type = x;
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
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.data = x;
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
    
    if (bytes(r.msg_type).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.msg_type, pointer, bs);
    }
    if (r.data.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.data, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.msg_type).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(r.data.length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.msg_type).length != 0) {
    return false;
  }

  if (r.data.length != 0) {
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
    output.msg_type = input.msg_type;
    output.data = input.data;

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
//library CosmosBaseAbciV1beta1MsgData

library CosmosBaseAbciV1beta1TxMsgData {


  //struct definition
  struct Data {
    CosmosBaseAbciV1beta1MsgData.Data[] data;
    GoogleProtobufAny.Data[] msg_responses;
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
        pointer += _read_unpacked_repeated_data(pointer, bs, nil(), counters);
      } else
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_msg_responses(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[1] > 0) {
      require(r.data.length == 0);
      r.data = new CosmosBaseAbciV1beta1MsgData.Data[](counters[1]);
    }
    if (counters[2] > 0) {
      require(r.msg_responses.length == 0);
      r.msg_responses = new GoogleProtobufAny.Data[](counters[2]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_unpacked_repeated_data(pointer, bs, r, counters);
      } else
      if (fieldId == 2) {
        pointer += _read_unpacked_repeated_msg_responses(pointer, bs, r, counters);
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
  function _read_unpacked_repeated_data(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[3] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosBaseAbciV1beta1MsgData.Data memory x, uint256 sz) = _decode_CosmosBaseAbciV1beta1MsgData(p, bs);
    if (isNil(r)) {
      counters[1] += 1;
    } else {
      r.data[r.data.length - counters[1]] = x;
      counters[1] -= 1;
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
  function _read_unpacked_repeated_msg_responses(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[3] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (GoogleProtobufAny.Data memory x, uint256 sz) = _decode_GoogleProtobufAny(p, bs);
    if (isNil(r)) {
      counters[2] += 1;
    } else {
      r.msg_responses[r.msg_responses.length - counters[2]] = x;
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
  function _decode_CosmosBaseAbciV1beta1MsgData(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBaseAbciV1beta1MsgData.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBaseAbciV1beta1MsgData.Data memory r, ) = CosmosBaseAbciV1beta1MsgData._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

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
    if (r.data.length != 0) {
    for(i = 0; i < r.data.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        1,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosBaseAbciV1beta1MsgData._encode_nested(r.data[i], pointer, bs);
    }
    }
    if (r.msg_responses.length != 0) {
    for(i = 0; i < r.msg_responses.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        2,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += GoogleProtobufAny._encode_nested(r.msg_responses[i], pointer, bs);
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
    for(i = 0; i < r.data.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseAbciV1beta1MsgData._estimate(r.data[i]));
    }
    for(i = 0; i < r.msg_responses.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(GoogleProtobufAny._estimate(r.msg_responses[i]));
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.data.length != 0) {
    return false;
  }

  if (r.msg_responses.length != 0) {
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

    for(uint256 i1 = 0; i1 < input.data.length; i1++) {
      output.data.push(input.data[i1]);
    }
    

    for(uint256 i2 = 0; i2 < input.msg_responses.length; i2++) {
      output.msg_responses.push(input.msg_responses[i2]);
    }
    

  }


  //array helpers for Data
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addData(Data memory self, CosmosBaseAbciV1beta1MsgData.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosBaseAbciV1beta1MsgData.Data[] memory tmp = new CosmosBaseAbciV1beta1MsgData.Data[](self.data.length + 1);
    for (uint256 i = 0; i < self.data.length; i++) {
      tmp[i] = self.data[i];
    }
    tmp[self.data.length] = value;
    self.data = tmp;
  }

  //array helpers for MsgResponses
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addMsgResponses(Data memory self, GoogleProtobufAny.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    GoogleProtobufAny.Data[] memory tmp = new GoogleProtobufAny.Data[](self.msg_responses.length + 1);
    for (uint256 i = 0; i < self.msg_responses.length; i++) {
      tmp[i] = self.msg_responses[i];
    }
    tmp[self.msg_responses.length] = value;
    self.msg_responses = tmp;
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
//library CosmosBaseAbciV1beta1TxMsgData

library CosmosBaseAbciV1beta1SearchTxsResult {


  //struct definition
  struct Data {
    uint64 total_count;
    uint64 count;
    uint64 page_number;
    uint64 page_total;
    uint64 limit;
    CosmosBaseAbciV1beta1TxResponse.Data[] txs;
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
    uint[7] memory counters;
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_total_count(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_count(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_page_number(pointer, bs, r);
      } else
      if (fieldId == 4) {
        pointer += _read_page_total(pointer, bs, r);
      } else
      if (fieldId == 5) {
        pointer += _read_limit(pointer, bs, r);
      } else
      if (fieldId == 6) {
        pointer += _read_unpacked_repeated_txs(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[6] > 0) {
      require(r.txs.length == 0);
      r.txs = new CosmosBaseAbciV1beta1TxResponse.Data[](counters[6]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 6) {
        pointer += _read_unpacked_repeated_txs(pointer, bs, r, counters);
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
  function _read_total_count(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.total_count = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_count(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.count = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_page_number(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.page_number = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_page_total(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.page_total = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_limit(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.limit = x;
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
  function _read_unpacked_repeated_txs(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[7] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (CosmosBaseAbciV1beta1TxResponse.Data memory x, uint256 sz) = _decode_CosmosBaseAbciV1beta1TxResponse(p, bs);
    if (isNil(r)) {
      counters[6] += 1;
    } else {
      r.txs[r.txs.length - counters[6]] = x;
      counters[6] -= 1;
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
  function _decode_CosmosBaseAbciV1beta1TxResponse(uint256 p, bytes memory bs)
    internal
    pure
    returns (CosmosBaseAbciV1beta1TxResponse.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (CosmosBaseAbciV1beta1TxResponse.Data memory r, ) = CosmosBaseAbciV1beta1TxResponse._decode(pointer, bs, sz);
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
    if (r.total_count != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.total_count, pointer, bs);
    }
    if (r.count != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.count, pointer, bs);
    }
    if (r.page_number != 0) {
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.page_number, pointer, bs);
    }
    if (r.page_total != 0) {
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.page_total, pointer, bs);
    }
    if (r.limit != 0) {
    pointer += ProtoBufRuntime._encode_key(
      5,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.limit, pointer, bs);
    }
    if (r.txs.length != 0) {
    for(i = 0; i < r.txs.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        6,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += CosmosBaseAbciV1beta1TxResponse._encode_nested(r.txs[i], pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_uint64(r.total_count);
    e += 1 + ProtoBufRuntime._sz_uint64(r.count);
    e += 1 + ProtoBufRuntime._sz_uint64(r.page_number);
    e += 1 + ProtoBufRuntime._sz_uint64(r.page_total);
    e += 1 + ProtoBufRuntime._sz_uint64(r.limit);
    for(i = 0; i < r.txs.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(CosmosBaseAbciV1beta1TxResponse._estimate(r.txs[i]));
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.total_count != 0) {
    return false;
  }

  if (r.count != 0) {
    return false;
  }

  if (r.page_number != 0) {
    return false;
  }

  if (r.page_total != 0) {
    return false;
  }

  if (r.limit != 0) {
    return false;
  }

  if (r.txs.length != 0) {
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
    output.total_count = input.total_count;
    output.count = input.count;
    output.page_number = input.page_number;
    output.page_total = input.page_total;
    output.limit = input.limit;

    for(uint256 i6 = 0; i6 < input.txs.length; i6++) {
      output.txs.push(input.txs[i6]);
    }
    

  }


  //array helpers for Txs
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addTxs(Data memory self, CosmosBaseAbciV1beta1TxResponse.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    CosmosBaseAbciV1beta1TxResponse.Data[] memory tmp = new CosmosBaseAbciV1beta1TxResponse.Data[](self.txs.length + 1);
    for (uint256 i = 0; i < self.txs.length; i++) {
      tmp[i] = self.txs[i];
    }
    tmp[self.txs.length] = value;
    self.txs = tmp;
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
//library CosmosBaseAbciV1beta1SearchTxsResult