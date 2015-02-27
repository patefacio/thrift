part of thrift.protocol;

class TJsonProtocol implements TProtocol {
  TJsonProtocol(this._transport);

  TTransport get transport => _transport;
  // custom <class TJsonProtocol>

  bool readBool() => throw 'TBD';
  int readByte() => throw 'TBD';
  double readDouble() => throw 'TBD';
  TField readFieldBegin() => throw 'TBD';
  void readFieldEnd() => throw 'TBD';
  int readI16() => throw 'TBD';
  int readI32() => throw 'TBD';
  int readI64() => throw 'TBD';
  TList readListBegin() => throw 'TBD';
  void readListEnd() => throw 'TBD';
  TMap readMapBegin() => throw 'TBD';
  void readMapEnd() => throw 'TBD';
  TMessage readMessageBegin() => throw 'TBD';
  void readMessageEnd() => throw 'TBD';
  TSet readSetBegin() => throw 'TBD';
  void readSetEnd() => throw 'TBD';
  String readString() => throw 'TBD';
  TStruct readStructBegin() => throw 'TBD';
  void readStructEnd() => throw 'TBD';
  void reset() => throw 'TBD';

  void writeBinary(ByteBuffer) => throw 'TBD';
  void writeBool(bool) => throw 'TBD';
  void writeByte(int) => throw 'TBD';
  void writeDouble(double) => throw 'TBD';
  void writeFieldBegin(TField) => throw 'TBD';
  void writeFieldEnd() => throw 'TBD';
  void writeI16(int) => throw 'TBD';
  void writeI32(int) => throw 'TBD';
  void writeI64(int) => throw 'TBD';
  void writeListBegin(TList) => throw 'TBD';
  void writeListEnd() => throw 'TBD';
  void writeMapBegin(TMap) => throw 'TBD';
  void writeMapEnd() => throw 'TBD';
  void writeMessageBegin(TMessage) => throw 'TBD';
  void writeMessageEnd() => throw 'TBD';
  void writeSetBegin(TSet) => throw 'TBD';
  void writeSetEnd() => throw 'TBD';
  void writeString() => throw 'TBD';
  void writeStructBegin(TStruct) => throw 'TBD';
  void writeStructEnd() => throw 'TBD';

  // end <class TJsonProtocol>
  TTransport _transport;
}
// custom <part json>
// end <part json>
